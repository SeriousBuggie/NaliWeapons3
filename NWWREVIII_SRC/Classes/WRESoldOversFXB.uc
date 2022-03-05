//////////////////////////////////////////////////////////////
//				Feralidragon (09-08-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESoldOversFXB expands TheOversColoredFX;

#exec MESH IMPORT MESH=WRESoldOversFXB ANIVFILE=MODELS\WRESoldOversFXB_a.3d DATAFILE=MODELS\WRESoldOversFXB_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WRESoldOversFXB STRENGTH=0
#exec MESH ORIGIN MESH=WRESoldOversFXB X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=WRESoldOversFXB SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WRESoldOversFXB SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=WRESoldOversFXB MESH=WRESoldOversFXB
#exec MESHMAP SCALE MESHMAP=WRESoldOversFXB X=0.1 Y=0.1 Z=0.2

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=WRESoldOversFXB
	Texture=WREnforcer_SkGlass
	bMeshEnviromap=True
	bUnlit=True
	Style=STY_Translucent
	
	renderOnTop=False
	DrawScale=0.150000
	ScaleGlow=0.750000
	LifeSpan=6.000000

	fadeInTime=0.000000
	fadeOutTime=0.000000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=0)
	RRate1=(Pitch=0)
	RRate2=(Yaw=10925)
}
