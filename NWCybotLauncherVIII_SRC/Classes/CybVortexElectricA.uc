//////////////////////////////////////////////////////////////
//				Feralidragon (27-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVortexElectricA expands NaliWEffects;

#exec MESH IMPORT MESH=CybVortexElectricA ANIVFILE=MODELS\CybVortexElectricA_a.3d DATAFILE=MODELS\CybVortexElectricA_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybVortexElectricA STRENGTH=0.25
#exec MESH ORIGIN MESH=CybVortexElectricA X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybVortexElectricA SEQ=All STARTFRAME=0 NUMFRAMES=42
#exec MESH SEQUENCE MESH=CybVortexElectricA SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybVortexElectricA SEQ=Transform STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=CybVortexElectricA SEQ=UnTransform STARTFRAME=10 NUMFRAMES=11 RATE=10.0

//Rotating
#exec MESH SEQUENCE MESH=CybVortexElectricA SEQ=RotateOnce STARTFRAME=21 NUMFRAMES=21 RATE=21.0
#exec MESH SEQUENCE MESH=CybVortexElectricA SEQ=RotateLoop STARTFRAME=21 NUMFRAMES=20 RATE=21.0

//------------------------- Animations End ---------------------------------
//**************************************************************************

#exec MESHMAP NEW MESHMAP=CybVortexElectricA MESH=CybVortexElectricA
#exec MESHMAP SCALE MESHMAP=CybVortexElectricA X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=VortexElectricFXRed FILE=CORONAS\VortexElectricFXRed.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VortexElectricFXBlue FILE=CORONAS\VortexElectricFXBlue.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VortexElectricFXGreen FILE=CORONAS\VortexElectricFXGreen.bmp GROUP=ElecFX LODSET=2
#exec TEXTURE IMPORT NAME=VortexElectricFXYellow FILE=CORONAS\VortexElectricFXYellow.bmp GROUP=ElecFX LODSET=2


var() texture ElecTexFX[4];
var() float MaxTimeOff, MaxTimeOn, MinTimeOff, MinTimeOn;


simulated function PostBeginPlay()
{
	setAppearance();
}

simulated function SetTeam( byte team)
{
	if (team > 3)	team = 0;
	MultiSkins[1] = ElecTexFX[team];
}

simulated function Timer()
{
	setAppearance();
}

simulated function setAppearance()
{
	if (bHidden)
		SetTimer(FRand()*(MaxTimeOn - MinTimeOn) + MinTimeOn, False);
	else
		SetTimer(FRand()*(MaxTimeOff - MinTimeOff) + MinTimeOn, False);
	
	bHidden  = !bHidden;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybVortexElectricA
	bUnlit=True
	Scaleglow=1.000000
	Style=STY_Translucent
	DrawScale=1.000000
	
	MultiSkins(1)=VortexElectricFXRed
	
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Physics=PHYS_None
	bAnimByOwner=True
	LifeSpan=0.000000
	Mass=0.000000
	
	ElecTexFX(0)=VortexElectricFXRed
	ElecTexFX(1)=VortexElectricFXBlue
	ElecTexFX(2)=VortexElectricFXGreen
	ElecTexFX(3)=VortexElectricFXYellow
	
	MaxTimeOff=1.500000
	MinTimeOff=0.500000
	MaxTimeOn=0.350000
	MinTimeOn=0.100000
}
