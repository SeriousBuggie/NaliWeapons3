//////////////////////////////////////////////////////////////
//				Feralidragon (14-11-2010)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRLightEffectCorR expands IRPRLightEffectR;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (LifeSpan >= (2 * Default.LifeSpan / 3))
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / (Default.LifeSpan/3);
		else
			ScaleGlow = LifeSpan * Default.ScaleGlow / (2 * Default.LifeSpan / 3);
	}
}

defaultproperties
{
	DrawScale=0.850000
	ScaleGlow=0.850000
	LifeSpan=0.250000
	SpriteProjForward=0.000000
	bHidden=True
}
