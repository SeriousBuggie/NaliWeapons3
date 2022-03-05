//////////////////////////////////////////////////////////////
//				Feralidragon (02-03-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVortexInFXRed expands NaliWEffects;

#exec TEXTURE IMPORT NAME=CybVXTraceInRed FILE=Coronas\CybVXTraceInRed.bmp GROUP=Coronas FLAGS=2

//Small mesh
//----------------------------------------------------------
#exec MESH IMPORT MESH=CybVortexInFXRed ANIVFILE=MODELS\CybVortexInFXRed_a.3d DATAFILE=MODELS\CybVortexInFXRed_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybVortexInFXRed STRENGTH=0.25
#exec MESH ORIGIN MESH=CybVortexInFXRed X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=CybVortexInFXRed SEQ=All STARTFRAME=0 NUMFRAMES=31
#exec MESH SEQUENCE MESH=CybVortexInFXRed SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybVortexInFXRed SEQ=RotateIn STARTFRAME=0 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=CybVortexInFXRed SEQ=SinkIn STARTFRAME=20 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=CybVortexInFXRed MESH=CybVortexInFXRed
#exec MESHMAP SCALE MESHMAP=CybVortexInFXRed X=0.5 Y=0.5 Z=1.0

#exec MESHMAP SETTEXTURE MESHMAP=CybVortexInFXRed NUM=1 TEXTURE=CybVXTraceInRed
//----------------------------------------------------------

//Medium mesh
//----------------------------------------------------------
#exec MESH IMPORT MESH=CybVortexInFXBRed ANIVFILE=MODELS\CybVortexInFXBRed_a.3d DATAFILE=MODELS\CybVortexInFXBRed_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybVortexInFXBRed STRENGTH=0.25
#exec MESH ORIGIN MESH=CybVortexInFXBRed X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=CybVortexInFXBRed SEQ=All STARTFRAME=0 NUMFRAMES=31
#exec MESH SEQUENCE MESH=CybVortexInFXBRed SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybVortexInFXBRed SEQ=RotateIn STARTFRAME=0 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=CybVortexInFXBRed SEQ=SinkIn STARTFRAME=20 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=CybVortexInFXBRed MESH=CybVortexInFXBRed
#exec MESHMAP SCALE MESHMAP=CybVortexInFXBRed X=0.5 Y=0.5 Z=1.0

#exec MESHMAP SETTEXTURE MESHMAP=CybVortexInFXBRed NUM=1 TEXTURE=CybVXTraceInRed
//----------------------------------------------------------

//Big mesh
//----------------------------------------------------------
#exec MESH IMPORT MESH=CybVortexInFXCRed ANIVFILE=MODELS\CybVortexInFXCRed_a.3d DATAFILE=MODELS\CybVortexInFXCRed_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybVortexInFXCRed STRENGTH=0.25
#exec MESH ORIGIN MESH=CybVortexInFXCRed X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=CybVortexInFXCRed SEQ=All STARTFRAME=0 NUMFRAMES=31
#exec MESH SEQUENCE MESH=CybVortexInFXCRed SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybVortexInFXCRed SEQ=RotateIn STARTFRAME=0 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=CybVortexInFXCRed SEQ=SinkIn STARTFRAME=20 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=CybVortexInFXCRed MESH=CybVortexInFXCRed
#exec MESHMAP SCALE MESHMAP=CybVortexInFXCRed X=0.5 Y=0.5 Z=1.0

#exec MESHMAP SETTEXTURE MESHMAP=CybVortexInFXCRed NUM=1 TEXTURE=CybVXTraceInRed
//----------------------------------------------------------

var() Mesh RndFXMesh[3];
var() float FXDrawScale[4];

simulated function PostBeginPlay()
{
local float maxDS, minDS, newDS;
local byte i;

	maxDS = FXDrawScale[ArrayCount(FXDrawScale)-1];
	minDS = FXDrawScale[0];
	newDS = FRand()*(maxDS - minDS) + minDS;
	DrawScale = newDS;
	
	for (i = 0; i < ArrayCount(FXDrawScale)-1; i++)
	{
		if (newDS >= FXDrawScale[i])
			Mesh = RndFXMesh[i];
	}
	
	PlayAnim('RotateIn', 1/(Default.LifeSpan/3*2), 0.1);
}

simulated function AnimEnd()
{
	PlayAnim('SinkIn', 1/(Default.LifeSpan/3), 0.1);
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = (Default.Lifespan - LifeSpan) * Default.ScaleGlow / Default.Lifespan;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybVortexInFXRed
	bUnlit=True
	Scaleglow=1.500000
	Style=STY_Translucent
	DrawScale=1.000000
	
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=True
	Physics=PHYS_None
	LifeSpan=0.750000
	Mass=0.000000
	
	RndFXMesh(0)=CybVortexInFXRed
	RndFXMesh(1)=CybVortexInFXBRed
	RndFXMesh(2)=CybVortexInFXCRed
	
	FXDrawScale(0)=1.000000
	FXDrawScale(1)=2.000000
	FXDrawScale(2)=4.000000
	FXDrawScale(3)=8.000000
}
