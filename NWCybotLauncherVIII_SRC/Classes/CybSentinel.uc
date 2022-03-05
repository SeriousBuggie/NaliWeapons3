//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybot Sentinel
//				Feralidragon (01-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybSentinel expands Cybot;

#exec MESH IMPORT MESH=CybSentinelGun ANIVFILE=MODELS\CybSentinelGun_a.3d DATAFILE=MODELS\CybSentinelGun_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybSentinelGun STRENGTH=0.25
#exec MESH ORIGIN MESH=CybSentinelGun X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybSentinelGun SEQ=All STARTFRAME=0 NUMFRAMES=64
#exec MESH SEQUENCE MESH=CybSentinelGun SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybSentinelGun SEQ=Transform STARTFRAME=0 NUMFRAMES=28 RATE=27.0
#exec MESH SEQUENCE MESH=CybSentinelGun SEQ=UnTransform STARTFRAME=27 NUMFRAMES=28 RATE=27.0

//Fire
#exec MESH SEQUENCE MESH=CybSentinelGun SEQ=Fire STARTFRAME=55 NUMFRAMES=9 RATE=9.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybSentinelGun MESH=CybSentinelGun
#exec MESHMAP SCALE MESHMAP=CybSentinelGun X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=SentinelSk FILE=SKINS\SentinelSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybSentinelGun NUM=1 TEXTURE=SentinelSk

#exec MESHMAP SETTEXTURE MESHMAP=CybSentinelGun NUM=2 TEXTURE=TranslucInvis
#exec MESHMAP SETTEXTURE MESHMAP=CybSentinelGun NUM=3 TEXTURE=TranslucInvis


var() texture LaserTeam[4];
var() vector BlastFireOffset;

function setMaster(Pawn P)
{
	Super.setMaster(P);
	if (MasterPawn != None)
	{
		Health = Class'CybotLauncher'.default.CybotSentinelHealth;
		SetupHealth();
	}
}

simulated function SetTeamExtras(byte n)
{
	if (n > 3)	n = 0;
	MultiSkins[3] = LaserTeam[n];
}

function PlayFire(float rate)
{
	PlayAnim('Fire', rate);
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
	function SpawnFireFX()
	{
	local CybAndroidFireOv o;
	
		o = Spawn(Class'CybSentinelFireOv', Self);
		if (o != None) o.SetTeam(MyTeam, Self);
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
		PlayFire(10);
		Sleep(0.0125);
		if (Enemy != None && CanFireProj(Normal(Enemy.Location - Location), 250))
		{
			FireProjectile( Location + (BlastFireOffset >> Rotation), Normal(Enemy.Location - Location));
			SpawnFireFX();
			Sleep(FireDelay - 0.0125);
		}
	}
	
	Goto('Begin');
}


// --------- BOOT UP --------------
state BootUp
{
ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, TakeDamage, WarnTarget, Died;

Begin:
	if (ShouldBeAttacking()) 
		GotoState('Attacking');
	else
		GotoState('Waiting');
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybSentinelGun
	CollisionHeight=12.000000
	CollisionRadius=14.000000
	RotationRate=(Pitch=50000,Yaw=50000,Roll=0)
	
	CoreSkinN=2
	MultiSkins(2)=CybotCoreRed
	bDodgeProj=False
	
	CybFXCoronas(0)=(CoronaClass=Class'CybSentinelCoronas',hasExtras=True,isTeamCenter=False,isTeamRing=True,bFlicker=False)
	CybFXCoronas(1)=(CoronaClass=Class'CybSentinelCoronas',hasExtras=False,isTeamCenter=True,isTeamRing=False,bFlicker=True)
	
	FireProjClass(0)=Class'CybProj'
	FireProjClass(1)=Class'CybProjB'
	FireProjClass(2)=Class'CybProjG'
	FireProjClass(3)=Class'CybProjY'
	FireDelay=0.150000
	BlastFireOffset=(X=24.000000,Z=9.000000)
	
	Health=250
	WaterDmg=50
	ElectricDmgFactor=1.550000
	
	WreckParts(0)=(WreckClass=Class'CybSentWreckBase',WreckOffset=(Z=-10.000000),UseYawOnly=True)
	WreckParts(1)=(WreckClass=Class'CybSentWreckGun',WreckOffset=(Z=9.000000),UseYawOnly=False)
	WreckParts(2)=(WreckClass=Class'CybSentWreckTurret',WreckOffset=(Z=2.000000),UseYawOnly=True)
	
	TransformAnim=Transform
	TransformRate=0.650000
	NextStateFromTransform=BootUp
	TransformSnd=CybSentinelTransform
	
	bStationary=True
	BasePartClass=Class'CybSentinelBase'
	TurretPartClass=Class'CybSentinelTurret'
	
	LaserTeam(0)=SentinelLaserFXRed
	LaserTeam(1)=SentinelLaserFXBlue
	LaserTeam(2)=SentinelLaserFXGreen
	LaserTeam(3)=SentinelLaserFXYellow
	
	MyModel="Sentinel"
}
