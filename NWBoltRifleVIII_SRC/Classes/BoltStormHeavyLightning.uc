//////////////////////////////////////////////////////////////
//				Feralidragon (14-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltStormHeavyLightning expands NaliWEffects;

#exec MESH IMPORT MESH=BoltStormHeavyLightning ANIVFILE=MODELS\BoltStormHeavyLightning_a.3d DATAFILE=MODELS\BoltStormHeavyLightning_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltStormHeavyLightning STRENGTH=0.0
#exec MESH ORIGIN MESH=BoltStormHeavyLightning X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltStormHeavyLightning SEQ=All STARTFRAME=0 NUMFRAMES=18
#exec MESH SEQUENCE MESH=BoltStormHeavyLightning SEQ=Comp00 STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormHeavyLightning SEQ=Decomp00 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormHeavyLightning SEQ=Comp01 STARTFRAME=3 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormHeavyLightning SEQ=Decomp01 STARTFRAME=4 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormHeavyLightning SEQ=Comp02 STARTFRAME=6 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormHeavyLightning SEQ=Decomp02 STARTFRAME=7 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormHeavyLightning SEQ=Comp03 STARTFRAME=9 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormHeavyLightning SEQ=Decomp03 STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormHeavyLightning SEQ=Comp04 STARTFRAME=12 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormHeavyLightning SEQ=Decomp04 STARTFRAME=13 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormHeavyLightning SEQ=Comp05 STARTFRAME=15 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormHeavyLightning SEQ=Decomp05 STARTFRAME=16 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=BoltStormHeavyLightning MESH=BoltStormHeavyLightning
#exec MESHMAP SCALE MESHMAP=BoltStormHeavyLightning X=1.0 Y=1.0 Z=2.0

#exec TEXTURE IMPORT NAME=HeavyLightning01 FILE=Effects\HeavyLightning01.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=HeavyLightning02 FILE=Effects\HeavyLightning02.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=HeavyLightning03 FILE=Effects\HeavyLightning03.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=HeavyLightning04 FILE=Effects\HeavyLightning04.bmp GROUP=Effects FLAGS=2

#exec MESHMAP SETTEXTURE MESHMAP=BoltStormHeavyLightning NUM=1 TEXTURE=HeavyLightning01
#exec MESHMAP SETTEXTURE MESHMAP=BoltStormHeavyLightning NUM=2 TEXTURE=HeavyLightning02


var() float BaseLength;
var() float FadeInTime, FadeOutTime;
var() float GlowCoefMax, GlowCoefMin;
var() float RadCoefMax, RadCoefMin;
var int realPitch, realYaw, realRoll;

var() texture HTex[12];
var() name CompAnim[5], DecompAnim[5];
var byte selAnim;

replication
{
	reliable if (Role == ROLE_Authority)
		realPitch, realYaw, realRoll;
}

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		SpawnCoronaFX(Location);
	if (Role == ROLE_Authority)
	{
		realPitch = Rotation.Pitch;
		realYaw = Rotation.Yaw;
		realRoll = Rotation.Roll;
	}
	
	selAnim = Rand(ArrayCount(DecompAnim));
	AnimSequence = DecompAnim[selAnim];
	AnimFrame = 0.5;
	MultiSkins[1] = HTex[Rand(ArrayCount(HTex))];
	MultiSkins[2] = HTex[Rand(ArrayCount(HTex))];
}

simulated function PostNetBeginPlay()
{
local rotator R;

	R.Pitch = realPitch;
	R.Yaw = realYaw;
	R.Roll = realRoll;
	SetRotation(R);
}

simulated function SpawnCoronaFX(vector loc)
{
	Spawn(Class'BoltStormHLightningLight',,, loc);
	Spawn(Class'BoltStormHLightningLightFog',,, loc);
}

simulated function SetLength(float newL)
{
	DrawScale = newL / BaseLength;
}

simulated function Tick(float Delta)
{
local float f;

	if (Level.NetMode != NM_DedicatedServer)
	{
		f = 1.0;
		if (FadeOutTime > 0.0 && LifeSpan <= FadeOutTime)
			f = (LifeSpan/FadeOutTime);
		else if (FadeInTime > 0.0 && (default.LifeSpan-LifeSpan) <= FadeInTime)
			f = ((default.LifeSpan-LifeSpan)/FadeInTime);
		ScaleGlow = f * default.ScaleGlow * RandRange(GlowCoefMin, GlowCoefMax);
		AnimFrame = f * 0.5 * RandRange(RadCoefMin, RadCoefMax);
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=BoltStormHeavyLightning
	bNetTemporary=True
	bUnlit=True
	Style=STY_Translucent
	
	ScaleGlow=2.000000
	LifeSpan=0.450000
	
	BaseLength=256.000000
	FadeInTime=0.100000
	FadeOutTime=0.350000
	GlowCoefMax=1.100000
	GlowCoefMin=0.650000
	RadCoefMax=1.000000
	RadCoefMin=0.900000
	
	CompAnim(0)=Comp01
	CompAnim(1)=Comp02
	CompAnim(2)=Comp03
	CompAnim(3)=Comp04
	CompAnim(4)=Comp05
	DecompAnim(0)=Decomp01
	DecompAnim(1)=Decomp02
	DecompAnim(2)=Decomp03
	DecompAnim(3)=Decomp04
	DecompAnim(4)=Decomp05
	
	HTex(0)=HeavyLightning01
	HTex(1)=BoltLightLightning01
	HTex(2)=BoltLightLightning02
	HTex(3)=HeavyLightning02
	HTex(4)=BoltLightLightning03
	HTex(5)=BoltLightLightning04
	HTex(6)=HeavyLightning03
	HTex(7)=BoltLightLightning05
	HTex(8)=BoltLightLightning06
	HTex(9)=HeavyLightning04
	HTex(10)=BoltLightLightning07
	HTex(11)=BoltLightLightning08
}
