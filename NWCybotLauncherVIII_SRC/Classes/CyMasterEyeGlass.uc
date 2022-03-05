//////////////////////////////////////////////////////////////
//				Feralidragon (07-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyMasterEyeGlass expands CybAttach;

#exec MESH IMPORT MESH=CyMasterEyeGlass ANIVFILE=MODELS\CyMasterEyeGlass_a.3d DATAFILE=MODELS\CyMasterEyeGlass_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyMasterEyeGlass STRENGTH=0
#exec MESH ORIGIN MESH=CyMasterEyeGlass X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CyMasterEyeGlass SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyMasterEyeGlass SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CyMasterEyeGlass MESH=CyMasterEyeGlass
#exec MESHMAP SCALE MESHMAP=CyMasterEyeGlass X=0.2 Y=0.2 Z=0.4

#exec TEXTURE IMPORT NAME=CyGlassCryst FILE=SKINS\CyGlassCryst.bmp GROUP=Skins LODSET=2

#exec AUDIO IMPORT NAME="CyMasterEyeAmb" FILE=SOUNDS\CyMasterEyeAmb.wav GROUP="CyMaster"


var() float CorSpawnDelay, CorXOffset;
var NWCoronaFX EyeCor, EyeCorLine;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	SetTimer(Class'CyMaster'.default.ShellOpenDelay, False);
}

simulated function Timer()
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		EyeCor = Spawn(Class'CybMasterEyeCor', Self);
		EyeCorLine = Spawn(Class'CybMasterEyeCorLine', Self);
	}
}

simulated function Tick(float Delta)
{
local vector corPrePivot;

	if (Level.NetMode != NM_DedicatedServer && Owner != None)
	{
		corPrePivot = ((CorXOffset*vect(1,0,0)) >> Owner.Rotation);
		if (EyeCor != None)
			EyeCor.PrePivot = corPrePivot;
		if (EyeCorLine != None)
			EyeCorLine.PrePivot = corPrePivot;
	}
	Super.Tick(Delta);
}

simulated function Destroyed()
{
	if (EyeCor != None)
		EyeCor.Destroy();
	if (EyeCorLine != None)
		EyeCorLine.Destroy();
	
	EyeCor = None;
	EyeCorLine = None;
	
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=CyMasterEyeGlass
	bMeshEnviroMap=True
	Texture=CyGlassCryst
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=1.500000
	bAlwaysRelevant=True
	
	SoundVolume=255
	SoundRadius=255
	SoundPitch=32
	AmbientSound=CyMasterEyeAmb
	
	CorSpawnDelay=2.000000
	CorXOffset=32.000000
}
