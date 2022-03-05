//////////////////////////////////////////////////////////////
//				Feralidragon (09-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearNucleusSphereLevelEb expands NuclearNucleusSphereLevelE;

var() float DestroyTimeOffset;

simulated function Tick( float DeltaTime)
{
local float ScaleMax, RealLifeSpan, RealDefaultLifeSpan;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (LifeSpan > ScaleOutTime)
			DrawScale = (Default.LifeSpan - LifeSpan) * (Default.DrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
		else
		{
			ScaleMax = (Default.LifeSpan - ScaleOutTime) * (Default.DrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
			DrawScale = LifeSpan * ScaleMax / ScaleOutTime;
		}
		
		RealLifeSpan = LifeSpan - DestroyTimeOffset;
		RealDefaultLifeSpan = Default.LifeSpan - DestroyTimeOffset;
		if (RealDefaultLifeSpan - RealLifeSpan <= FadeInTime && FadeInTime > 0)
			ScaleGlow = (RealDefaultLifeSpan - RealLifeSpan) * Default.ScaleGlow / FadeInTime;
		else if (FadeOutTime > 0 && RealLifeSpan <= FadeOutTime)
			ScaleGlow = RealLifeSpan * Default.ScaleGlow / FadeOutTime;
		else if (FadeOutTime == 0)
			ScaleGlow = RealLifeSpan * Default.ScaleGlow / (RealDefaultLifeSpan - FadeInTime);
	}
		
	if (LifeSpan <= DestroyTimeOffset && !bDeleteMe)
		Destroy();
}

defaultproperties
{
	MinDrawScale=0.980000
	FadeInTime=1.000000
	FadeOutTime=1.000000
	ScaleOutTime=0.000000
	LifeSpan=16.000000
	DrawScale=24.500000
	ScaleGlow=2.500000
	
	Style=STY_Translucent
	MultiSkins(1)=HotterHeatFX
	
	DestroyTimeOffset=3.500000
}
