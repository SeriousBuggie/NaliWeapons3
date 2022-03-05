//////////////////////////////////////////////////////////////
//				Feralidragon (17-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltOversFXC expands TheOversColoredFX;

#exec MESH IMPORT MESH=BoltOversFXC ANIVFILE=MODELS\BoltStormRotParticles_a.3d DATAFILE=MODELS\BoltStormRotParticles_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltOversFXC STRENGTH=0.0
#exec MESH ORIGIN MESH=BoltOversFXC X=0 Y=0 Z=0 ROLL=128

#exec MESH SEQUENCE MESH=BoltOversFXC SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=BoltOversFXC SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltOversFXC SEQ=RotateOnce STARTFRAME=0 NUMFRAMES=21 RATE=10.0
#exec MESH SEQUENCE MESH=BoltOversFXC SEQ=RotateLoop STARTFRAME=0 NUMFRAMES=20 RATE=9.5

#exec MESHMAP NEW MESHMAP=BoltOversFXC MESH=BoltOversFXC
#exec MESHMAP SCALE MESHMAP=BoltOversFXC X=0.0045 Y=0.0045 Z=0.009


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=BoltOversFXC
	bUnlit=True
	Texture=BoltStormRorCor01
	Style=STY_Translucent
	bParticles=True
	bRandomFrame=True
	
	MultiSkins(0)=BoltStormRorCor01
	MultiSkins(1)=BoltStormRorCor02
	MultiSkins(2)=BoltStormRorCor03
	MultiSkins(3)=BoltStormRorCor04
	MultiSkins(4)=BoltStormRorCor01
	MultiSkins(5)=BoltStormRorCor02
	MultiSkins(6)=BoltStormRorCor03
	MultiSkins(7)=BoltStormRorCor04
	
	renderOnTop=False
	DrawScale=0.003500
	ScaleGlow=2.000000
	LifeSpan=6.000000

	fadeInTime=0.200000
	fadeOutTime=0.100000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=0,Roll=-3500)
	RRate1=(Pitch=0)
	RRate2=(Yaw=-15000)
}
