//////////////////////////////////////////////////////////////
//				Feralidragon (03-05-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOversFXCorFog expands TheOversColoredFX;

#exec TEXTURE IMPORT NAME=OversFXCorFogR FILE=Coronas\OversFXCorFogR.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=OversFXCorFogG FILE=Coronas\OversFXCorFogG.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=OversFXCorFogB FILE=Coronas\OversFXCorFogB.bmp GROUP=Coronas FLAGS=2



defaultproperties
{
    DrawType=DT_Sprite
    Texture=OversFXCorFogR
    TextureG=OversFXCorFogG
    TextureB=OversFXCorFogB
	
	renderOnTop=True
	
	bUnlit=True
	LifeSpan=4.400000
	DrawScale=0.500000
	ScaleGlow=0.500000
	
	enableScaling=True
	FlickerFactorMax=1.350000
	FlickerFactorMin=0.750000
	ScaleVarianceMax=1.100000
	ScaleVarianceMin=0.900000
	fadeInTime=1.500000
	fadeOutTime=0.500000
	scaleInTime=3.000000
	scaleOutTime=0.500000
}
