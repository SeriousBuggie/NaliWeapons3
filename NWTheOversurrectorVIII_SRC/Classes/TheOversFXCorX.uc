//////////////////////////////////////////////////////////////
//				Feralidragon (03-05-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOversFXCorX expands TheOversColoredFX;

#exec TEXTURE IMPORT NAME=OversFXCorXR FILE=Coronas\OversFXCorXR.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=OversFXCorXG FILE=Coronas\OversFXCorXG.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=OversFXCorXB FILE=Coronas\OversFXCorXB.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
    DrawType=DT_Sprite
    Texture=OversFXCorXR
    TextureG=OversFXCorXG
    TextureB=OversFXCorXB
	
	renderOnTop=True
	
	bUnlit=True
	LifeSpan=1.650000
	DrawScale=0.500000
	ScaleGlow=2.000000
	
	enableScaling=True
	FlickerFactorMax=1.150000
	FlickerFactorMin=0.850000
	ScaleVarianceMax=1.100000
	ScaleVarianceMin=0.900000
	fadeInTime=0.100000
	fadeOutTime=0.250000
	scaleInTime=0.100000
	scaleOutTime=1.750000
}
