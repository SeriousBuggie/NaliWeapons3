//////////////////////////////////////////////////////////////
//				Feralidragon (30-06-2013)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecOversFXCor expands TheOversColoredFX;

#exec TEXTURE IMPORT NAME=TheExecOversFXCorXR FILE=Coronas\TheExecOversFXCorXR.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	DrawType=DT_Sprite
    Texture=TheExecOversFXCorXR
	renderOnTop=True
	bUnlit=True
	
	LifeSpan=6.000000
	DrawScale=0.050000
	ScaleGlow=2.000000
	
	enableScaling=True
	FlickerFactorMax=1.150000
	FlickerFactorMin=0.850000
	ScaleVarianceMax=1.050000
	ScaleVarianceMin=0.950000
	fadeInTime=0.200000
	fadeOutTime=0.200000
	scaleInTime=0.200000
	scaleOutTime=0.200000
	
	enableOffset=True
	OffsetActive=(X=-1.000000,Y=1.000000,Z=2.000000)
	
	enableRot=True
	StartingRot=(Pitch=2700)
	RRate1=(Pitch=-1500)
	RRate2=(Yaw=0)
}
