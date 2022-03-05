//////////////////////////////////////////////////////////////
//				Feralidragon (29-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltWaterSparks expands NaliZPEffects;

#exec MESH IMPORT MESH=BoltWaterSparks ANIVFILE=MODELS\BoltWaterSparks_a.3d DATAFILE=MODELS\BoltWaterSparks_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltWaterSparks STRENGTH=0.65
#exec MESH ORIGIN MESH=BoltWaterSparks X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltWaterSparks SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltWaterSparks SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=BoltWaterSparks MESH=BoltWaterSparks
#exec MESHMAP SCALE MESHMAP=BoltWaterSparks X=0.1 Y=0.1 Z=0.2

//EMP Spark textures
#exec TEXTURE IMPORT NAME=EMPSpark01 FILE=EMP\EMPSpark01.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark02 FILE=EMP\EMPSpark02.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark03 FILE=EMP\EMPSpark03.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark04 FILE=EMP\EMPSpark04.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark05 FILE=EMP\EMPSpark05.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark06 FILE=EMP\EMPSpark06.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark07 FILE=EMP\EMPSpark07.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark08 FILE=EMP\EMPSpark08.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark09 FILE=EMP\EMPSpark09.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark10 FILE=EMP\EMPSpark10.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark11 FILE=EMP\EMPSpark11.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark12 FILE=EMP\EMPSpark12.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark13 FILE=EMP\EMPSpark13.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark14 FILE=EMP\EMPSpark14.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark15 FILE=EMP\EMPSpark15.bmp GROUP=EMP FLAGS=2
#exec TEXTURE IMPORT NAME=EMPSpark16 FILE=EMP\EMPSpark16.bmp GROUP=EMP FLAGS=2

#exec MESHMAP SETTEXTURE MESHMAP=BoltWaterSparks NUM=1 TEXTURE=EMPSpark01
#exec MESHMAP SETTEXTURE MESHMAP=BoltWaterSparks NUM=2 TEXTURE=EMPSpark02
#exec MESHMAP SETTEXTURE MESHMAP=BoltWaterSparks NUM=3 TEXTURE=EMPSpark03
#exec MESHMAP SETTEXTURE MESHMAP=BoltWaterSparks NUM=4 TEXTURE=EMPSpark04
#exec MESHMAP SETTEXTURE MESHMAP=BoltWaterSparks NUM=5 TEXTURE=EMPSpark05
#exec MESHMAP SETTEXTURE MESHMAP=BoltWaterSparks NUM=6 TEXTURE=EMPSpark06
#exec MESHMAP SETTEXTURE MESHMAP=BoltWaterSparks NUM=7 TEXTURE=EMPSpark07

var() texture EMPSparkTex[16];
var() float SparkOdds;

simulated function Tick(float Delta)
{
local byte i;
local rotator R;

	Super.Tick(Delta);

	for (i = 1; i < 8; i++)
	{
		if (FRand() < SparkOdds)
			MultiSkins[i] = EMPSparkTex[Rand(ArrayCount(EMPSparkTex))];
		else
			MultiSkins[i] = Texture'TranslucInvis';
	}
	
	ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan + (2*FRand() - 1)*0.5;
	DrawScale = (Default.LifeSpan - LifeSpan) * Default.DrawScale / Default.LifeSpan + (2*FRand() - 1)*2;
	R.Yaw = Rand(32768) * 2;
	SetRotation(R);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=BoltWaterSparks
	
	DrawScale=10.000000
	ScaleGlow=3.500000
	LifeSpan=0.500000
	
	bUnlit=True
	Style=STY_Translucent
	
	EMPSparkTex(0)=EMPSpark01
	EMPSparkTex(1)=EMPSpark02
	EMPSparkTex(2)=EMPSpark03
	EMPSparkTex(3)=EMPSpark04
	EMPSparkTex(4)=EMPSpark05
	EMPSparkTex(5)=EMPSpark06
	EMPSparkTex(6)=EMPSpark07
	EMPSparkTex(7)=EMPSpark08
	EMPSparkTex(8)=EMPSpark09
	EMPSparkTex(9)=EMPSpark10
	EMPSparkTex(10)=EMPSpark11
	EMPSparkTex(11)=EMPSpark12
	EMPSparkTex(12)=EMPSpark13
	EMPSparkTex(13)=EMPSpark14
	EMPSparkTex(14)=EMPSpark15
	EMPSparkTex(15)=EMPSpark16
	
	SparkOdds=0.250000
}
