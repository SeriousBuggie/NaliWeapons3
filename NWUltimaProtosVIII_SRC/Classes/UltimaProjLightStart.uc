//////////////////////////////////////////////////////////////
//				Feralidragon (01-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProjLightStart expands NaliWEffects;

#exec TEXTURE IMPORT NAME=UltimaProjLightStart FILE=Coronas\UltimaProjLightStart.bmp GROUP=Coronas FLAGS=2

var() float FlickerFactorMax, FlickerFactorMin;
var() float ScaleVarianceMax, ScaleVarianceMin;
var() float fadeInTime, fadeOutTime;
var() float scaleInTime, scaleOutTime;
var bool isSlave;

var() bool enableScaling;

simulated function Tick(float Delta)
{
local float L, f;

	if (!isSlave && Level.NetMode != NM_DedicatedServer)
	{
		L = Default.LifeSpan - LifeSpan;
		
		f = FRand()*(FlickerFactorMax-FlickerFactorMin) + FlickerFactorMin;
		if (L <= fadeInTime)
			ScaleGlow = L * Default.Scaleglow / fadeInTime;
		else if (Lifespan <= fadeOutTime)
			ScaleGlow = LifeSpan * Default.Scaleglow / fadeOutTime;
		else
			ScaleGlow = Default.ScaleGlow;
		ScaleGlow *= f;
		
		if (enableScaling)
		{
			f = FRand()*(ScaleVarianceMax-ScaleVarianceMin) + ScaleVarianceMin;
			if (L <= scaleInTime)
				DrawScale = L * Default.DrawScale / scaleInTime;
			else if (LifeSpan <= scaleOutTime)
				DrawScale = LifeSpan * Default.DrawScale / scaleOutTime;
			else
				DrawScale = Default.DrawScale;
			DrawScale *= f;
		}
	}
}

simulated function SetRenderSlave(optional bool bSlave)
{
	isSlave = bSlave;
	bHidden = True;
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=UltimaProjLightStart
	
	bUnlit=True
	LifeSpan=4.000000
	DrawScale=0.100000
	ScaleGlow=2.500000
	Style=STY_Translucent
	
	enableScaling=True
	FlickerFactorMax=1.350000
	FlickerFactorMin=0.750000
	ScaleVarianceMax=1.100000
	ScaleVarianceMin=0.900000
	fadeInTime=0.200000
	fadeOutTime=0.500000
	scaleInTime=2.000000
	scaleOutTime=0.000000
}
