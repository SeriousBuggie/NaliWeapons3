//////////////////////////////////////////////////////////////
//				Feralidragon (03-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FrozenBodySmkBlast expands FrozenBodySmoke;

var float MaxDrawScale, MinDrawScale;

simulated function SetColDrawScaleAndSpeed(float colR, float colH)
{
	MinDrawScale = colR / 8;
	MaxDrawScale = colR / 6;
	DrawScale = MinDrawScale;
	Velocity = colR * VRand() * 2;
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && FMax(MinDrawScale, MaxDrawScale) > 0.0)
		DrawScale = (Default.LifeSpan - LifeSpan) * (MaxDrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
}


defaultproperties
{
	ScaleGlow=1.000000
}
