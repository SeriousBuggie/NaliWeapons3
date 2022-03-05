//////////////////////////////////////////////////////////////
//				Feralidragon (23-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyOversFXA expands TheOversColoredFX;

#exec MESH IMPORT MESH=CyOversFXA ANIVFILE=MODELS\CyOversFXA_a.3d DATAFILE=MODELS\CyOversFXA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyOversFXA STRENGTH=0
#exec MESH ORIGIN MESH=CyOversFXA X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CyOversFXA SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyOversFXA SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CyOversFXA MESH=CyOversFXA
#exec MESHMAP SCALE MESHMAP=CyOversFXA X=0.1 Y=0.1 Z=0.2

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=CyOversFXA
	bUnlit=True
	Texture=CyGlassCryst
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
	StartingRot=(Pitch=0,Roll=0,Yaw=0)
	RRate1=(Pitch=0)
	RRate2=(Yaw=-20000)
}
