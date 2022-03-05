//////////////////////////////////////////////////////////////
//				Feralidragon (28-08-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravChargeFXTrace expands NaliWEffects;

#exec TEXTURE IMPORT NAME=GravTrace FILE=Coronas\GravTrace.bmp GROUP=Coronas FLAGS=2

//Trace 01 Import
#exec MESH IMPORT MESH=GravChargeTrace01 ANIVFILE=MODELS\GravChargeTrace01_a.3d DATAFILE=MODELS\GravChargeTrace01_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravChargeTrace01 STRENGTH=0
#exec MESH ORIGIN MESH=GravChargeTrace01 X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=GravChargeTrace01 SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GravChargeTrace01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeTrace01 SEQ=Collapsed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeTrace01 SEQ=CloseCharge STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GravChargeTrace01 MESH=GravChargeTrace01
#exec MESHMAP SCALE MESHMAP=GravChargeTrace01 X=0.03 Y=0.03 Z=0.06

#exec MESHMAP SETTEXTURE MESHMAP=GravChargeTrace01 NUM=1 TEXTURE=GravTrace

//Trace 02 Import
#exec MESH IMPORT MESH=GravChargeTrace02 ANIVFILE=MODELS\GravChargeTrace02_a.3d DATAFILE=MODELS\GravChargeTrace02_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravChargeTrace02 STRENGTH=0
#exec MESH ORIGIN MESH=GravChargeTrace02 X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=GravChargeTrace02 SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GravChargeTrace02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeTrace02 SEQ=Collapsed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeTrace02 SEQ=CloseCharge STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GravChargeTrace02 MESH=GravChargeTrace02
#exec MESHMAP SCALE MESHMAP=GravChargeTrace02 X=0.03 Y=0.03 Z=0.06

#exec MESHMAP SETTEXTURE MESHMAP=GravChargeTrace02 NUM=1 TEXTURE=GravTrace

//Trace 03 Import
#exec MESH IMPORT MESH=GravChargeTrace03 ANIVFILE=MODELS\GravChargeTrace03_a.3d DATAFILE=MODELS\GravChargeTrace03_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravChargeTrace03 STRENGTH=0
#exec MESH ORIGIN MESH=GravChargeTrace03 X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=GravChargeTrace03 SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GravChargeTrace03 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeTrace03 SEQ=Collapsed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeTrace03 SEQ=CloseCharge STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GravChargeTrace03 MESH=GravChargeTrace03
#exec MESHMAP SCALE MESHMAP=GravChargeTrace03 X=0.03 Y=0.03 Z=0.06

#exec MESHMAP SETTEXTURE MESHMAP=GravChargeTrace03 NUM=1 TEXTURE=GravTrace

//Trace 04 Import
#exec MESH IMPORT MESH=GravChargeTrace04 ANIVFILE=MODELS\GravChargeTrace04_a.3d DATAFILE=MODELS\GravChargeTrace04_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravChargeTrace04 STRENGTH=0
#exec MESH ORIGIN MESH=GravChargeTrace04 X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=GravChargeTrace04 SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GravChargeTrace04 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeTrace04 SEQ=Collapsed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeTrace04 SEQ=CloseCharge STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GravChargeTrace04 MESH=GravChargeTrace04
#exec MESHMAP SCALE MESHMAP=GravChargeTrace04 X=0.03 Y=0.03 Z=0.06

#exec MESHMAP SETTEXTURE MESHMAP=GravChargeTrace04 NUM=1 TEXTURE=GravTrace

//Trace 05 Import
#exec MESH IMPORT MESH=GravChargeTrace05 ANIVFILE=MODELS\GravChargeTrace05_a.3d DATAFILE=MODELS\GravChargeTrace05_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravChargeTrace05 STRENGTH=0
#exec MESH ORIGIN MESH=GravChargeTrace05 X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=GravChargeTrace05 SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GravChargeTrace05 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeTrace05 SEQ=Collapsed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeTrace05 SEQ=CloseCharge STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GravChargeTrace05 MESH=GravChargeTrace05
#exec MESHMAP SCALE MESHMAP=GravChargeTrace05 X=0.03 Y=0.03 Z=0.06

#exec MESHMAP SETTEXTURE MESHMAP=GravChargeTrace05 NUM=1 TEXTURE=GravTrace

//Trace 06 Import
#exec MESH IMPORT MESH=GravChargeTrace06 ANIVFILE=MODELS\GravChargeTrace06_a.3d DATAFILE=MODELS\GravChargeTrace06_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GravChargeTrace06 STRENGTH=0
#exec MESH ORIGIN MESH=GravChargeTrace06 X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=GravChargeTrace06 SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GravChargeTrace06 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeTrace06 SEQ=Collapsed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeTrace06 SEQ=CloseCharge STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GravChargeTrace06 MESH=GravChargeTrace06
#exec MESHMAP SCALE MESHMAP=GravChargeTrace06 X=0.03 Y=0.03 Z=0.06

#exec MESHMAP SETTEXTURE MESHMAP=GravChargeTrace06 NUM=1 TEXTURE=GravTrace



var() Mesh RandGravTraceMesh[6];
var float MaxFadeTime, FadeTimeCount;

simulated function byte RandomizeAndPlay( optional float PlayRate)
{
local byte b;

	b = Rand(ArrayCount(RandGravTraceMesh));
	Mesh = RandGravTraceMesh[b];
	
	if (PlayRate > 0)
	{
		PlayAnim('CloseCharge', PlayRate, 0.0);
		MaxFadeTime = 1 / PlayRate;
	}
	else
	{
		PlayAnim('CloseCharge', 1.0, 0.0);
		MaxFadeTime = 1.0;
	}
	
	FadeTimeCount = MaxFadeTime;
	ScaleGlow = 0.0;
	
	return b;
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && FadeTimeCount > 0.0)
	{
		FadeTimeCount -= Delta;
		if (FadeTimeCount < 0.0)
			FadeTimeCount = 0.0;
		
		ScaleGlow = (MaxFadeTime - FadeTimeCount) * Default.ScaleGlow / MaxFadeTime;
	}
}

simulated function AnimEnd()
{
	Destroy();
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=GravChargeTrace01
	
	bHidden=True
	Style=STY_Translucent
	ScaleGlow=1.500000
	bUnlit=True
	bNetTemporary=True
	LifeSpan=0.000000
	
	RandGravTraceMesh(0)=GravChargeTrace01
	RandGravTraceMesh(1)=GravChargeTrace02
	RandGravTraceMesh(2)=GravChargeTrace03
	RandGravTraceMesh(3)=GravChargeTrace04
	RandGravTraceMesh(4)=GravChargeTrace05
	RandGravTraceMesh(5)=GravChargeTrace06
	
	MaxFadeTime=1.000000
	FadeTimeCount=1.000000
}
