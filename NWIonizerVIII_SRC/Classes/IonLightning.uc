//////////////////////////////////////////////////////////////
//				Feralidragon (31-12-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonLightning expands NaliWEffects;

#exec MESH IMPORT MESH=IonLightning ANIVFILE=MODELS\IonLightning_a.3d DATAFILE=MODELS\IonLightning_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonLightning STRENGTH=0
#exec MESH ORIGIN MESH=IonLightning X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonLightning SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=IonLightning SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric00 STARTFRAME=19 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric01 STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric02 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric03 STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric04 STARTFRAME=3 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric05 STARTFRAME=4 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric06 STARTFRAME=5 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric07 STARTFRAME=6 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric08 STARTFRAME=7 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric09 STARTFRAME=8 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric10 STARTFRAME=9 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric11 STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric12 STARTFRAME=11 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric13 STARTFRAME=12 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric14 STARTFRAME=13 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric15 STARTFRAME=14 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric16 STARTFRAME=15 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric17 STARTFRAME=16 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric18 STARTFRAME=17 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonLightning SEQ=Electric19 STARTFRAME=18 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=IonLightning MESH=IonLightning
#exec MESHMAP SCALE MESHMAP=IonLightning X=0.2 Y=0.2 Z=0.4

#exec OBJ LOAD FILE=Textures\IonLightnings.utx PACKAGE=NWIonizerVIII_SRC.IonLightnings

#exec AUDIO IMPORT NAME="IonElectric01" FILE=SOUNDS\IonElectric01.wav GROUP="IonizerElectric"
#exec AUDIO IMPORT NAME="IonElectric02" FILE=SOUNDS\IonElectric02.wav GROUP="IonizerElectric"
#exec AUDIO IMPORT NAME="IonElectric03" FILE=SOUNDS\IonElectric03.wav GROUP="IonizerElectric"
#exec AUDIO IMPORT NAME="IonElectric04" FILE=SOUNDS\IonElectric04.wav GROUP="IonizerElectric"
#exec AUDIO IMPORT NAME="IonElectric05" FILE=SOUNDS\IonElectric05.wav GROUP="IonizerElectric"


var() float LightningLength;
var() texture RandElectricTex[8];
var() name ElectricalTweens[20];
var() float FadeInTime, FadeOutTime;
var() float ElectricalTransTime;
var() sound ElectricSnd[5];
var() float ElectricSndVol, ElectricSndRadius;

var byte curT;


simulated function PostBeginPlay()
{
	MultiSkins[1] = RandElectricTex[Rand(ArrayCount(RandElectricTex))];
	AnimLightning();
}

simulated function PlayLightningSound()
{
	PlaySound(ElectricSnd[Rand(ArrayCount(ElectricSnd))],, ElectricSndVol,, ElectricSndRadius);
}

function PlayServerLightningSound()
{
	PlaySound(ElectricSnd[Rand(ArrayCount(ElectricSnd))],, ElectricSndVol,, ElectricSndRadius);
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
	Mesh=IonLightning
	
	bUnlit=True
	LifeSpan=0.550000
	DrawScale=1.00000
	ScaleGlow=2.000000
	Style=STY_Translucent
	
	MultiSkins(1)=IonLightningFX01
	
	LightningLength=128.000000
	FadeInTime=0.150000
	FadeOutTime=0.250000
	ElectricalTransTime=0.100000
	
	RandElectricTex(0)=IonLightningFX01
	RandElectricTex(1)=IonLightningFX02
	RandElectricTex(2)=IonLightningFX03
	RandElectricTex(3)=IonLightningFX04
	RandElectricTex(4)=IonLightningFX05
	RandElectricTex(5)=IonLightningFX06
	RandElectricTex(6)=IonLightningFX07
	RandElectricTex(7)=IonLightningFX08
	
	ElectricSnd(0)=IonElectric01
	ElectricSnd(1)=IonElectric02
	ElectricSnd(2)=IonElectric03
	ElectricSnd(3)=IonElectric04
	ElectricSnd(4)=IonElectric05
	
	ElectricSndVol=30.000000
	ElectricSndRadius=7500.000000
	
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
