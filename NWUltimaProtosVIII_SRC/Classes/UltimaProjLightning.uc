//////////////////////////////////////////////////////////////
//				Feralidragon (05-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProjLightning expands NaliWEffects;

#exec MESH IMPORT MESH=UltimaProjLightning ANIVFILE=MODELS\UltimaProjLightning_a.3d DATAFILE=MODELS\UltimaProjLightning_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaProjLightning STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProjLightning X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric00 STARTFRAME=19 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric01 STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric02 STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric03 STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric04 STARTFRAME=3 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric05 STARTFRAME=4 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric06 STARTFRAME=5 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric07 STARTFRAME=6 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric08 STARTFRAME=7 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric09 STARTFRAME=8 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric10 STARTFRAME=9 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric11 STARTFRAME=10 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric12 STARTFRAME=11 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric13 STARTFRAME=12 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric14 STARTFRAME=13 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric15 STARTFRAME=14 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric16 STARTFRAME=15 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric17 STARTFRAME=16 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric18 STARTFRAME=17 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProjLightning SEQ=Electric19 STARTFRAME=18 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=UltimaProjLightning MESH=UltimaProjLightning
#exec MESHMAP SCALE MESHMAP=UltimaProjLightning X=0.2 Y=0.2 Z=0.4

#exec AUDIO IMPORT NAME="UltimaElectricDisch01" FILE=SOUNDS\UltimaElectricDisch01.wav GROUP="UltimaProtosProj"
#exec AUDIO IMPORT NAME="UltimaElectricDisch02" FILE=SOUNDS\UltimaElectricDisch02.wav GROUP="UltimaProtosProj"
#exec AUDIO IMPORT NAME="UltimaElectricDisch03" FILE=SOUNDS\UltimaElectricDisch03.wav GROUP="UltimaProtosProj"
#exec AUDIO IMPORT NAME="UltimaElectricDisch04" FILE=SOUNDS\UltimaElectricDisch04.wav GROUP="UltimaProtosProj"
#exec AUDIO IMPORT NAME="UltimaElectricDisch05" FILE=SOUNDS\UltimaElectricDisch05.wav GROUP="UltimaProtosProj"


const LightningLength = 128.000000;

var() texture RandElectricTex[4];
var() name ElectricalTweens[20];
var() float FadeInTime, FadeOutTime;
var() float ElectricalTransTime;
var() sound ElectricSnd[5];
var() float ElectricSndVol, ElectricSndRadius;

var actor ProjRef;
var vector HitSpot;
var byte curT;


simulated function PostBeginPlay()
{
	MultiSkins[1] = RandElectricTex[Rand(ArrayCount(RandElectricTex))];
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
		if (L <= FadeInTime)
			ScaleGlow = L * Default.Scaleglow / FadeInTime;
		else if (LifeSpan <= FadeOutTime)
			ScaleGlow = LifeSpan * Default.Scaleglow / FadeOutTime;
		
		UpdateLighting();
	}
}

simulated function SetLightning(actor ARef, vector HitLoc)
{
	ProjRef = ARef;
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
}



defaultproperties
{
	DrawType=DT_Mesh
	Mesh=UltimaProjLightning
	
	bUnlit=True
	LifeSpan=0.550000
	DrawScale=1.00000
	ScaleGlow=2.000000
	Style=STY_Translucent
	
	MultiSkins(1)=EnergyLightningFX01
	
	FadeInTime=0.150000
	FadeOutTime=0.150000
	ElectricalTransTime=0.150000
	
	RandElectricTex(0)=EnergyLightningFX01
	RandElectricTex(1)=EnergyLightningFX02
	RandElectricTex(2)=EnergyLightningFX03
	RandElectricTex(3)=EnergyLightningFX04
	
	ElectricSnd(0)=UltimaElectricDisch01
	ElectricSnd(1)=UltimaElectricDisch02
	ElectricSnd(2)=UltimaElectricDisch03
	ElectricSnd(3)=UltimaElectricDisch04
	ElectricSnd(4)=UltimaElectricDisch05
	
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
	
	ElectricSndVol=0.850000
	ElectricSndRadius=1500.000000
}
