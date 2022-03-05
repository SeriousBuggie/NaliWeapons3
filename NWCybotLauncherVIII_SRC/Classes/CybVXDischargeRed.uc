//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVXDischargeRed expands NaliWEffects;

#exec TEXTURE IMPORT NAME=VXElectricRed01 FILE=CORONAS\VXElectricRed01.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VXElectricRed02 FILE=CORONAS\VXElectricRed02.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VXElectricRed03 FILE=CORONAS\VXElectricRed03.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VXElectricRed04 FILE=CORONAS\VXElectricRed04.bmp GROUP=ElecFX LODSET=2

#exec AUDIO IMPORT NAME="VXDischargeSnd01" FILE=SOUNDS\VXDischargeSnd01.wav GROUP="ElectricFX"
#exec AUDIO IMPORT NAME="VXDischargeSnd02" FILE=SOUNDS\VXDischargeSnd02.wav GROUP="ElectricFX"
#exec AUDIO IMPORT NAME="VXDischargeSnd03" FILE=SOUNDS\VXDischargeSnd03.wav GROUP="ElectricFX"
#exec AUDIO IMPORT NAME="VXDischargeSnd04" FILE=SOUNDS\VXDischargeSnd04.wav GROUP="ElectricFX"

//Mesh Variation 1
//----------------------------------------------------------------------------------------
#exec MESH IMPORT MESH=CybVXDischargeA ANIVFILE=MODELS\CybVXDischargeRed_a.3d DATAFILE=MODELS\CybVXDischargeRed_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybVXDischargeA STRENGTH=0.25
#exec MESH ORIGIN MESH=CybVXDischargeA X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybVXDischargeA SEQ=All STARTFRAME=0 NUMFRAMES=7
#exec MESH SEQUENCE MESH=CybVXDischargeA SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybVXDischargeA SEQ=Electric1 STARTFRAME=0 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybVXDischargeA SEQ=Electric2 STARTFRAME=2 NUMFRAMES=5 RATE=4.0
#exec MESH SEQUENCE MESH=CybVXDischargeA SEQ=Electric3 STARTFRAME=0 NUMFRAMES=5 RATE=4.0
#exec MESH SEQUENCE MESH=CybVXDischargeA SEQ=Electric4 STARTFRAME=1 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybVXDischargeA SEQ=Electric5 STARTFRAME=0 NUMFRAMES=6 RATE=5.0

#exec MESHMAP NEW MESHMAP=CybVXDischargeA MESH=CybVXDischargeA
#exec MESHMAP SCALE MESHMAP=CybVXDischargeA X=0.5 Y=0.5 Z=1.0

#exec MESHMAP SETTEXTURE MESHMAP=CybVXDischargeA NUM=1 TEXTURE=VXElectricRed01
//----------------------------------------------------------------------------------------

//Mesh Variation 2
//----------------------------------------------------------------------------------------
#exec MESH IMPORT MESH=CybVXDischargeB ANIVFILE=MODELS\CybVXDischargeRed_a.3d DATAFILE=MODELS\CybVXDischargeRed_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybVXDischargeB STRENGTH=0.25
#exec MESH ORIGIN MESH=CybVXDischargeB X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CybVXDischargeB SEQ=All STARTFRAME=0 NUMFRAMES=7
#exec MESH SEQUENCE MESH=CybVXDischargeB SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybVXDischargeB SEQ=Electric1 STARTFRAME=0 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybVXDischargeB SEQ=Electric2 STARTFRAME=2 NUMFRAMES=5 RATE=4.0
#exec MESH SEQUENCE MESH=CybVXDischargeB SEQ=Electric3 STARTFRAME=0 NUMFRAMES=5 RATE=4.0
#exec MESH SEQUENCE MESH=CybVXDischargeB SEQ=Electric4 STARTFRAME=1 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybVXDischargeB SEQ=Electric5 STARTFRAME=0 NUMFRAMES=6 RATE=5.0

#exec MESHMAP NEW MESHMAP=CybVXDischargeB MESH=CybVXDischargeB
#exec MESHMAP SCALE MESHMAP=CybVXDischargeB X=0.5 Y=0.5 Z=1.0

#exec MESHMAP SETTEXTURE MESHMAP=CybVXDischargeB NUM=1 TEXTURE=VXElectricRed01
//----------------------------------------------------------------------------------------

//Mesh Variation 3
//----------------------------------------------------------------------------------------
#exec MESH IMPORT MESH=CybVXDischargeC ANIVFILE=MODELS\CybVXDischargeRed_a.3d DATAFILE=MODELS\CybVXDischargeRed_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybVXDischargeC STRENGTH=0.25
#exec MESH ORIGIN MESH=CybVXDischargeC X=0 Y=0 Z=0 PITCH=128

#exec MESH SEQUENCE MESH=CybVXDischargeC SEQ=All STARTFRAME=0 NUMFRAMES=7
#exec MESH SEQUENCE MESH=CybVXDischargeC SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybVXDischargeC SEQ=Electric1 STARTFRAME=0 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybVXDischargeC SEQ=Electric2 STARTFRAME=2 NUMFRAMES=5 RATE=4.0
#exec MESH SEQUENCE MESH=CybVXDischargeC SEQ=Electric3 STARTFRAME=0 NUMFRAMES=5 RATE=4.0
#exec MESH SEQUENCE MESH=CybVXDischargeC SEQ=Electric4 STARTFRAME=1 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybVXDischargeC SEQ=Electric5 STARTFRAME=0 NUMFRAMES=6 RATE=5.0

#exec MESHMAP NEW MESHMAP=CybVXDischargeC MESH=CybVXDischargeC
#exec MESHMAP SCALE MESHMAP=CybVXDischargeC X=0.5 Y=0.5 Z=1.0

#exec MESHMAP SETTEXTURE MESHMAP=CybVXDischargeC NUM=1 TEXTURE=VXElectricRed01
//----------------------------------------------------------------------------------------

//Mesh Variation 4
//----------------------------------------------------------------------------------------
#exec MESH IMPORT MESH=CybVXDischargeD ANIVFILE=MODELS\CybVXDischargeRed_a.3d DATAFILE=MODELS\CybVXDischargeRed_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybVXDischargeD STRENGTH=0.25
#exec MESH ORIGIN MESH=CybVXDischargeD X=0 Y=0 Z=0 ROLL=128

#exec MESH SEQUENCE MESH=CybVXDischargeD SEQ=All STARTFRAME=0 NUMFRAMES=7
#exec MESH SEQUENCE MESH=CybVXDischargeD SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybVXDischargeD SEQ=Electric1 STARTFRAME=0 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybVXDischargeD SEQ=Electric2 STARTFRAME=2 NUMFRAMES=5 RATE=4.0
#exec MESH SEQUENCE MESH=CybVXDischargeD SEQ=Electric3 STARTFRAME=0 NUMFRAMES=5 RATE=4.0
#exec MESH SEQUENCE MESH=CybVXDischargeD SEQ=Electric4 STARTFRAME=1 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybVXDischargeD SEQ=Electric5 STARTFRAME=0 NUMFRAMES=6 RATE=5.0

#exec MESHMAP NEW MESHMAP=CybVXDischargeD MESH=CybVXDischargeD
#exec MESHMAP SCALE MESHMAP=CybVXDischargeD X=0.5 Y=0.5 Z=1.0

#exec MESHMAP SETTEXTURE MESHMAP=CybVXDischargeD NUM=1 TEXTURE=VXElectricRed01
//----------------------------------------------------------------------------------------


var() texture ElectricSeqTex[4];
var() Mesh RndMesh[4];
var() sound RndFXSnd[4];
var() name AnimRnd[5];
var() float ElectricAnimRate;
var() float SeqRate;
var byte seqCount;
var() float fadeInTime;

const ElectricDisLength = 200.000000;


simulated function PostBeginPlay()
{
	if (SeqRate > 0)
		SetTimer(1/SeqRate, True);
	
	Mesh = RndMesh[Rand(ArrayCount(RndMesh))];
		
	if (ElectricAnimRate > 0)
		LoopAnim(AnimRnd[Rand(ArrayCount(AnimRnd))], ElectricAnimRate);
	
	EffectSound1 = RndFXSnd[Rand(ArrayCount(RndFXSnd))];
	Super.PostBeginPlay();
}

simulated function Timer()
{
	seqCount++;
	if (seqCount >= ArrayCount(ElectricSeqTex))
		seqCount = 0;
	MultiSkins[1] = ElectricSeqTex[seqCount];
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (Default.LifeSpan - LifeSpan <= fadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / fadeInTime;
		else
			ScaleGlow = LifeSpan * Default.ScaleGlow / (Default.LifeSpan - fadeInTime);
	}
}

simulated function AdjustSize(float size)
{
	DrawScale = size / ElectricDisLength;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybVXDischargeA
	
	SndVol=25.000000
	SndRadius=4500.000000
	
	bUnlit=True
	Scaleglow=4.500000
	Style=STY_Translucent
	DrawScale=1.000000
	
	MultiSkins(1)=VXElectricRed01
	
	LifeSpan=0.450000
	fadeInTime=0.100000
	
	ElectricSeqTex(0)=VXElectricRed01
	ElectricSeqTex(1)=VXElectricRed02
	ElectricSeqTex(2)=VXElectricRed03
	ElectricSeqTex(3)=VXElectricRed04
	SeqRate=20.000000
	
	RndMesh(0)=CybVXDischargeA
	RndMesh(1)=CybVXDischargeB
	RndMesh(2)=CybVXDischargeC
	RndMesh(3)=CybVXDischargeD
	
	AnimRnd(0)=Electric1
	AnimRnd(1)=Electric2
	AnimRnd(2)=Electric3
	AnimRnd(3)=Electric4
	AnimRnd(4)=Electric5
	ElectricAnimRate=10.000000
	
	RndFXSnd(0)=VXDischargeSnd01
	RndFXSnd(1)=VXDischargeSnd02
	RndFXSnd(2)=VXDischargeSnd03
	RndFXSnd(3)=VXDischargeSnd04
}
