//////////////////////////////////////////////////////////////
//				Feralidragon (26-05-2013)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTCFXA expands TheOversColoredFX;

#exec MESH IMPORT MESH=RTCFXA ANIVFILE=MODELS\RTCFXA_a.3d DATAFILE=MODELS\RTCFXA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=RTCFXA STRENGTH=0
#exec MESH ORIGIN MESH=RTCFXA X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=RTCFXA SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTCFXA SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=RTCFXA MESH=RTCFXA
#exec MESHMAP SCALE MESHMAP=RTCFXA X=0.1 Y=0.1 Z=0.1
	

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=RTCFXA
	Style=STY_Normal
	Texture=RT_Metal
	
	renderOnTop=False
	DrawScale=0.200000
	ScaleGlow=2.000000
	LifeSpan=6.000000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.250000
	
	enableRot=True
	StartingRot=(Pitch=200,Roll=500)
	RRate1=(Roll=500)
	RRate2=(Yaw=-40000)
}
