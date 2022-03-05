//////////////////////////////////////////////////////////////
//	Nali Weapons III wall fragment class
//				Feralidragon (02-07-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWallFrag expands Projectile;

#exec MESH IMPORT MESH=WallFrag01 ANIVFILE=MODELS\WallFrag01_a.3d DATAFILE=MODELS\WallFrag01_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WallFrag01 STRENGTH=0.1
#exec MESH ORIGIN MESH=WallFrag01 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=WallFrag01 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WallFrag01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=WallFrag01 MESH=WallFrag01
#exec MESHMAP SCALE MESHMAP=WallFrag01 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=WallFrag01 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=WallFrag02 ANIVFILE=MODELS\WallFrag02_a.3d DATAFILE=MODELS\WallFrag02_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WallFrag02 STRENGTH=0.1
#exec MESH ORIGIN MESH=WallFrag02 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=WallFrag02 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WallFrag02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=WallFrag02 MESH=WallFrag02
#exec MESHMAP SCALE MESHMAP=WallFrag02 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=WallFrag02 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=WallFrag03 ANIVFILE=MODELS\WallFrag03_a.3d DATAFILE=MODELS\WallFrag03_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WallFrag03 STRENGTH=0.1
#exec MESH ORIGIN MESH=WallFrag03 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=WallFrag03 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WallFrag03 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=WallFrag03 MESH=WallFrag03
#exec MESHMAP SCALE MESHMAP=WallFrag03 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=WallFrag03 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=WallFrag04 ANIVFILE=MODELS\WallFrag04_a.3d DATAFILE=MODELS\WallFrag04_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WallFrag04 STRENGTH=0.1
#exec MESH ORIGIN MESH=WallFrag04 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=WallFrag04 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WallFrag04 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=WallFrag04 MESH=WallFrag04
#exec MESHMAP SCALE MESHMAP=WallFrag04 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=WallFrag04 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=WallFrag05 ANIVFILE=MODELS\WallFrag05_a.3d DATAFILE=MODELS\WallFrag05_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WallFrag05 STRENGTH=0.1
#exec MESH ORIGIN MESH=WallFrag05 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=WallFrag05 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WallFrag05 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=WallFrag05 MESH=WallFrag05
#exec MESHMAP SCALE MESHMAP=WallFrag05 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=WallFrag05 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=WallFrag06 ANIVFILE=MODELS\WallFrag06_a.3d DATAFILE=MODELS\WallFrag06_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WallFrag06 STRENGTH=0.1
#exec MESH ORIGIN MESH=WallFrag06 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=WallFrag06 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WallFrag06 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=WallFrag06 MESH=WallFrag06
#exec MESHMAP SCALE MESHMAP=WallFrag06 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=WallFrag06 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=WallFrag07 ANIVFILE=MODELS\WallFrag07_a.3d DATAFILE=MODELS\WallFrag07_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WallFrag07 STRENGTH=0.1
#exec MESH ORIGIN MESH=WallFrag07 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=WallFrag07 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WallFrag07 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=WallFrag07 MESH=WallFrag07
#exec MESHMAP SCALE MESHMAP=WallFrag07 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=WallFrag07 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=WallFrag08 ANIVFILE=MODELS\WallFrag08_a.3d DATAFILE=MODELS\WallFrag08_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WallFrag08 STRENGTH=0.1
#exec MESH ORIGIN MESH=WallFrag08 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=WallFrag08 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WallFrag08 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=WallFrag08 MESH=WallFrag08
#exec MESHMAP SCALE MESHMAP=WallFrag08 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=WallFrag08 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=WallFrag09 ANIVFILE=MODELS\WallFrag09_a.3d DATAFILE=MODELS\WallFrag09_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WallFrag09 STRENGTH=0.1
#exec MESH ORIGIN MESH=WallFrag09 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=WallFrag09 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WallFrag09 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=WallFrag09 MESH=WallFrag09
#exec MESHMAP SCALE MESHMAP=WallFrag09 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=WallFrag09 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=WallFrag10 ANIVFILE=MODELS\WallFrag10_a.3d DATAFILE=MODELS\WallFrag10_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WallFrag10 STRENGTH=0.1
#exec MESH ORIGIN MESH=WallFrag10 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=WallFrag10 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WallFrag10 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=WallFrag10 MESH=WallFrag10
#exec MESHMAP SCALE MESHMAP=WallFrag10 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=WallFrag10 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=WallFrag11 ANIVFILE=MODELS\WallFrag11_a.3d DATAFILE=MODELS\WallFrag11_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WallFrag11 STRENGTH=0.1
#exec MESH ORIGIN MESH=WallFrag11 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=WallFrag11 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WallFrag11 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=WallFrag11 MESH=WallFrag11
#exec MESHMAP SCALE MESHMAP=WallFrag11 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=WallFrag11 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=WallFrag12 ANIVFILE=MODELS\WallFrag12_a.3d DATAFILE=MODELS\WallFrag12_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WallFrag12 STRENGTH=0.1
#exec MESH ORIGIN MESH=WallFrag12 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=WallFrag12 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WallFrag12 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=WallFrag12 MESH=WallFrag12
#exec MESHMAP SCALE MESHMAP=WallFrag12 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=WallFrag12 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=WallFrag13 ANIVFILE=MODELS\WallFrag13_a.3d DATAFILE=MODELS\WallFrag13_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WallFrag13 STRENGTH=0.1
#exec MESH ORIGIN MESH=WallFrag13 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=WallFrag13 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WallFrag13 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=WallFrag13 MESH=WallFrag13
#exec MESHMAP SCALE MESHMAP=WallFrag13 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=WallFrag13 NUM=1 TEXTURE=DefaultTexture

#exec MESH IMPORT MESH=WallFrag14 ANIVFILE=MODELS\WallFrag14_a.3d DATAFILE=MODELS\WallFrag14_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WallFrag14 STRENGTH=0.1
#exec MESH ORIGIN MESH=WallFrag14 X=0 Y=0 Z=0
#exec MESH SEQUENCE MESH=WallFrag14 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WallFrag14 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESHMAP NEW MESHMAP=WallFrag14 MESH=WallFrag14
#exec MESHMAP SCALE MESHMAP=WallFrag14 X=0.1 Y=0.1 Z=0.2
#exec MESHMAP SETTEXTURE MESHMAP=WallFrag14 NUM=1 TEXTURE=DefaultTexture

#exec AUDIO IMPORT NAME="FragSound01" FILE=SOUNDS\FragSound01.wav GROUP="Fragments"
#exec AUDIO IMPORT NAME="FragSound02" FILE=SOUNDS\FragSound02.wav GROUP="Fragments"
#exec AUDIO IMPORT NAME="FragSound03" FILE=SOUNDS\FragSound03.wav GROUP="Fragments"
#exec AUDIO IMPORT NAME="FragSound04" FILE=SOUNDS\FragSound04.wav GROUP="Fragments"

#exec AUDIO IMPORT NAME="HeavyFrag01" FILE=SOUNDS\HeavyFrag01.wav GROUP="Fragments"
#exec AUDIO IMPORT NAME="HeavyFrag02" FILE=SOUNDS\HeavyFrag02.wav GROUP="Fragments"
#exec AUDIO IMPORT NAME="HeavyFrag03" FILE=SOUNDS\HeavyFrag03.wav GROUP="Fragments"
#exec AUDIO IMPORT NAME="HeavyFrag04" FILE=SOUNDS\HeavyFrag04.wav GROUP="Fragments"
#exec AUDIO IMPORT NAME="HeavyFrag05" FILE=SOUNDS\HeavyFrag05.wav GROUP="Fragments"


var() mesh WallFragMeshes[14];
var() float InitMinForce, InitMaxForce;
var() float MinDrawScale, MaxDrawScale;
var() sound FragHitSound[5];
var() sound HeavyFragHitSound[5];
var() float LifeSpanVariation;
var bool bFirstHit;
var() float MaxCoveredDebriRadius;
var() int WaterFXDif;
var() bool bAlwaysHeavy;

function PostBeginPlay()
{
    if (Region.Zone.bDestructive)
        Destroy();
    else
        Super.PostBeginPlay();
}

simulated function CalcVelocity(vector Momentum, float ExplosionSize)
{
    Velocity = VRand()*(ExplosionSize+FRand()*150.0+100.0 + VSize(Momentum)/80); 
}

simulated function HitWall (vector HitNormal, actor HitWall)
{
	If (VSize(Velocity) > 50)
	{
		if (DrawScale > 1.5 || bAlwaysHeavy)
			PlaySound(HeavyFragHitSound[Rand(ArrayCount(HeavyFragHitSound))],, FMax(0.5,DrawScale),, FMax(0.25,DrawScale)*500);
		else
			PlaySound(FragHitSound[Rand(ArrayCount(FragHitSound))],, FMax(0.5,DrawScale),, FMax(0.25,DrawScale)*500);
	}
	
    Velocity = 0.5*(( Velocity dot HitNormal ) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
    speed = VSize(Velocity);    
	
    if (bFirstHit && speed<150) 
    {
        bFirstHit=False;
        bRotatetoDesired=True;
        bFixedRotationDir=False;
        DesiredRotation.Pitch=0;    
        DesiredRotation.Yaw=FRand()*65536;
        DesiredRotation.roll=0;
    }
    RotationRate.Yaw = RotationRate.Yaw*0.75;
    RotationRate.Roll = RotationRate.Roll*0.75;
    RotationRate.Pitch = RotationRate.Pitch*0.75;
    if ( (speed < 60) && (HitNormal.Z > 0.7) )
    {
        SetPhysics(PHYS_none);
        bBounce = false;
        GoToState('Dying');
    }
}

simulated function SpawnWaterSplash(bool inWater, ZoneInfo WZone)
{
local byte WaterSplashType;
	
	WaterSplashType = int((DrawScale*(MaxCoveredDebriRadius/3.0))/0.75) - WaterFXDif;
	WaterSplashType = FMin(ArrayCount(Class'NWUtils'.default.WaterProjSplashClass) - 1, WaterSplashType);
	Class'NWUtils'.static.SpawnWaterSplash(Self, WaterSplashType, inWater, WZone);
}

auto state Flying
{
    simulated function timer()
    {
        GoToState('Dying');
    }


    simulated function Touch(actor Other)
    {
        if (Pawn(Other)==None) Return;
        if (!Pawn(Other).bIsPlayer) Destroy();
    }


    simulated singular function ZoneChange(ZoneInfo NewZone)
    {
        local float splashsize;
        local actor splash;

        if ( NewZone.bWaterZone )
        {
            Velocity = 0.2 * Velocity;
            splashSize = 0.0005 * (250 - 0.5 * Velocity.Z);
            if ( Level.NetMode != NM_DedicatedServer )
            {
				if (Region.Zone.bWaterZone != NewZone.bWaterZone)
				{
					if (Class'NWInfo'.default.bEnhancedWaterSplashes)
						SpawnWaterSplash(NewZone.bWaterZone, NewZone);
					else
					{
						if ( NewZone.EntrySound != None )
							PlaySound(NewZone.EntrySound, SLOT_Interact, splashSize);
						if ( NewZone.EntryActor != None )
						{
							splash = Spawn(NewZone.EntryActor); 
							if ( splash != None )
								splash.DrawScale = 4 * splashSize;
						}
					}
				}
            }
            if (bFirstHit) 
            {
                bFirstHit=False;
                bRotatetoDesired=True;
                bFixedRotationDir=False;
                DesiredRotation.Pitch=0;    
                DesiredRotation.Yaw=FRand()*65536;
                DesiredRotation.roll=0;
            }
            
            RotationRate = 0.2 * RotationRate;
            GotoState('Dying');
        }
        if (NewZone.bPainZone && NewZone.DamagePerSec > 0)
            Destroy();
    }

    simulated function BeginState()
    {
        RandSpin(125000);
        if (RotationRate.Pitch>-10000&&RotationRate.Pitch<10000) 
            RotationRate.Pitch=10000;
        if (RotationRate.Roll>-10000&&RotationRate.Roll<10000) 
            RotationRate.Roll=10000;
			
        Mesh = WallFragMeshes[Rand(ArrayCount(WallFragMeshes))];
		Velocity = vector(Rotation) * ((InitMaxForce - InitMinForce)*FRand() + InitMinForce);
		DrawScale = (MaxDrawScale - MinDrawScale)*FRand() + MinDrawScale;
		SetCollisionSize(DrawScale*MaxCoveredDebriRadius, DrawScale*MaxCoveredDebriRadius);
		
        if ( Level.NetMode == NM_Standalone )
            LifeSpan = Default.LifeSpan + LifeSpanVariation*FRand();
        SetTimer(5.0,True);       
    }
}

state Dying
{
    simulated function HitWall (vector HitNormal, actor HitWall)
    {
		If (VSize(Velocity) > 80) 
        {
			if (DrawScale > 1.5 || bAlwaysHeavy)
				PlaySound(HeavyFragHitSound[Rand(ArrayCount(HeavyFragHitSound))],, FMax(0.5,DrawScale),, FMax(0.25,DrawScale)*500);
			else
				PlaySound(FragHitSound[Rand(ArrayCount(FragHitSound))],, FMax(0.5,DrawScale),, FMax(0.25,DrawScale)*500);
		}
		
        Velocity = 0.5*(( Velocity dot HitNormal ) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
        speed = VSize(Velocity);   
		
        if (bFirstHit && speed<150) 
        {
            bFirstHit=False;
            bRotatetoDesired=True;
            bFixedRotationDir=False;
            DesiredRotation.Pitch=0;    
            DesiredRotation.Yaw=FRand()*65536;
            DesiredRotation.roll=0;
        }
		
        RotationRate.Yaw = RotationRate.Yaw*0.75;
        RotationRate.Roll = RotationRate.Roll*0.75;
        RotationRate.Pitch = RotationRate.Pitch*0.75;
        if ( (Velocity.Z < 50) && (HitNormal.Z > 0.7) )
        {
            SetPhysics(PHYS_none);
            bBounce = false;
        }
    }

    simulated function BeginState()
    {
        SetCollision(true, false, false);
    }
}


defaultproperties
{
    DrawType=DT_Mesh
    Mesh=WallFrag01
	
	bFirstHit=True
    bNetTemporary=False
    Physics=PHYS_Falling
    RemoteRole=ROLE_SimulatedProxy
    LifeSpan=8.500000
	LifeSpanVariation=5.000000
    CollisionRadius=18.000000
    CollisionHeight=4.000000
    bCollideActors=False
    bBounce=True
    bFixedRotationDir=True
    NetPriority=1.400000
	MaxCoveredDebriRadius=3.000000
	
	InitMinForce=150.000000
	InitMaxForce=500.000000
	
	MinDrawScale=0.150000
	MaxDrawScale=0.550000
	
	WallFragMeshes(0)=WallFrag01
	WallFragMeshes(1)=WallFrag02
	WallFragMeshes(2)=WallFrag03
	WallFragMeshes(3)=WallFrag04
	WallFragMeshes(4)=WallFrag05
	WallFragMeshes(5)=WallFrag06
	WallFragMeshes(6)=WallFrag07
	WallFragMeshes(7)=WallFrag08
	WallFragMeshes(8)=WallFrag09
	WallFragMeshes(9)=WallFrag10
	WallFragMeshes(10)=WallFrag11
	WallFragMeshes(11)=WallFrag12
	WallFragMeshes(12)=WallFrag13
	WallFragMeshes(13)=WallFrag14
	
	FragHitSound(0)=FragSound01
	FragHitSound(1)=FragSound02
	FragHitSound(2)=FragSound03
	FragHitSound(3)=FragSound04
	FragHitSound(4)=Sound'UnrealShare.General.Chunkhit1'
	
	HeavyFragHitSound(0)=HeavyFrag01
	HeavyFragHitSound(1)=HeavyFrag02
	HeavyFragHitSound(2)=HeavyFrag03
	HeavyFragHitSound(3)=HeavyFrag04
	HeavyFragHitSound(4)=HeavyFrag05
}
