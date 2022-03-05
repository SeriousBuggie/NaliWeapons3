//////////////////////////////////////////////////////////////
//				Feralidragon (24-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanOversFXA expands TheOversColoredFX;

#exec TEXTURE IMPORT NAME=VulcanOversSk FILE=Skins\VulcanOversSk.bmp GROUP=Skins

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=VulcanSkyFire
	bUnlit=True
	MultiSkins(1)=VulcanOversSk
	Style=STY_Normal
	
	renderOnTop=False
	DrawScale=0.025000
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
	RRate2=(Yaw=-7000)
}
