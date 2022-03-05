//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2013)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SEMPGlowExpand expands NaliWEffects;

var() float MaxDrawScale;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * (MaxDrawScale - Default.DrawScale) / Default.LifeSpan + Default.DrawScale;
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
	}
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=SEMPGlow
	Style=STY_Translucent
	bUnlit=True
	
	LifeSpan=0.350000
	MaxDrawScale=1.350000
	
	DrawScale=0.275000
	ScaleGlow=2.000000
	SpriteProjForward=0.000000
}
