//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybot Kamikaze
//				Feralidragon (19-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybKamikaze expands Cybot;

#exec MESH IMPORT MESH=CybKamikaze ANIVFILE=MODELS\CybKamikaze_a.3d DATAFILE=MODELS\CybKamikaze_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybKamikaze STRENGTH=0.25
#exec MESH ORIGIN MESH=CybKamikaze X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybKamikaze SEQ=All STARTFRAME=0 NUMFRAMES=46
#exec MESH SEQUENCE MESH=CybKamikaze SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybKamikaze SEQ=Transform STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=CybKamikaze SEQ=UnTransform STARTFRAME=10 NUMFRAMES=11 RATE=10.0

//Prepare to explode
#exec MESH SEQUENCE MESH=CybKamikaze SEQ=RotateOnce STARTFRAME=21 NUMFRAMES=25 RATE=25.0
#exec MESH SEQUENCE MESH=CybKamikaze SEQ=RotateLoop STARTFRAME=21 NUMFRAMES=24 RATE=25.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybKamikaze MESH=CybKamikaze
#exec MESHMAP SCALE MESHMAP=CybKamikaze X=0.05 Y=0.05 Z=0.1

#exec AUDIO IMPORT NAME="CybKamikazeCharging" FILE=SOUNDS\CybKamikazeCharging.wav GROUP="Attack"

var() class<NWCoronaFX> ChargingCoronaFXClass[4];
var() float ExplosionRadius;
var() int ExplosionMomentum;

function InitiateLifeline();

function PlayImplosionRotation(float rate, optional bool bLoop)
{
	if (bLoop)
		LoopAnim('RotateLoop', rate);
	else
		PlayAnim('RotateOnce', rate);
}

function PlayCharging()
{
	PlaySound(Sound'CybKamikazeCharging',,12.0,,1800.0);
	
	if (myTeam > 3)
		myTeam = 0;
	
	if (ChargingCoronaFXClass[myTeam] != None)
		Spawn(ChargingCoronaFXClass[myTeam]);
}

function Explode()
{
	if (MasterPawn != None)
		ExplodeSelf(MasterPawn);
	else
		ExplodeSelf(Self);
	Destroy();
}

singular function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation, vector momentum, name damageType)
{
local byte i, totalSparks;
local int actualDamage;

    actualDamage = ReduceDamage(Damage, DamageType, self, instigatedBy);
	
	if (isElectricDmg(DamageType))
		actualDamage = Int(actualDamage*ElectricDmgFactor);

	totalSparks = Min(Max(Byte(actualDamage/SparkTriggerDmg), 1), MaxSparks);
	for (i = 0; i < totalSparks; i++)
		Spawn(Class'CybotSpark',,, hitLocation, RotRand());
}

function SpawnExplodeFX()
{
	Spawn(Class'CybSuperExplosionMult',,,, rotator(vect(0,0,1)));
	Spawn(Class'CybSuperShock',,,, rotator(vect(0,0,1)));
	Spawn(Class'CybSuperAfterEffects');
	Spawn(Class'CybSuperExplCor');
}

function ExplodeSelf( optional Pawn instigatedBy)
{
local byte i;
local CybWreckedPiece cwp;
local Actor A;
local float dist, damageScale;
local vector dir;
local rotator R;

	SpawnExplodeFX();
	
	for (i = 0; i < ArrayCount(WreckParts); i++)
	{
		if (WreckParts[i].WreckClass != None)
		{
			R = Rotation;
			if (WreckParts[i].UseYawOnly)
			{
				R.Pitch = 0;
				R.Roll = 0;
			}
			
			cwp = Spawn(WreckParts[i].WreckClass,,, Location + ((WreckParts[i].WreckOffset*DrawScale) >> R), R);
			cwp.DrawScale = DrawScale;
			cwp.SetVelocity(Normal(((WreckParts[i].WreckOffset*DrawScale) >> R) + VRand()*VSize(WreckParts[i].WreckOffset*DrawScale)/3));
		}
	}
	
	ForEach VisibleCollidingActors(Class'Actor', A, ExplosionRadius)
	{
		if (A != Self && (Class'CybotLauncher'.default.bFriendlyFire || !isFriend(A) || A == MasterPawn))
		{
			dir = A.Location - Location;
            dist = FMax(1,VSize(dir));
            dir = dir/dist; 
            damageScale = 1 - FMax(0,(dist - A.CollisionRadius)/ExplosionRadius);
            A.TakeDamage(damageScale * Class'CybotLauncher'.default.KamiBaseDamage,instigatedBy, 
                A.Location - 0.5 * (A.CollisionHeight + A.CollisionRadius) * dir,(damageScale * ExplosionMomentum * dir), 'CybotExploded');
		}
	}
}

// --------- BOOM --------------
state Boom
{
ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, HeadZoneChange, FootZoneChange, ZoneChange, Falling, WarnTarget, Died;

Begin:
	PlayCharging();
	PlayImplosionRotation(1.0);
	FinishAnim();
	PlayImplosionRotation(2.0, True);
	Sleep(3.15);
	Explode();
}


defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybKamikaze
	nonDestroyable=True
	
	CollisionHeight=12.000000
	CollisionRadius=12.000000
	MultiSkins(1)=CybotSk
	
	CoreSkinN=2
	MultiSkins(2)=CybotCoreRed
	
	CybFXCoronas(0)=(CoronaClass=Class'CybKamikazeCoronas',hasExtras=True,isTeamCenter=False,isTeamRing=True,bFlicker=False)
	CybFXCoronas(1)=(CoronaClass=Class'CybKamikazeCoronas',hasExtras=False,isTeamCenter=True,isTeamRing=False,bFlicker=True)
	
	Health=80000
	WaterDmg=0
	ElectricDmgFactor=1.000000
	
	WreckParts(0)=(WreckClass=Class'CybKamikazeWreckTop',WreckOffset=(Z=8.000000),UseYawOnly=False)
	WreckParts(1)=(WreckClass=Class'CybKamikazeWreckBottom',WreckOffset=(Z=-8.000000),UseYawOnly=False)
	
	TransformAnim=Transform
	TransformRate=5.000000
	NextStateFromTransform=Boom
	TransformSnd=CybTransformSnd
	
	RotationRate=(Pitch=0,Yaw=0,Roll=0)
	bStationary=True
	
	ChargingCoronaFXClass(0)=Class'CybKamikazeChargeCorRed'
	ChargingCoronaFXClass(1)=Class'CybKamikazeChargeCorBlue'
	ChargingCoronaFXClass(2)=Class'CybKamikazeChargeCorGreen'
	ChargingCoronaFXClass(3)=Class'CybKamikazeChargeCorYellow'
	
	ExplosionRadius=2400.000000
	ExplosionMomentum=850000
	
	MyModel="Kamikaze"
}
