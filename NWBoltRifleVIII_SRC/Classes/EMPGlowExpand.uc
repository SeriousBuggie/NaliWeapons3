//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class EMPGlowExpand expands NaliWEffects;

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
    Texture=EMPGlow
	Style=STY_Translucent
	bUnlit=True
	
	LifeSpan=0.350000
	MaxDrawScale=1.350000
	
	DrawScale=0.275000
	ScaleGlow=2.000000
	SpriteProjForward=0.000000
}
