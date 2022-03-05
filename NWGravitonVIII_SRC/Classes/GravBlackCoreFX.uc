//////////////////////////////////////////////////////////////
//				Feralidragon (02-09-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravBlackCoreFX expands NaliWEffects;

var() float MaxDrawScale;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (LifeSpan > Default.LifeSpan/3)
			DrawScale = (Default.LifeSpan - LifeSpan) * (MaxDrawScale - Default.DrawScale) / (2*Default.LifeSpan/3) + Default.DrawScale;
		else
			DrawScale = LifeSpan * MaxDrawScale / (Default.LifeSpan/3);
	}
}

defaultproperties
{
    DrawType=DT_Mesh
	Mesh=GravBall
	bUnlit=True
	
	LifeSpan=0.600000
	MaxDrawScale=3.000000
	
	DrawScale=1.000000
	ScaleGlow=2.000000
	SpriteProjForward=0.000000
}
