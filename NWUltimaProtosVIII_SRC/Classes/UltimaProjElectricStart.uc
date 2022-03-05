//////////////////////////////////////////////////////////////
//				Feralidragon (01-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProjElectricStart expands NaliWEffects;

#exec MESH IMPORT MESH=UltimaProjElectricStart ANIVFILE=MODELS\UltimaProjElectricStart_a.3d DATAFILE=MODELS\UltimaProjElectricStart_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaProjElectricStart STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProjElectricStart X=0 Y=0 Z=0 Yaw=128

#exec MESH SEQUENCE MESH=UltimaProjElectricStart SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=UltimaProjElectricStart SEQ=Appear STARTFRAME=0 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=UltimaProjElectricStart SEQ=Roll STARTFRAME=20 NUMFRAMES=21 RATE=20.0

#exec MESHMAP NEW MESHMAP=UltimaProjElectricStart MESH=UltimaProjElectricStart
#exec MESHMAP SCALE MESHMAP=UltimaProjElectricStart X=0.3 Y=0.3 Z=0.6

#exec MESH IMPORT MESH=UltimaProjElectricStartR ANIVFILE=MODELS\UltimaProjElectricStart_a.3d DATAFILE=MODELS\UltimaProjElectricStart_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=UltimaProjElectricStartR STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProjElectricStartR X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UltimaProjElectricStartR SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=UltimaProjElectricStartR SEQ=Appear STARTFRAME=0 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=UltimaProjElectricStartR SEQ=Roll STARTFRAME=20 NUMFRAMES=21 RATE=20.0

#exec MESHMAP NEW MESHMAP=UltimaProjElectricStartR MESH=UltimaProjElectricStartR
#exec MESHMAP SCALE MESHMAP=UltimaProjElectricStartR X=0.3 Y=0.3 Z=0.6


var() float AppearAnimTime, RollAnimTime;
var() float FlickerFactorMax, FlickerFactorMin;
var() texture RandTex[4];

simulated function PostBeginPlay()
{
	PlayAnim('Appear', 1/AppearAnimTime, 0.0);
	MultiSkins[1] = RandTex[Rand(ArrayCount(RandTex))];
}

simulated function setMeshHandedness(bool bLeft)
{
	if (bLeft)
		Mesh = Mesh'UltimaProjElectricStart';
}

simulated function AnimEnd()
{
	if (AnimSequence != 'Roll')
		PlayAnim('Roll', 1/RollAnimTime, 0.0);
}

simulated function Tick(float Delta)
{
local float L, f;

	if (Level.NetMode != NM_DedicatedServer)
	{
		L = Default.LifeSpan - LifeSpan;
		f = FRand()*(FlickerFactorMax-FlickerFactorMin) + FlickerFactorMin;
		if (L <= AppearAnimTime/2)
			ScaleGlow = L * Default.Scaleglow / (AppearAnimTime/2);
		else if (L >= (Default.LifeSpan-0.5))
			ScaleGlow = LifeSpan * Default.Scaleglow / 0.5;
		else
			ScaleGlow = Default.ScaleGlow;
		ScaleGlow *= f;
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=UltimaProjElectricStartR
	
	bUnlit=True
	LifeSpan=2.000000
	DrawScale=1.00000
	ScaleGlow=2.000000
	Style=STY_Translucent
	
	MultiSkins(1)=EnergyLightningFX01
	
	AppearAnimTime=0.400000
	RollAnimTime=1.600000
	FlickerFactorMax=1.500000
	FlickerFactorMin=0.150000
	
	RandTex(0)=EnergyLightningFX01
	RandTex(1)=EnergyLightningFX02
	RandTex(2)=EnergyLightningFX03
	RandTex(3)=EnergyLightningFX04
}
