//////////////////////////////////////////////////////////////
//				Feralidragon (15-01-2014)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolLightning expands NaliWEffects;

#exec MESH IMPORT MESH=UltimaSolLightning ANIVFILE=MODELS\UltimaSolLightning_a.3d DATAFILE=MODELS\UltimaSolLightning_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaSolLightning STRENGTH=0
#exec MESH ORIGIN MESH=UltimaSolLightning X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric00 STARTFRAME=19 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric01 STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric02 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric03 STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric04 STARTFRAME=3 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric05 STARTFRAME=4 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric06 STARTFRAME=5 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric07 STARTFRAME=6 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric08 STARTFRAME=7 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric09 STARTFRAME=8 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric10 STARTFRAME=9 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric11 STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric12 STARTFRAME=11 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric13 STARTFRAME=12 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric14 STARTFRAME=13 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric15 STARTFRAME=14 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric16 STARTFRAME=15 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric17 STARTFRAME=16 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric18 STARTFRAME=17 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaSolLightning SEQ=Electric19 STARTFRAME=18 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=UltimaSolLightning MESH=UltimaSolLightning
#exec MESHMAP SCALE MESHMAP=UltimaSolLightning X=0.2 Y=0.2 Z=0.4

#exec AUDIO IMPORT NAME="UltimaSolLightningSnd01" FILE=SOUNDS\UltimaSolLightningSnd01.wav GROUP="UltimaSolFX"
#exec AUDIO IMPORT NAME="UltimaSolLightningSnd02" FILE=SOUNDS\UltimaSolLightningSnd02.wav GROUP="UltimaSolFX"
#exec AUDIO IMPORT NAME="UltimaSolLightningSnd03" FILE=SOUNDS\UltimaSolLightningSnd03.wav GROUP="UltimaSolFX"
#exec AUDIO IMPORT NAME="UltimaSolLightningSnd04" FILE=SOUNDS\UltimaSolLightningSnd04.wav GROUP="UltimaSolFX"
#exec AUDIO IMPORT NAME="UltimaSolLightningSnd05" FILE=SOUNDS\UltimaSolLightningSnd05.wav GROUP="UltimaSolFX"

#exec OBJ LOAD FILE=Textures\UltimaSolEnergyFX.utx PACKAGE=NWUltimaProtosVIII_SRC.UltimaSolEnergyFX


const LightningLength = 128.000000;

var() texture RandElectricTex[8];
var() name ElectricalTweens[20];
var() float FadeInTime, FadeOutTime;
var() float ElectricalTransTime;
var() sound ElectricSnd[5];
var() float ElectricSndVol, ElectricSndRadius;
var() float ElectricSndOdds;

var() bool bUpdateLightingPos;
var() float GlowMinCoef, GlowMaxCoef;

var actor ProjRef;
var vector HitSpot, ProjSpot;
var byte curT;


simulated function PostBeginPlay()
{
	MultiSkins[1] = RandElectricTex[Rand(ArrayCount(RandElectricTex))];
	if (FRand() <= ElectricSndOdds)
		PlaySound(ElectricSnd[Rand(ArrayCount(ElectricSnd))],, ElectricSndVol,, ElectricSndRadius);
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
		if (FadeInTime > 0.0 && L <= FadeInTime)
			ScaleGlow = L * Default.Scaleglow / FadeInTime;
		else if (FadeOutTime > 0.0 && LifeSpan <= FadeOutTime)
			ScaleGlow = LifeSpan * Default.Scaleglow / FadeOutTime;
		else
			ScaleGlow = Default.Scaleglow;
		ScaleGlow *= (FRand()*(GlowMaxCoef - GlowMinCoef) + GlowMinCoef);
		if (bUpdateLightingPos)
			UpdateLighting();
	}
}

simulated function SetLightning(actor ARef, vector HitLoc)
{
	ProjRef = ARef;
	HitSpot = HitLoc;
	UpdateLighting();
}

simulated function SetLightningPos(vector HitStart, vector HitLoc)
{
	ProjSpot = HitStart;
	HitSpot = HitLoc;
	UpdateLighting();
}

simulated function UpdateLighting()
{
	if (ProjRef != None)
	{
		SetLocation(ProjRef.Location);
		SetRotation(rotator(HitSpot - ProjRef.Location));
		DrawScale = VSize(HitSpot - ProjRef.Location) / LightningLength;
	}
	else if (VSize(ProjSpot) > 0.0)
	{
		SetLocation(ProjSpot);
		SetRotation(rotator(HitSpot - ProjSpot));
		DrawScale = VSize(HitSpot - ProjSpot) / LightningLength;
	}
}



defaultproperties
{
	DrawType=DT_Mesh
	Mesh=UltimaSolLightning
	
	bUnlit=True
	LifeSpan=0.300000
	DrawScale=1.00000
	ScaleGlow=2.000000
	Style=STY_Translucent
	
	MultiSkins(1)=UltimaSolLightningFX01
	
	FadeInTime=0.050000
	FadeOutTime=0.000000
	ElectricalTransTime=0.100000
	
	RandElectricTex(0)=UltimaSolLightningFX01
	RandElectricTex(1)=UltimaSolLightningFX02
	RandElectricTex(2)=UltimaSolLightningFX03
	RandElectricTex(3)=UltimaSolLightningFX04
	RandElectricTex(4)=UltimaSolLightningFX05
	RandElectricTex(5)=UltimaSolLightningFX06
	RandElectricTex(6)=UltimaSolLightningFX07
	RandElectricTex(7)=UltimaSolLightningFX08
	
	ElectricSnd(0)=UltimaSolLightningSnd01
	ElectricSnd(1)=UltimaSolLightningSnd02
	ElectricSnd(2)=UltimaSolLightningSnd03
	ElectricSnd(3)=UltimaSolLightningSnd04
	ElectricSnd(4)=UltimaSolLightningSnd05
	
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
	
	ElectricSndOdds=0.100000
	ElectricSndVol=0.550000
	ElectricSndRadius=10000.000000
	GlowMaxCoef=1.000000
	GlowMinCoef=0.500000
}
