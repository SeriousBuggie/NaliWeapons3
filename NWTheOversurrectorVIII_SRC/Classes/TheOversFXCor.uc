//////////////////////////////////////////////////////////////
//				Feralidragon (03-05-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOversFXCor expands TheOversColoredFX;

#exec TEXTURE IMPORT NAME=OversFXCorR FILE=Coronas\OversFXCorR.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=OversFXCorG FILE=Coronas\OversFXCorG.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=OversFXCorB FILE=Coronas\OversFXCorB.bmp GROUP=Coronas FLAGS=2


var() float ScaleMaximumAdd;

simulated function Tick(float Delta)
{
	if (!isSlave && Level.NetMode != NM_DedicatedServer)
	{
		if (enableScaling && LifeSpan <= fadeOutTime)
			DrawScaleStart = LifeSpan * (default.DrawScaleStart - ScaleMaximumAdd) / fadeOutTime + ScaleMaximumAdd;
	}
	
	Super.Tick(Delta);
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=OversFXCorR
    TextureG=OversFXCorG
    TextureB=OversFXCorB
	
	renderOnTop=True
	
	bUnlit=True
	LifeSpan=4.400000
	DrawScale=0.200000
	ScaleGlow=2.000000
	
	enableScaling=True
	FlickerFactorMax=1.350000
	FlickerFactorMin=0.750000
	ScaleVarianceMax=1.100000
	ScaleVarianceMin=0.900000
	fadeInTime=2.000000
	fadeOutTime=0.500000
	scaleInTime=5.600000
	scaleOutTime=0.500000
	
	ScaleMaximumAdd=16.000000
}
