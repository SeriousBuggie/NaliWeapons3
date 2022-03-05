//////////////////////////////////////////////////////////////
//	Nali Weapons III Water FX base class
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWaterVertSplashAC expands NaliZPEffects;

////////////////////////////////////////////////////////////////////////////////
//Category NORMAL water fx
////////////////////////////////////////////////////////////////////////////////

#exec MESH IMPORT MESH=NWWaterVertSplashA02 ANIVFILE=MODELS\NWWaterVertSplash_a.3d DATAFILE=MODELS\NWWaterVertSplash_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWWaterVertSplashA02 STRENGTH=0.35
#exec MESH ORIGIN MESH=NWWaterVertSplashA02 X=0 Y=0 Z=48

#exec MESH SEQUENCE MESH=NWWaterVertSplashA02 SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=NWWaterVertSplashA02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA02 SEQ=End STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWWaterVertSplashA02 SEQ=Burst STARTFRAME=0 NUMFRAMES=30 RATE=30.0

#exec MESHMAP NEW MESHMAP=NWWaterVertSplashA02 MESH=NWWaterVertSplashA02
#exec MESHMAP SCALE MESHMAP=NWWaterVertSplashA02 X=1.0 Y=1.0 Z=1.75


#exec TEXTURE IMPORT NAME=NWWSplsh FILE=PARTICLES\NWWSplsh.bmp GROUP=Particles FLAGS=2
#exec TEXTURE IMPORT NAME=NWSplshSlime FILE=PARTICLES\NWSplshSlime.bmp GROUP=Particles FLAGS=2
#exec TEXTURE IMPORT NAME=NWSplshLava FILE=PARTICLES\NWSplshLava.bmp GROUP=Particles FLAGS=2

#exec AUDIO IMPORT NAME="NWWaterSplashSnd01" FILE=SOUNDS\NWWaterSplashSnd01.wav GROUP="WaterSplash"
#exec AUDIO IMPORT NAME="NWWaterSplashSnd02" FILE=SOUNDS\NWWaterSplashSnd02.wav GROUP="WaterSplash"
#exec AUDIO IMPORT NAME="NWWaterSplashSnd03" FILE=SOUNDS\NWWaterSplashSnd03.wav GROUP="WaterSplash"
#exec AUDIO IMPORT NAME="NWWaterSplashSnd04" FILE=SOUNDS\NWWaterSplashSnd04.wav GROUP="WaterSplash"

#exec AUDIO IMPORT NAME="NWSlimeSnd1" FILE=SOUNDS\NWSlimeSnd1.wav GROUP="SlimeSplash"
#exec AUDIO IMPORT NAME="NWSlimeSnd2" FILE=SOUNDS\NWSlimeSnd2.wav GROUP="SlimeSplash"

#exec AUDIO IMPORT NAME="NWLavaExpl01" FILE=SOUNDS\NWLavaExpl01.wav GROUP="LavaSplash"
#exec AUDIO IMPORT NAME="NWLavaExpl02" FILE=SOUNDS\NWLavaExpl02.wav GROUP="LavaSplash"
#exec AUDIO IMPORT NAME="NWLavaExpl03" FILE=SOUNDS\NWLavaExpl03.wav GROUP="LavaSplash"

var() float FinalDrawScale;
var() sound SplashSnd[4];
var() byte SplashLevel;
var float MaxLifeSpan;

simulated function PostBeginPlay()
{
local byte i;
local float ZDistScalar;
local float t, dist;

	Super.PostBeginPlay();

	if (Class'NWInfo'.default.WaterSplashDetail >= 2 && Class'NWInfo'.default.WaterSplashDetail <= 9)
	{
		For (i = 0; i < 8; i++)
		{
			if (i <= (Class'NWInfo'.default.WaterSplashDetail - 2))
				MultiSkins[i] = Texture;
			else
				MultiSkins[i] = None;
		}
	}

	if (SplashLevel >= 2)
	{
		MaxLifeSpan = (SplashLevel+1) * Default.LifeSpan / 3.0;
		dist = 8.0;
	}
	else
	{
		MaxLifeSpan = Default.LifeSpan;
		dist = 24.0;
	}
	
	LifeSpan = MaxLifeSpan;
	PlayAnim('Burst', 1/MaxLifeSpan, 0.05);
	t = MaxLifeSpan/2;
	dist *= (2**SplashLevel);
	ZDistScalar = (dist + (-0.5*Region.Zone.ZoneGravity.Z*(t**2))) / t;
	Velocity = (ZDistScalar*vect(0,0,1));
}

simulated function MakeSound()
{
	PlaySound(SplashSnd[Rand(4)],, 50 + 50 * SplashLevel,, 500 + 750 * (SplashLevel**2));
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer && MaxLifeSpan > 0)
	{
		ScaleGlow = LifeSpan * Default.ScaleGlow / MaxLifeSpan;
		DrawScale = (MaxLifeSpan - LifeSpan) * Default.DrawScale / MaxLifeSpan + FinalDrawScale;
	}
}

auto state IgnoringWorld
{
	ignores FellOutOfWorld, HitWall, Touch, Bump, Landed;
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWWaterVertSplashA02
	Physics=PHYS_Falling
	bUnlit=True
	RemoteRole=ROLE_SimulatedProxy
	bParticles=True
	Style=STY_Translucent
	Texture=NWWSplsh
	DrawScale=0.250000
	LifeSpan=0.750000
	ScaleGlow=1.500000
	FinalDrawScale=1.000000
	SplashSnd(0)=NWWaterSplashSnd01
	SplashSnd(1)=NWWaterSplashSnd02
	SplashSnd(2)=NWWaterSplashSnd03
	SplashSnd(3)=NWWaterSplashSnd04
	SpriteProjForward=0.000000
	SplashLevel=2
	bRandomFrame=True
	enableMakeSound=True
}
