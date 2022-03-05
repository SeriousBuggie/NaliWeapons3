//////////////////////////////////////////////////////////////
//				Feralidragon (15-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltStormRotParticles expands NaliWEffects;

#exec MESH IMPORT MESH=BoltStormRotParticles01 ANIVFILE=MODELS\BoltStormRotParticles_a.3d DATAFILE=MODELS\BoltStormRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltStormRotParticles01 STRENGTH=0.0
#exec MESH ORIGIN MESH=BoltStormRotParticles01 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltStormRotParticles01 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=BoltStormRotParticles01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltStormRotParticles01 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=BoltStormRotParticles01 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=BoltStormRotParticles01 MESH=BoltStormRotParticles01
#exec MESHMAP SCALE MESHMAP=BoltStormRotParticles01 X=0.25 Y=0.25 Z=0.5

#exec MESH IMPORT MESH=BoltStormRotParticles02 ANIVFILE=MODELS\BoltStormRotParticles_a.3d DATAFILE=MODELS\BoltStormRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltStormRotParticles02 STRENGTH=0.0
#exec MESH ORIGIN MESH=BoltStormRotParticles02 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltStormRotParticles02 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=BoltStormRotParticles02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltStormRotParticles02 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=BoltStormRotParticles02 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=BoltStormRotParticles02 MESH=BoltStormRotParticles02
#exec MESHMAP SCALE MESHMAP=BoltStormRotParticles02 X=0.5 Y=0.5 Z=1.0

#exec MESH IMPORT MESH=BoltStormRotParticles03 ANIVFILE=MODELS\BoltStormRotParticles_a.3d DATAFILE=MODELS\BoltStormRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltStormRotParticles03 STRENGTH=0.0
#exec MESH ORIGIN MESH=BoltStormRotParticles03 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltStormRotParticles03 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=BoltStormRotParticles03 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltStormRotParticles03 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=BoltStormRotParticles03 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=BoltStormRotParticles03 MESH=BoltStormRotParticles03
#exec MESHMAP SCALE MESHMAP=BoltStormRotParticles03 X=0.75 Y=0.75 Z=1.5

#exec MESH IMPORT MESH=BoltStormRotParticles04 ANIVFILE=MODELS\BoltStormRotParticles_a.3d DATAFILE=MODELS\BoltStormRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltStormRotParticles04 STRENGTH=0.0
#exec MESH ORIGIN MESH=BoltStormRotParticles04 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltStormRotParticles04 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=BoltStormRotParticles04 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltStormRotParticles04 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=BoltStormRotParticles04 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=BoltStormRotParticles04 MESH=BoltStormRotParticles04
#exec MESHMAP SCALE MESHMAP=BoltStormRotParticles04 X=1.0 Y=1.0 Z=2.0

#exec TEXTURE IMPORT NAME=BoltStormRorCor01 FILE=Coronas\BoltStormRorCor01.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=BoltStormRorCor02 FILE=Coronas\BoltStormRorCor02.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=BoltStormRorCor03 FILE=Coronas\BoltStormRorCor03.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=BoltStormRorCor04 FILE=Coronas\BoltStormRorCor04.bmp GROUP=Coronas FLAGS=2


var() texture BoltTex[4];
var() mesh BoltMesh[4];
var() float fadeInTime;
var float fCount;
var float initDScale;

simulated function PostBeginPlay()
{
	initDScale = DrawScale;
}

simulated function InitializeFX(optional float rotRate, optional float fadeIn, optional byte density, optional byte meshN, optional float baseDScale)
{
local byte i;

	if (meshN > 0 && meshN <= ArrayCount(BoltMesh))
		Mesh = BoltMesh[--meshN];
	if (fadeIn > 0.0)
		fadeInTime = fadeIn;
	if (baseDScale > 0.0)
		initDScale = baseDScale;
	if (rotRate > 0.0)
		LoopAnim('RotateLoop', rotRate);
	if (density > 0)
	{
		for (i = 0; i < ArrayCount(MultiSkins); i++)
			MultiSkins[i] = None;
		for (i = 0; i < density; i++)
			MultiSkins[Rand(ArrayCount(MultiSkins))] = BoltTex[Rand(ArrayCount(BoltTex))];
	}
}

simulated function Tick(float Delta)
{
local float baseGlow;

	if (Level.NetMode != NM_DedicatedServer)
	{
		fCount += Delta;
		baseGlow = Default.ScaleGlow;
		if (fCount <= fadeInTime)
			baseGlow *= (fCount/fadeInTime);
		DrawScale = initDScale * (FRand()*0.3+0.7);
		ScaleGlow = baseGlow * (FRand()*0.7+0.3);
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=BoltStormRotParticles01
	bNetTemporary=True
	bUnlit=True
	bParticles=True
	bRandomFrame=True
	Texture=TranslucInvis
	Style=STY_Translucent
	ScaleGlow=2.000000
	DrawScale=0.250000
	MultiSkins(0)=BoltStormRorCor01
	
	BoltTex(0)=BoltStormRorCor01
	BoltTex(1)=BoltStormRorCor02
	BoltTex(2)=BoltStormRorCor03
	BoltTex(3)=BoltStormRorCor04
	
	BoltMesh(0)=BoltStormRotParticles01
	BoltMesh(1)=BoltStormRotParticles02
	BoltMesh(2)=BoltStormRotParticles03
	BoltMesh(3)=BoltStormRotParticles04
}
