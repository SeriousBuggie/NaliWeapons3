//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class EMPLightExpl expands NaliWEffects;

var() float MaxDrawScale;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (LifeSpan > Default.LifeSpan/2)
			DrawScale = (Default.LifeSpan - LifeSpan)/2 * (MaxDrawScale - Default.DrawScale) / (Default.LifeSpan/2) + Default.DrawScale;
		else
		{
			DrawScale = LifeSpan * MaxDrawScale / (Default.LifeSpan/2);
			ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
		}
	}
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=BoltLight
	Style=STY_Translucent
	bUnlit=True
	
	LifeSpan=0.350000
	MaxDrawScale=3.650000
	
	DrawScale=0.431250
	ScaleGlow=2.000000
	
	SpriteProjForward=40.000000
}
