//////////////////////////////////////////////////////////////
//				Feralidragon (24-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanOversFXC expands TheOversColoredFX;

defaultproperties
{
	DrawType=DT_Sprite
	Mesh=LodMesh'Botpack.chunkM'
	bUnlit=True
	Texture=VulcanProjCor
	Style=STY_Translucent
	
	renderOnTop=True
	DrawScale=0.015000
	ScaleGlow=0.700000
	LifeSpan=6.000000
	
	FlickerFactorMax=1.250000
	FlickerFactorMin=0.850000
	ScaleVarianceMax=1.100000
	ScaleVarianceMin=0.900000

	fadeInTime=0.100000
	fadeOutTime=5.000000
}
