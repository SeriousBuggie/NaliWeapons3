//////////////////////////////////////////////////////////////
//				Feralidragon (13-08-2013)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTOversFXC expands TheOversColoredFX;

#exec MESH IMPORT MESH=FlameTOversFXC ANIVFILE=MODELS\FlameTOversFXC_a.3d DATAFILE=MODELS\FlameTOversFXC_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FlameTOversFXC STRENGTH=0
#exec MESH ORIGIN MESH=FlameTOversFXC X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=FlameTOversFXC SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTOversFXC SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FlameTOversFXC MESH=FlameTOversFXC
#exec MESHMAP SCALE MESHMAP=FlameTOversFXC X=0.02 Y=0.02 Z=0.04

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=FlameTOversFXC
	bUnlit=True
	bParticles=True
	bRandomFrame=True
	Texture=FExpl08
	MultiSkins(0)=FExpl01
	MultiSkins(1)=FExpl02
	MultiSkins(2)=FExpl03
	MultiSkins(3)=FExpl04
	MultiSkins(4)=FExpl05
	MultiSkins(5)=FExpl06
	MultiSkins(6)=FExpl07
	MultiSkins(7)=FExpl08
	Style=STY_Translucent
	
	renderOnTop=False
	DrawScale=0.040000
	ScaleGlow=2.000000
	LifeSpan=6.000000

	fadeInTime=1.000000
	fadeOutTime=0.000000
	
	enableScaling=True
	scaleInTime=1.200000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=0,Roll=6000)
	RRate1=(Pitch=0)
	RRate2=(Yaw=-20000)
}
