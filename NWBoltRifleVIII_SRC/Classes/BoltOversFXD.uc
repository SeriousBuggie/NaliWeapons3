//////////////////////////////////////////////////////////////
//				Feralidragon (17-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltOversFXD expands TheOversColoredFX;

#exec MESH IMPORT MESH=BoltOversFXD ANIVFILE=MODELS\BoltCrystalGlow_a.3d DATAFILE=MODELS\BoltCrystalGlow_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltOversFXD STRENGTH=0
#exec MESH ORIGIN MESH=BoltOversFXD X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltOversFXD SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltOversFXD SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=BoltOversFXD MESH=BoltOversFXD
#exec MESHMAP SCALE MESHMAP=BoltOversFXD X=0.008 Y=0.008 Z=0.016


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=BoltOversFXD
	bUnlit=True
	Texture=BoltCrystalGlow
	Style=STY_Translucent
	bParticles=True
	
	renderOnTop=True
	DrawScale=0.100000
	ScaleGlow=0.600000
	LifeSpan=6.000000

	fadeInTime=0.200000
	fadeOutTime=0.100000
	
	enableScaling=True
	scaleInTime=0.000000
	scaleOutTime=0.000000
	
	enableRot=True
	StartingRot=(Pitch=0)
	RRate1=(Pitch=0)
	RRate2=(Yaw=-20000)
}
