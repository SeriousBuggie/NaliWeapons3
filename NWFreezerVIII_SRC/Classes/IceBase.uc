//////////////////////////////////////////////////////////////
//				Feralidragon (03-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IceBase expands NaliWActor;

#exec MESH IMPORT MESH=IceBase ANIVFILE=MODELS\IceBase_a.3d DATAFILE=MODELS\IceBase_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceBase STRENGTH=0.5
#exec MESH ORIGIN MESH=IceBase X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IceBase SEQ=All STARTFRAME=0 NUMFRAMES=7
#exec MESH SEQUENCE MESH=IceBase SEQ=Shrink STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=IceBase SEQ=Grow STARTFRAME=3 NUMFRAMES=4 RATE=4.0

#exec MESHMAP NEW MESHMAP=IceBase MESH=IceBase
#exec MESHMAP SCALE MESHMAP=IceBase X=0.6 Y=0.6 Z=1.2

#exec AUDIO IMPORT NAME="IceMelt" FILE=SOUNDS\IceMelt.wav GROUP="Freezer"


var bool bEndLife;
var float meltCount;
var() bool bDestructable;
var() int IceHealth;
var() sound InitSound;
var() float WeightCheckRadius, WeightCheckHeight;
var bool bSink, bIceStatic;
var float TotalMass;
var vector ServerLoc;

replication
{
	reliable if (Role == ROLE_Authority)
		bSink, bIceStatic;
	unreliable if (Role == ROLE_Authority)
		TotalMass, ServerLoc;
}


simulated function PostBeginPlay()
{
	PlayAnim('Grow', 0.75);
	PlaySound(InitSound,, 20.0,, 1000);
	if (Level.NetMode == NM_StandAlone)
		SetTimer(0.3, True);
	else
		SetTimer(0.1, True);
	RotationRate.Yaw = Rand(12000) - 6000;
	if (Role == ROLE_Authority)
	{
		bSink = Class'Freezer'.default.bSinkIceBase;
		bIceStatic = Class'Freezer'.default.bStaticIceBase;
		if (Class'Freezer'.default.IceBaseStrength > 0)
			IceHealth = Class'Freezer'.default.IceBaseStrength;
	}
		
	Super.PostBeginPlay();
}

simulated function AnimEnd()
{
	if (AnimSequence == 'Grow')
		TweenAnim('Shrink', 0.1);
}


simulated function Bump(actor Other);

simulated singular function ZoneChange(ZoneInfo NewZone)
{
    if (!bIceStatic && bSink && Region.Zone.bWaterZone && Buoyancy > Mass)
    {
        if (Buoyancy > 1.1 * Mass)
            Buoyancy *= 0.95;
        else if(Buoyancy > 1.03 * Mass)
            Buoyancy *= 0.99;
    }
}

function TakeDamage( int NDamage, Pawn instigatedBy, Vector hitlocation, vector momentum, name damageType )
{	
	if (!bDestructable || DamageType == 'Frozen')
		return;
	
	IceHealth -= NDamage;
	If (IceHealth <= 0 || DamageType == 'Burned')
	{
		ReleaseFragEffect(Momentum, 2);
		Instigator = InstigatedBy;
		if (Instigator != None)
			MakeNoise(1.0);
		Destroy();
	}
}

simulated function Timer()
{
local Actor A;
local bool bSomething;
local byte i;

	if (!bIceStatic && bSink)
	{
		if (Role == ROLE_Authority)
		{
			ForEach VisibleCollidingActors(Class'Actor', A, WeightCheckRadius, Location + WeightCheckHeight*vect(0,0,1))
			{
				If (A != Self && A.Base == Self)
				{
					bSomething = True;
					Mass = Default.Mass + A.Mass;
					break;
				}
			}
			if (!bSomething)
				Mass = Default.Mass;
		}
	}
	else
	{
		i = 16;
		while (Region.Zone.bWaterZone && i > 0)
		{
			Move(vect(0,0,4));
			i--;
		}
		
		if (bIceStatic)
		{
			bFixedRotationDir = False;
			RotationRate = rot(0,0,0);
			SetPhysics(PHYS_None);
		}
		else
			SetPhysics(PHYS_Rotating);
	}
}

simulated function Tick(float Delta)
{
local IceBaseMeltSmk ibms;

	if (LifeSpan <= 1 && !bEndLife)
	{
		bEndLife = True;
		PlayAnim('Shrink', 0.75);
		PlaySound(Sound'IceMelt',, 20.0,, 1000);
	}

	if (Level.NetMode != NM_DedicatedServer)
	{
		if(LifeSpan <= 1)
		{
			ScaleGlow = LifeSpan * Default.ScaleGlow;
			meltCount += Delta;
			if (meltCount >= 0.1)
			{
				meltCount = 0;
				ibms = Spawn(Class'IceBaseMeltSmk');
				ibms.getOwnerAnim(Self);
			}
		}
		else if ((Default.LifeSpan - LifeSpan) <= 1)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow;
	}
	
	if (Level.NetMode != NM_StandAlone && !bIceStatic && bSink)
	{
		if (Role == ROLE_Authority)
		{
			TotalMass = Mass;
			ServerLoc = Location;
		}
		else
		{
			Mass = TotalMass;
			if (Mass > default.Mass && Velocity.Z > 0)
				SetLocation(ServerLoc);
		}
	}
}


function ReleaseFragEffect(vector Momentum, int NumFrags) 
{
local byte i;
local byte maxFrags, maxSmoke;
local float col, colH, colR;
local float rndRot, rndRadius;
local vector RndCyl;
local IceFrag iceF;
local FrozenBodySmkBlast fbsb;

	colH = FMax(CollisionHeight, 32);
	colR = FMax(CollisionRadius, 32);
	col = FMax( colH, colR);
	maxFrags = Int(NumFrags * col/48);
	maxSmoke = Int(col/15);
	
	for (i = 0; i < maxSmoke; i++)
	{
		rndRot = FRand()*PI*2;
		rndRadius = FRand()*colR;
		RndCyl.X = Sin(rndRot) * rndRadius;
		RndCyl.Y = Cos(rndRot) * rndRadius;
		
		fbsb = Spawn(Class'FrozenBodySmkBlast',,, Location + (colH - (colH*2/maxSmoke*i))*vect(0,0,1) + RndCyl);
		fbsb.SetColDrawScaleAndSpeed(colR/2, colH/2);
	}
	
	for (i = 0; i < maxFrags; i++)
	{
		RndCyl.Z = (FRand()*2 - 1) * colH;
		rndRot = FRand()*PI*2;
		rndRadius = FRand()*colR;
		RndCyl.X = Sin(rndRot) * rndRadius;
		RndCyl.Y = Cos(rndRot) * rndRadius;
		
		iceF = Spawn(Class'IceFrag',,, Location + RndCyl, RotRand(True));
		
		if (iceF != None)
		{
			iceF.CalcVelocity(Momentum/5, col * 4);
			iceF.GiveDrawScale( col/2);
		}
	}
	
	PlaySound(Sound'IceBodyBreak',,12.0,,1000);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IceBase
	RemoteRole=ROLE_SimulatedProxy
	Style=STY_Translucent
	bMeshEnviroMap=True
	Texture=IceFragSk
	ScaleGlow=2.000000
	CollisionHeight=39.000000
	CollisionRadius=120.000000
	WeightCheckRadius=160.000000
	WeightCheckHeight=40.000000
	bBlockPlayers=True
	bBlockActors=True
	bCollideWorld=True
	bCollideActors=True
	bProjTarget=True
	DrawScale=1.000000
	bNetTemporary=False
	LifeSpan=20.000000
	Mass=150.000000
	Buoyancy=250.000000
	Physics=PHYS_Falling
	bFixedRotationDir=True
	bGameRelevant=True
	bDestructable=True
	IceHealth=30
	InitSound=FreezerAmmoOpen
}
