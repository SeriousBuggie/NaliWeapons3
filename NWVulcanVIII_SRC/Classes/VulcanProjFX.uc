//////////////////////////////////////////////////////////////
//				Feralidragon (14-10-2010)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanProjFX expands NaliWEffects;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
		DrawScale = LifeSpan * Default.DrawScale / Default.LifeSpan;
		SpriteProjForward = LifeSpan * Default.SpriteProjForward / Default.LifeSpan;
	}
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=VulcanProjCor
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=0.200000
	LifeSpan=0.150000
	ScaleGlow=1.650000
	bNetTemporary=True
	
	SpriteProjForward=16.000000
}
