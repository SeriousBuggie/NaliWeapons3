//////////////////////////////////////////////////////////////
//				Feralidragon (25-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybFFieldPawnHitFX expands CybFFieldHitFX;

simulated function Tick(float DeltaTime)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
		DrawScale = LifeSpan * maxDrawScale / Default.LifeSpan;
	}
}

defaultproperties
{
	Physics=PHYS_None
}
