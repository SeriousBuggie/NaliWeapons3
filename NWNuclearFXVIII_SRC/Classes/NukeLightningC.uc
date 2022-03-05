//////////////////////////////////////////////////////////////
//				Feralidragon (04-06-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeLightningC expands NaliWEffects;

#exec MESH IMPORT MESH=NukeLightningC ANIVFILE=MODELS\NukeLightningC_a.3d DATAFILE=MODELS\NukeLightningC_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NukeLightningC STRENGTH=0
#exec MESH ORIGIN MESH=NukeLightningC X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NukeLightningC SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric00 STARTFRAME=19 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric01 STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric02 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric03 STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric04 STARTFRAME=3 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric05 STARTFRAME=4 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric06 STARTFRAME=5 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric07 STARTFRAME=6 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric08 STARTFRAME=7 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric09 STARTFRAME=8 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric10 STARTFRAME=9 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric11 STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric12 STARTFRAME=11 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric13 STARTFRAME=12 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric14 STARTFRAME=13 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric15 STARTFRAME=14 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric16 STARTFRAME=15 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric17 STARTFRAME=16 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric18 STARTFRAME=17 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=NukeLightningC SEQ=Electric19 STARTFRAME=18 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=NukeLightningC MESH=NukeLightningC
#exec MESHMAP SCALE MESHMAP=NukeLightningC X=0.2 Y=0.2 Z=0.4

#exec OBJ LOAD FILE=Textures\NukeCLightnings.utx PACKAGE=NWNuclearFXVIII_SRC.NukeCLightnings


var() float LightningLength;
var() texture RandElectricTex[8];
var() name ElectricalTweens[20];
var() float FadeInTime, FadeOutTime;
var() float ElectricalTransTime;

var byte curT;


simulated function PostBeginPlay()
{
	MultiSkins[1] = RandElectricTex[Rand(ArrayCount(RandElectricTex))];
	do
	{
		MultiSkins[2] = RandElectricTex[Rand(ArrayCount(RandElectricTex))];
	} 
	until (MultiSkins[1] != MultiSkins[2]);
	AnimLightning();
}

simulated function AnimEnd()
{
	AnimLightning();
}

simulated function AnimLightning()
{
local byte newT;

	newT = Rand(ArrayCount(ElectricalTweens));
	if (newT == curT)
	{
		if (newT == 0)
			newT++;
		else
			newT--;
	}
	
	curT = newT;
	TweenAnim(ElectricalTweens[curT], ElectricalTransTime);
}

simulated function Tick(float Delta)
{
local float L;

	if (Level.NetMode != NM_DedicatedServer)
	{
		L = Default.LifeSpan - LifeSpan;
		if (L <= FadeInTime)
			ScaleGlow = L * Default.Scaleglow / FadeInTime;
		else if (LifeSpan <= FadeOutTime)
			ScaleGlow = LifeSpan * Default.Scaleglow / FadeOutTime;
	}
}

simulated function SetLightning(vector HitLoc)
{
	DrawScale = VSize(HitLoc - Location) / LightningLength;
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NukeLightningC
	
	bUnlit=True
	LifeSpan=0.350000
	DrawScale=1.00000
	ScaleGlow=2.000000
	Style=STY_Translucent
	
	MultiSkins(1)=NukeCLightningFX01
	MultiSkins(2)=NukeCLightningFX02
	
	LightningLength=128.000000
	FadeInTime=0.075000
	FadeOutTime=0.100000
	ElectricalTransTime=0.100000
	
	RandElectricTex(0)=NukeCLightningFX01
	RandElectricTex(1)=NukeCLightningFX02
	RandElectricTex(2)=NukeCLightningFX03
	RandElectricTex(3)=NukeCLightningFX04
	RandElectricTex(4)=NukeCLightningFX05
	RandElectricTex(5)=NukeCLightningFX06
	RandElectricTex(6)=NukeCLightningFX07
	RandElectricTex(7)=NukeCLightningFX08
	
	ElectricalTweens(0)=Electric00
	ElectricalTweens(1)=Electric01
	ElectricalTweens(2)=Electric02
	ElectricalTweens(3)=Electric03
	ElectricalTweens(4)=Electric04
	ElectricalTweens(5)=Electric05
	ElectricalTweens(6)=Electric06
	ElectricalTweens(7)=Electric07
	ElectricalTweens(8)=Electric08
	ElectricalTweens(9)=Electric09
	ElectricalTweens(10)=Electric10
	ElectricalTweens(11)=Electric11
	ElectricalTweens(12)=Electric12
	ElectricalTweens(13)=Electric13
	ElectricalTweens(14)=Electric14
	ElectricalTweens(15)=Electric15
	ElectricalTweens(16)=Electric16
	ElectricalTweens(17)=Electric17
	ElectricalTweens(18)=Electric18
	ElectricalTweens(19)=Electric19
}
