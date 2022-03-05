//////////////////////////////////////////////////////////////
//				Feralidragon (03-05-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOversFXCorLine expands TheOversColoredFX;

#exec TEXTURE IMPORT NAME=OversFXCorLineR FILE=Coronas\OversFXCorLineR.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=OversFXCorLineG FILE=Coronas\OversFXCorLineG.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=OversFXCorLineB FILE=Coronas\OversFXCorLineB.bmp GROUP=Coronas FLAGS=2



defaultproperties
{
    DrawType=DT_Sprite
    Texture=OversFXCorLineR
    TextureG=OversFXCorLineG
    TextureB=OversFXCorLineB
	
	renderOnTop=True
	
	bUnlit=True
	LifeSpan=5.200000
	DrawScale=0.750000
	ScaleGlow=1.500000
	
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
