//////////////////////////////////////////////////////////////
//				Feralidragon (06-10-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IceOversFXA expands TheOversColoredFX;

#exec MESH IMPORT MESH=IceOversFXA ANIVFILE=MODELS\IceOversFXA_a.3d DATAFILE=MODELS\IceOversFXA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceOversFXA STRENGTH=0
#exec MESH ORIGIN MESH=IceOversFXA X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IceOversFXA SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IceOversFXA SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IceOversFXA MESH=IceOversFXA
#exec MESHMAP SCALE MESHMAP=IceOversFXA X=0.1 Y=0.1 Z=0.2

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IceOversFXA
	bUnlit=True
	Texture=Ice
	Style=STY_Normal
	bMeshEnviroMap=True
	
	renderOnTop=False
	DrawScale=0.085000
	ScaleGlow=2.000000
	LifeSpan=6.000000

	fadeInTime=0.000000
	fadeOutTime=0.000000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=-5000,Roll=3500,Yaw=10000)
	RRate1=(Pitch=7000)
	RRate2=(Yaw=-16000)
}
