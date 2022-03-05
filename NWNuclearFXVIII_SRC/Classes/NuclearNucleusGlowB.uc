//////////////////////////////////////////////////////////////
//				Feralidragon (04-06-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearNucleusGlowB expands NuclearNucleusGlowE;

#exec TEXTURE IMPORT NAME=NucleusCore02 FILE=CORONAS\NucleusCore02.bmp GROUP=Coronas

defaultproperties
{
	MultiSkins(1)=NucleusCore02
	
	FadeInTime=0.125000
	FadeOutTime=0.800000
	LifeSpan=1.500000
	DrawScale=10.000000
	ScaleGlow=1.000000
}
