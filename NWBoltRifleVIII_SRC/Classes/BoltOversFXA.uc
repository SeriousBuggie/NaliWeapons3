//////////////////////////////////////////////////////////////
//				Feralidragon (17-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltOversFXA expands TheOversColoredFX;

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=BoltCrystal
	bUnlit=True
	Texture=GlassCryst
	bMeshEnviroMap=True
	Style=STY_Normal
	
	renderOnTop=False
	DrawScale=0.020000
	ScaleGlow=2.000000
	LifeSpan=6.000000

	fadeInTime=0.000000
	fadeOutTime=0.000000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=0)
	RRate1=(Pitch=0)
	RRate2=(Yaw=-20000)
}
