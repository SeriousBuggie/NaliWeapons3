//////////////////////////////////////////////////////////////
//				Feralidragon (24-08-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravVortexRotParticles expands NaliWEffects;

#exec MESH IMPORT MESH=GravVortexRotParticles01 ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravVortexRotParticles01 STRENGTH=0.0
#exec MESH ORIGIN MESH=GravVortexRotParticles01 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravVortexRotParticles01 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravVortexRotParticles01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravVortexRotParticles01 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexRotParticles01 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravVortexRotParticles01 MESH=GravVortexRotParticles01
#exec MESHMAP SCALE MESHMAP=GravVortexRotParticles01 X=0.25 Y=0.25 Z=0.5

#exec MESH IMPORT MESH=GravVortexRotParticles02 ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravVortexRotParticles02 STRENGTH=0.0
#exec MESH ORIGIN MESH=GravVortexRotParticles02 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravVortexRotParticles02 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravVortexRotParticles02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravVortexRotParticles02 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexRotParticles02 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravVortexRotParticles02 MESH=GravVortexRotParticles02
#exec MESHMAP SCALE MESHMAP=GravVortexRotParticles02 X=0.375 Y=0.375 Z=0.75

#exec MESH IMPORT MESH=GravVortexRotParticles03 ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravVortexRotParticles03 STRENGTH=0.0
#exec MESH ORIGIN MESH=GravVortexRotParticles03 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravVortexRotParticles03 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravVortexRotParticles03 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravVortexRotParticles03 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexRotParticles03 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravVortexRotParticles03 MESH=GravVortexRotParticles03
#exec MESHMAP SCALE MESHMAP=GravVortexRotParticles03 X=0.5 Y=0.5 Z=1.0

#exec MESH IMPORT MESH=GravVortexRotParticles04 ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravVortexRotParticles04 STRENGTH=0.0
#exec MESH ORIGIN MESH=GravVortexRotParticles04 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravVortexRotParticles04 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravVortexRotParticles04 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravVortexRotParticles04 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexRotParticles04 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravVortexRotParticles04 MESH=GravVortexRotParticles04
#exec MESHMAP SCALE MESHMAP=GravVortexRotParticles04 X=0.625 Y=0.625 Z=1.25

#exec MESH IMPORT MESH=GravVortexRotParticles05 ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravVortexRotParticles05 STRENGTH=0.0
#exec MESH ORIGIN MESH=GravVortexRotParticles05 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravVortexRotParticles05 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravVortexRotParticles05 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravVortexRotParticles05 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexRotParticles05 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravVortexRotParticles05 MESH=GravVortexRotParticles05
#exec MESHMAP SCALE MESHMAP=GravVortexRotParticles05 X=0.75 Y=0.75 Z=1.5

#exec MESH IMPORT MESH=GravVortexRotParticles06 ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravVortexRotParticles06 STRENGTH=0.0
#exec MESH ORIGIN MESH=GravVortexRotParticles06 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravVortexRotParticles06 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravVortexRotParticles06 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravVortexRotParticles06 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexRotParticles06 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravVortexRotParticles06 MESH=GravVortexRotParticles06
#exec MESHMAP SCALE MESHMAP=GravVortexRotParticles06 X=0.875 Y=0.875 Z=1.75

#exec MESH IMPORT MESH=GravVortexRotParticles07 ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravVortexRotParticles07 STRENGTH=0.0
#exec MESH ORIGIN MESH=GravVortexRotParticles07 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravVortexRotParticles07 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravVortexRotParticles07 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravVortexRotParticles07 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexRotParticles07 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravVortexRotParticles07 MESH=GravVortexRotParticles07
#exec MESHMAP SCALE MESHMAP=GravVortexRotParticles07 X=1.0 Y=1.0 Z=2.0

#exec MESH IMPORT MESH=GravVortexRotParticles08 ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravVortexRotParticles08 STRENGTH=0.0
#exec MESH ORIGIN MESH=GravVortexRotParticles08 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravVortexRotParticles08 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravVortexRotParticles08 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravVortexRotParticles08 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexRotParticles08 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravVortexRotParticles08 MESH=GravVortexRotParticles08
#exec MESHMAP SCALE MESHMAP=GravVortexRotParticles08 X=1.125 Y=1.125 Z=2.25

#exec MESH IMPORT MESH=GravVortexRotParticles09 ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravVortexRotParticles09 STRENGTH=0.0
#exec MESH ORIGIN MESH=GravVortexRotParticles09 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravVortexRotParticles09 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravVortexRotParticles09 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravVortexRotParticles09 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexRotParticles09 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravVortexRotParticles09 MESH=GravVortexRotParticles09
#exec MESHMAP SCALE MESHMAP=GravVortexRotParticles09 X=1.5 Y=1.5 Z=3.0

#exec MESH IMPORT MESH=GravVortexRotParticles10 ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravVortexRotParticles10 STRENGTH=0.0
#exec MESH ORIGIN MESH=GravVortexRotParticles10 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravVortexRotParticles10 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravVortexRotParticles10 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravVortexRotParticles10 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexRotParticles10 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravVortexRotParticles10 MESH=GravVortexRotParticles10
#exec MESHMAP SCALE MESHMAP=GravVortexRotParticles10 X=2.0 Y=2.0 Z=4.0

#exec MESH IMPORT MESH=GravVortexRotParticles11 ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravVortexRotParticles11 STRENGTH=0.0
#exec MESH ORIGIN MESH=GravVortexRotParticles11 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravVortexRotParticles11 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravVortexRotParticles11 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravVortexRotParticles11 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexRotParticles11 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravVortexRotParticles11 MESH=GravVortexRotParticles11
#exec MESHMAP SCALE MESHMAP=GravVortexRotParticles11 X=3.0 Y=3.0 Z=6.0

#exec MESH IMPORT MESH=GravVortexRotParticles12 ANIVFILE=MODELS\GravVortexRotParticles_a.3d DATAFILE=MODELS\GravVortexRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravVortexRotParticles12 STRENGTH=0.0
#exec MESH ORIGIN MESH=GravVortexRotParticles12 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GravVortexRotParticles12 SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=GravVortexRotParticles12 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravVortexRotParticles12 SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=GravVortexRotParticles12 SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=GravVortexRotParticles12 MESH=GravVortexRotParticles12
#exec MESHMAP SCALE MESHMAP=GravVortexRotParticles12 X=5.0 Y=5.0 Z=10.0

#exec TEXTURE IMPORT NAME=GravVortexRorCor01 FILE=Coronas\GravVortexRorCor01.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=GravVortexRorCor02 FILE=Coronas\GravVortexRorCor02.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=GravVortexRorCor03 FILE=Coronas\GravVortexRorCor03.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=GravVortexRorCor04 FILE=Coronas\GravVortexRorCor04.bmp GROUP=Coronas FLAGS=2


var() texture GravTex[4];
var() mesh GravMesh[12];
var() float fadeInTime, fadeOutTime;
var float fCount;
var float initDScale;
var bool bFadeOut;

simulated function PostBeginPlay()
{
	initDScale = DrawScale;
}

simulated function InitializeFX(optional float rotRate, optional float fadeIn, optional byte density, optional byte meshN, optional float baseDScale)
{
local byte i;

	if (meshN > 0 && meshN <= ArrayCount(GravMesh))
		Mesh = GravMesh[--meshN];
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
			MultiSkins[Rand(ArrayCount(MultiSkins))] = GravTex[Rand(ArrayCount(GravTex))];
	}
}

simulated function FadeOut(float t)
{
	fadeOutTime = t;
	fCount = fadeOutTime;
	bFadeOut = True;
}

simulated function Tick(float Delta)
{
local float baseGlow;

	if (Level.NetMode != NM_DedicatedServer)
	{
		baseGlow = Default.ScaleGlow;
		if (bFadeOut)
		{
			fCount -= Delta;
			if (fCount <= 0 || fadeOutTime <= 0)
			{
				Destroy();
				return;
			}
			baseGlow *= (fCount/fadeOutTime);
		}
		else
		{
			fCount += Delta;
			if (fCount <= fadeInTime)
				baseGlow *= (fCount/fadeInTime);
		}
		DrawScale = initDScale * (FRand()*0.3+0.7);
		ScaleGlow = baseGlow * (FRand()*0.75+0.25);
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=GravVortexRotParticles01
	bNetTemporary=True
	bUnlit=True
	bParticles=True
	bRandomFrame=True
	Texture=TranslucInvis
	Style=STY_Translucent
	ScaleGlow=2.000000
	DrawScale=0.250000
	MultiSkins(0)=GravVortexRorCor01
	
	GravTex(0)=GravVortexRorCor01
	GravTex(1)=GravVortexRorCor02
	GravTex(2)=GravVortexRorCor03
	GravTex(3)=GravVortexRorCor04
	
	GravMesh(0)=GravVortexRotParticles01
	GravMesh(1)=GravVortexRotParticles02
	GravMesh(2)=GravVortexRotParticles03
	GravMesh(3)=GravVortexRotParticles04
	GravMesh(4)=GravVortexRotParticles05
	GravMesh(5)=GravVortexRotParticles06
	GravMesh(6)=GravVortexRotParticles07
	GravMesh(7)=GravVortexRotParticles08
	GravMesh(8)=GravVortexRotParticles09
	GravMesh(9)=GravVortexRotParticles10
	GravMesh(10)=GravVortexRotParticles11
	GravMesh(11)=GravVortexRotParticles12
}
