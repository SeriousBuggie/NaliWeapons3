//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SBoltLightEffectCor expands SBoltLightEffect;

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
	DrawScale=0.550000
	ScaleGlow=0.650000
	SpriteProjForward=0.000000
	bHidden=True
}
