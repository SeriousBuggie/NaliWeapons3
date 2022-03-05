//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybot Dual Sentinel
//				Feralidragon (05-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDualSentinel expands Cybot;

#exec MESH IMPORT MESH=CybDualSentinelGun ANIVFILE=MODELS\CybDualSentinelGun_a.3d DATAFILE=MODELS\CybDualSentinelGun_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybDualSentinelGun STRENGTH=0.25
#exec MESH ORIGIN MESH=CybDualSentinelGun X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybDualSentinelGun SEQ=All STARTFRAME=0 NUMFRAMES=64
#exec MESH SEQUENCE MESH=CybDualSentinelGun SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybDualSentinelGun SEQ=Transform STARTFRAME=0 NUMFRAMES=28 RATE=27.0
#exec MESH SEQUENCE MESH=CybDualSentinelGun SEQ=UnTransform STARTFRAME=27 NUMFRAMES=28 RATE=27.0

//Fire
#exec MESH SEQUENCE MESH=CybDualSentinelGun SEQ=LeftFire STARTFRAME=55 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybDualSentinelGun SEQ=RightFire STARTFRAME=63 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybDualSentinelGun SEQ=BothFire STARTFRAME=71 NUMFRAMES=9 RATE=9.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybDualSentinelGun MESH=CybDualSentinelGun
#exec MESHMAP SCALE MESHMAP=CybDualSentinelGun X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=SentinelSk FILE=SKINS\SentinelSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybDualSentinelGun NUM=1 TEXTURE=SentinelSk

#exec TEXTURE IMPORT NAME=DualSentinelSk FILE=SKINS\DualSentinelSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybDualSentinelGun NUM=2 TEXTURE=DualSentinelSk

#exec MESHMAP SETTEXTURE MESHMAP=CybDualSentinelGun NUM=3 TEXTURE=TranslucInvis
#exec MESHMAP SETTEXTURE MESHMAP=CybDualSentinelGun NUM=4 TEXTURE=TranslucInvis


var() texture LaserTeam[4];
var() vector BlastFireOffsetLeft, BlastFireOffsetRight;
var bool bLeftFire;
var() float MaxEnemyAprox;

function setMaster(Pawn P)
{
	Super.setMaster(P);
	if (MasterPawn != None)
	{
		Health = Class'CybotLauncher'.default.CybotDualSentinelHealth;
		SetupHealth();
	}
}

simulated function SetTeamExtras(byte n)
{
	if (n > 3)	n = 0;
	MultiSkins[4] = LaserTeam[n];
}

function PlayFire(float rate, optional byte type)
{
	if (type == 1)
		PlayAnim('LeftFire', rate);
	else if (type == 2)
		PlayAnim('RightFire', rate);
	else
		PlayAnim('BothFire', rate);
}

function bool isInFireRange()
{
	if (Enemy == None)
		return False;
	return (FastTrace(Enemy.Location, Location));
}

simulated function AnimEnd()
{
	if (AnimSequence == 'Transform')
		TweenAnim('UnTransform', 0.1);
}


// --------- WAITING --------------
state Waiting
{
	function vector getWanderLook()
	{
	local rotator R;
	
		R.Yaw = Rotation.Yaw + (Rand(16384)*2 -  16384);
		return vector(R);
	}
	
Begin:
	Sleep(FRand()*1 + 1.0);
	if (ShouldBeAttacking()) GotoState('Attacking');
	TurnTo(Location + getWanderLook());
	Goto('Begin');
}


// --------- ATTACKING --------------
state Attacking
{
	function SpawnFireFX(optional byte side)
	{
	local CybAndroidFireOv o;
	
		if (side != 1)
		{
			o = Spawn(Class'CybDualSentinelFireOvR', Self);
			if (o != None) o.SetTeam(MyTeam, Self);
		}
		if (side != 2)
		{
			o = Spawn(Class'CybDualSentinelFireOvL', Self);
			if (o != None) o.SetTeam(MyTeam, Self);
		}
	}
	
Begin:
	if (!KeepEnemy() || !isInFireRange())
	{
		Enemy = None;
		if (!ShouldBeAttacking())
			GotoState('Waiting');
	}
	
	if (Enemy != None)
		TurnToward(Enemy);
	
	if (Enemy != None)
	{
		Enemy.Enemy = Self;
		if (VSize(Enemy.Location - Location) <= (MaxEnemyAprox + Enemy.CollisionRadius))
		{
			PlayFire(10);
			Sleep(0.0125);
			if (Enemy != None && CanFireProj(Normal(Enemy.Location - Location), 250))
			{
				FireProjectile( Location + (BlastFireOffsetLeft >> Rotation), Normal(Enemy.Location - Location));
				FireProjectile( Location + (BlastFireOffsetRight >> Rotation), Normal(Enemy.Location - Location));
				SpawnFireFX();
				Sleep(FireDelay - 0.0125);
			}
		}
		else
		{
			bLeftFire = !bLeftFire;
			if (bLeftFire)
			{
				PlayFire(10, 1);
				Sleep(0.0125);
				if (Enemy != None && CanFireProj(Normal(Enemy.Location - Location), 250))
				{
					FireProjectile( Location + (BlastFireOffsetLeft >> Rotation), Normal(Enemy.Location - Location));
					SpawnFireFX(1);
					Sleep(FireDelay/2 - 0.0125);
				}
			}
			else
			{
				PlayFire(10, 2);
				Sleep(0.0125);
				if (Enemy != None && CanFireProj(Normal(Enemy.Location - Location), 250))
				{
					FireProjectile( Location + (BlastFireOffsetRight >> Rotation), Normal(Enemy.Location - Location));
					SpawnFireFX(2);
					Sleep(FireDelay/2 - 0.0125);
				}
			}
		}
	}
	
	Goto('Begin');
}

// --------- BOOT UP --------------
state BootUp
{
Begin:
	if (ShouldBeAttacking()) 
		GotoState('Attacking');
	else
		GotoState('Waiting');
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDualSentinelGun
	CollisionHeight=12.000000
	CollisionRadius=14.000000
	RotationRate=(Pitch=50000,Yaw=50000,Roll=0)
	
	CoreSkinN=3
	MultiSkins(3)=CybotCoreRed
	bDodgeProj=False
	
	CybFXCoronas(0)=(CoronaClass=Class'CybDualSentinelCoronas',hasExtras=True,isTeamCenter=False,isTeamRing=True,bFlicker=False)
	CybFXCoronas(1)=(CoronaClass=Class'CybDualSentinelCoronas',hasExtras=False,isTeamCenter=True,isTeamRing=False,bFlicker=True)
	
	FireProjClass(0)=Class'CybProj'
	FireProjClass(1)=Class'CybProjB'
	FireProjClass(2)=Class'CybProjG'
	FireProjClass(3)=Class'CybProjY'
	FireDelay=0.150000
	BlastFireOffsetLeft=(X=24.000000,Y=-10.000000,Z=5.500000)
	BlastFireOffsetRight=(X=24.000000,Y=10.000000,Z=5.500000)
	MaxEnemyAprox=400.000000
	
	Health=300
	WaterDmg=50
	ElectricDmgFactor=1.550000
	
	WreckParts(0)=(WreckClass=Class'CybSentWreckBase',WreckOffset=(Z=-10.000000),UseYawOnly=True)
	WreckParts(1)=(WreckClass=Class'CybSentWreckTurret',WreckOffset=(Z=2.000000),UseYawOnly=True)
	WreckParts(2)=(WreckClass=Class'CybDualSentWreckGun',WreckOffset=(Y=-10.000000,Z=5.000000),UseYawOnly=False)
	WreckParts(3)=(WreckClass=Class'CybDualSentWreckGun',WreckOffset=(Y=10.000000,Z=5.000000),UseYawOnly=False)
	WreckParts(4)=(WreckClass=Class'CybDualSentWreckHead',WreckOffset=(Z=12.000000),UseYawOnly=False)
	
	TransformAnim=Transform
	TransformRate=0.650000
	NextStateFromTransform=BootUp
	TransformSnd=CybSentinelTransform
	
	bStationary=True
	BasePartClass=Class'CybDualSentinelBase'
	TurretPartClass=Class'CybDualSentinelTurret'
	
	LaserTeam(0)=SentinelLaserFXRed
	LaserTeam(1)=SentinelLaserFXBlue
	LaserTeam(2)=SentinelLaserFXGreen
	LaserTeam(3)=SentinelLaserFXYellow
	
	MyModel="Dual Sentinel"
}
