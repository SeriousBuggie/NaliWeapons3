//////////////////////////////////////////////////////////////
//				Feralidragon (10-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WREMuzzleFade expands WREMuzzle;

#exec TEXTURE IMPORT NAME=WREMuzzFade FILE=Effects\WREMuzzFade.bmp GROUP=Effects FLAGS=2

simulated function Tick(float DeltaTime)
{
	ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
}

defaultproperties
{
	ScaleGlow=2.000000
	LifeSpan=0.100000
	MultiSkins(1)=WREMuzzFade
}
