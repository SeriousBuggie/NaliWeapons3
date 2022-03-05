//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearShockSpiky expands NuclearShockRing;

#exec TEXTURE IMPORT NAME=NuclearSpikyShock FILE=CORONAS\NuclearSpikyShock.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MultiSkins(1)=NuclearSpikyShock
	MinDrawScale=1.000000
	FadeInTime=1.000000
	FadeOutTime=5.000000
	LifeSpan=10.000000
	DrawScale=70.000000
	ScaleGlow=2.250000
}
