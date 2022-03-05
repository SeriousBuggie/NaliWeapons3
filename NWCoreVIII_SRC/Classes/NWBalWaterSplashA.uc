//////////////////////////////////////////////////////////////
//	Nali Weapons III Ballistic Water FX base class
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBalWaterSplashA expands NaliZPEffects;

////////////////////////////////////////////////////////////////////////////////
//Category SMALL ballistic water fx
////////////////////////////////////////////////////////////////////////////////

#exec MESH IMPORT MESH=NWBalWaterSplash00 ANIVFILE=MODELS\NWWaterVertSplash_a.3d DATAFILE=MODELS\NWWaterVertSplash_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWBalWaterSplash00 STRENGTH=0.35
#exec MESH ORIGIN MESH=NWBalWaterSplash00 X=0 Y=0 Z=52

#exec MESH SEQUENCE MESH=NWBalWaterSplash00 SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=NWBalWaterSplash00 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWBalWaterSplash00 SEQ=End STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWBalWaterSplash00 SEQ=Burst STARTFRAME=0 NUMFRAMES=30 RATE=30.0

#exec MESHMAP NEW MESHMAP=NWBalWaterSplash00 MESH=NWBalWaterSplash00
#exec MESHMAP SCALE MESHMAP=NWBalWaterSplash00 X=0.25 Y=0.25 Z=1.0

var() float FinalDrawScale;
var() sound SplashSnd[4];
var() byte SplashLevel;

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

	PlayAnim('Burst', 1/Default.LifeSpan, 0.05);
	t = Default.LifeSpan/2;
	dist = 48.0 * (2**SplashLevel);
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
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
		DrawScale = (Default.LifeSpan - LifeSpan) * Default.DrawScale / Default.LifeSpan + FinalDrawScale;
	}
}

auto state IgnoringWorld
{
	ignores FellOutOfWorld, HitWall, Touch, Bump, Landed;
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWBalWaterSplash00
	Physics=PHYS_Falling
	bUnlit=True
	RemoteRole=ROLE_SimulatedProxy
	bParticles=True
	Style=STY_Translucent
	Texture=NWWSplsh
	DrawScale=0.077500
	FinalDrawScale=0.375000
	LifeSpan=0.750000
	ScaleGlow=1.500000
	SplashSnd(0)=NWWaterSplashSnd01
	SplashSnd(1)=NWWaterSplashSnd02
	SplashSnd(2)=NWWaterSplashSnd03
	SplashSnd(3)=NWWaterSplashSnd04
	SpriteProjForward=0.000000
	bRandomFrame=True
	SplashLevel=0
	enableMakeSound=True
}
