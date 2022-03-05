//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybot F-Field
//				Feralidragon (20-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybFField expands Cybot;

#exec MESH IMPORT MESH=CybFField ANIVFILE=MODELS\CybFField_a.3d DATAFILE=MODELS\CybFField_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybFField STRENGTH=0.25
#exec MESH ORIGIN MESH=CybFField X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybFField SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=CybFField SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybFField SEQ=Transform STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=CybFField SEQ=UnTransform STARTFRAME=10 NUMFRAMES=11 RATE=10.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybFField MESH=CybFField
#exec MESHMAP SCALE MESHMAP=CybFField X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=DroneSk FILE=SKINS\DroneSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybFField NUM=2 TEXTURE=DroneSk

#exec MESHMAP SETTEXTURE MESHMAP=CybFField NUM=3 TEXTURE=TranslucInvis


var() float EnemyAcquireMaxDist;

var CybFFieldSphere cybField;
var CybFFieldSphereCor cybFieldCor;
var rotator initialRot;
var int maxHealth;
var byte iCount;


function InitiateLifeline()
{
local CybLifeline CL;

	if (MasterPawn == None || Class'CybotLauncher'.default.FieldMaxLifeSpan <= 0.0)
		return;
	CL = Spawn(Class'CybLifeline');
	CL.InitLifeline(Self, Class'CybotLauncher'.default.FieldMaxLifeSpan);
}

function SetField()
{
	initialRot = Rotation;
	cybField = Spawn(Class'CybFFieldSphere', Self,, Location);
	cybField.SetTeam(myTeam);
	cybField.DrawScale = 0.1;
	
	cybFieldCor = Spawn(Class'CybFFieldSphereCor', Self,, Location);
	cybFieldCor.SetTeam(myTeam, cybField);
}

function ToSleep()
{
	if (cybField != None)
		cybField.Destroy();
	if (cybFieldCor != None)
		cybFieldCor.Destroy();
	cybField = None;
	cybFieldCor = None;
}

simulated function AnimEnd()
{
	if (AnimSequence == 'Transform')
		TweenAnim('UnTransform', 0.1);
}

simulated function Timer()
{
local Pawn Pn;
local CybFFieldHitFX fx;
	
	iCount++;
	if (iCount >= 8)
	{
		iCount = 0;
		ForEach VisibleCollidingActors(Class'Pawn', Pn, FMax(1.0,EnemyAcquireMaxDist))
		{
			if (!isFriend(Pn))
			{
				Pn.Enemy = Self;
				if (Class'CybotLauncher'.default.bFieldKillPawns && VSize(Pn.Location - Location) <= (cybField.DrawScale*cybField.SphericalMeshRadius))
				{
					fx = Spawn(Class'CybFFieldPawnHitFX',,, Pn.Location);
					fx.SetTeam(myTeam, FMax(Pn.CollisionRadius, Pn.CollisionHeight)/10,, True);
					Pn.TakeDamage(Class'CybotLauncher'.default.FieldDamage, Instigator, Pn.Location, vect(0,0,600000), 'InvadedField');
				}
			}
		}
	}
	
	if (Health < maxHealth)
	{
		if (cybField != None)
			Health += (0.025*maxHealth*cybField.RegenRate);
		else
			Health += (0.025*maxHealth);
		if (Health > maxHealth)
			Health = maxHealth;
	}
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	if (Role == ROLE_Authority && Level.NetMode != NM_StandAlone)
		RotationRate = rot(0,0,0);
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	if (Role < ROLE_Authority)
		SetRotation(Rotation + default.RotationRate*Delta);
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector hitlocation, vector momentum, name damageType)
{
local int actualDamage;

	if (Health <= 0)	return;

	if (cybField != None && damageType == 'FieldDamage' && !isFriend(instigatedBy))
	{
		actualDamage = ReduceDamage(Damage, DamageType, self, instigatedBy);
		if (isElectricDmg(DamageType))
			actualDamage = Int(actualDamage*ElectricDmgFactor);
		
		Health -= actualDamage;
		if (Health <= 0)
		{
			MakeNoise(1.65);
			ExplodeSelf(instigatedBy);
			Destroy();
		}
	}
	else
		Super.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
	
	if (cybField != None)
		cybField.CurDrawScale = float(Health)/float(maxHealth) * cybField.MaxDrawScale;
}

simulated function Destroyed()
{
	if (cybField != None)
		cybField.Destroy();
	if (cybFieldCor != None)
		cybFieldCor.Destroy();
	
	cybField = None;
	cybFieldCor = None;
	
	Super.Destroyed();
}

// --------- BOOT UP --------------
state BootUp
{
ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, WarnTarget, Died;

Begin:
	SetField();
	SetTimer(0.025, True);
	if (Class'CybotLauncher'.default.FieldHealth > 0)
	{
		maxHealth = Class'CybotLauncher'.default.FieldHealth;
		Health = Class'CybotLauncher'.default.FieldHealth;
	}
	else
		maxHealth = Health;
RotLoop:
	DesiredRotation = initialRot + rot(0,16384,0);
	Sleep(1.0);
	SetRotation(initialRot);
	Goto('RotLoop');
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybFField
	
	CollisionHeight=11.000000
	CollisionRadius=12.000000
	RotationRate=(Pitch=0,Yaw=16384,Roll=0)
	bStationary=True
	MultiSkins(1)=CybotSk
	
	CoreSkinN=3
	MultiSkins(3)=CybotCoreRed
	
	CybFXCoronas(0)=(CoronaClass=Class'CybFFieldCoronas',hasExtras=True,isTeamCenter=False,isTeamRing=True,bFlicker=False)
	CybFXCoronas(1)=(CoronaClass=Class'CybFFieldCoronas',hasExtras=False,isTeamCenter=True,isTeamRing=False,bFlicker=True)
	
	Health=1500
	WaterDmg=1000
	ElectricDmgFactor=1.850000
	
	WreckParts(0)=(WreckClass=Class'CybFFieldWreckHead',WreckOffset=(Z=1.000000),UseYawOnly=False)
	WreckParts(1)=(WreckClass=Class'CybDroneWreckUpperShell',WreckOffset=(Z=8.000000),UseYawOnly=False)
	WreckParts(2)=(WreckClass=Class'CybDroneWreckLowerShell',WreckOffset=(Z=-8.000000),UseYawOnly=False)
	
	TransformAnim=Transform
	TransformRate=5.000000
	NextStateFromTransform=BootUp
	TransformSnd=CybTransformSnd
	
	EnemyAcquireMaxDist=6500.000000
	
	MyModel="F-Field"
}
