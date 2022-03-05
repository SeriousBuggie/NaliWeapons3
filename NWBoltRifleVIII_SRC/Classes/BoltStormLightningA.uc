//////////////////////////////////////////////////////////////
//				Feralidragon (14-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltStormLightningA expands NaliWEffects;

#exec MESH IMPORT MESH=BoltStormLightningA ANIVFILE=MODELS\BoltStormLightningA_a.3d DATAFILE=MODELS\BoltStormLightningA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltStormLightningA STRENGTH=0
#exec MESH ORIGIN MESH=BoltStormLightningA X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric00 STARTFRAME=19 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric01 STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric02 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric03 STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric04 STARTFRAME=3 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric05 STARTFRAME=4 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric06 STARTFRAME=5 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric07 STARTFRAME=6 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric08 STARTFRAME=7 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric09 STARTFRAME=8 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric10 STARTFRAME=9 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric11 STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric12 STARTFRAME=11 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric13 STARTFRAME=12 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric14 STARTFRAME=13 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric15 STARTFRAME=14 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric16 STARTFRAME=15 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric17 STARTFRAME=16 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric18 STARTFRAME=17 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightningA SEQ=Electric19 STARTFRAME=18 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=BoltStormLightningA MESH=BoltStormLightningA
#exec MESHMAP SCALE MESHMAP=BoltStormLightningA X=0.2 Y=0.2 Z=0.4

#exec AUDIO IMPORT NAME="BoltElectricSmallDisch01" FILE=SOUNDS\BoltElectricSmallDisch01.wav GROUP="Storm"
#exec AUDIO IMPORT NAME="BoltElectricSmallDisch02" FILE=SOUNDS\BoltElectricSmallDisch02.wav GROUP="Storm"
#exec AUDIO IMPORT NAME="BoltElectricSmallDisch03" FILE=SOUNDS\BoltElectricSmallDisch03.wav GROUP="Storm"
#exec AUDIO IMPORT NAME="BoltElectricSmallDisch04" FILE=SOUNDS\BoltElectricSmallDisch04.wav GROUP="Storm"
#exec AUDIO IMPORT NAME="BoltElectricSmallDisch05" FILE=SOUNDS\BoltElectricSmallDisch05.wav GROUP="Storm"

#exec OBJ LOAD FILE=Textures\BoltEnergyFX.utx PACKAGE=NWBoltRifleVIII_SRC.BoltEnergyFX


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
	Mesh=BoltStormLightningA
	
	bUnlit=True
	LifeSpan=0.150000
	DrawScale=1.00000
	ScaleGlow=2.000000
	Style=STY_Translucent
	
	MultiSkins(1)=BoltLightLightningFX01
	
	FadeInTime=0.050000
	FadeOutTime=0.000000
	ElectricalTransTime=0.050000
	
	RandElectricTex(0)=BoltLightLightningFX01
	RandElectricTex(1)=BoltLightLightningFX02
	RandElectricTex(2)=BoltLightLightningFX03
	RandElectricTex(3)=BoltLightLightningFX04
	RandElectricTex(4)=BoltLightLightningFX05
	RandElectricTex(5)=BoltLightLightningFX06
	RandElectricTex(6)=BoltLightLightningFX07
	RandElectricTex(7)=BoltLightLightningFX08
	
	ElectricSnd(0)=BoltElectricSmallDisch01
	ElectricSnd(1)=BoltElectricSmallDisch02
	ElectricSnd(2)=BoltElectricSmallDisch03
	ElectricSnd(3)=BoltElectricSmallDisch04
	ElectricSnd(4)=BoltElectricSmallDisch05
	
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
	
	ElectricSndOdds=0.550000
	ElectricSndVol=0.750000
	ElectricSndRadius=2000.000000
	GlowMaxCoef=1.000000
	GlowMinCoef=0.500000
}
