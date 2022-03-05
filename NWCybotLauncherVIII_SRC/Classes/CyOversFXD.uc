//////////////////////////////////////////////////////////////
//				Feralidragon (23-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyOversFXD expands TheOversColoredFX;

#exec MESH IMPORT MESH=CyOversFXD ANIVFILE=MODELS\CyOversFXD_a.3d DATAFILE=MODELS\CyOversFXD_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyOversFXD STRENGTH=0
#exec MESH ORIGIN MESH=CyOversFXD X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CyOversFXD SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyOversFXD SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CyOversFXD MESH=CyOversFXD
#exec MESHMAP SCALE MESHMAP=CyOversFXD X=0.1 Y=0.1 Z=0.2


var CyOversFXDCor vGlow;
var vector startActiveOffset;
var float rotChangeTCount;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		vGlow = Spawn(Class'CyOversFXDCor');
		startActiveOffset = (FRand()*0.25 + 0.75) * VSize(OffsetActive) * VRand();
		setRndRotativeBehavior();
	}
	Super.PostBeginPlay();
}

simulated function setRndRotativeBehavior()
{
	RRate2.Yaw = int(default.RRate2.Yaw * (FRand()*2-1));
	RRate2.Roll = int(default.RRate2.Roll * (FRand()*2-1));
	RRate1.Pitch = int(default.RRate1.Pitch * (FRand()*2-1));
	rotChangeTCount = FRand()*2.f;
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		rotChangeTCount -= Delta;
		if (rotChangeTCount <= 0.0)
			setRndRotativeBehavior();
		OffsetActive = (startActiveOffset >> curRot2);
	}
	Super.Tick(Delta);
}

simulated function UpdateCoords(vector newLoc, rotator newRot)
{
	Super.UpdateCoords(newLoc, newRot);
	if (vGlow != None)
		vGlow.UpdateCoords(newLoc, newRot);
}

simulated function renderOnCanvas(canvas Canvas)
{
	Super.renderOnCanvas(Canvas);
	if (vGlow != None)
		vGlow.renderOnCanvas(Canvas);
}

simulated function Destroyed()
{
	if (vGlow != None)
		vGlow.Destroy();
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=CyOversFXD
	bUnlit=True
	Texture=CybotMetal
	Style=STY_Normal
	bMeshEnviroMap=True
	
	renderOnTop=False
	DrawScale=0.060000
	ScaleGlow=2.000000
	LifeSpan=6.000000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=0)
	RRate1=(Pitch=60000)
	RRate2=(Yaw=60000,Roll=10000)
	
	enableOffset=True
	OffsetActive=(Y=4.000000)
}
