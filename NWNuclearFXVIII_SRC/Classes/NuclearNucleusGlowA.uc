//////////////////////////////////////////////////////////////
//				Feralidragon (04-06-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearNucleusGlowA expands NuclearNucleusGlowE;

#exec TEXTURE IMPORT NAME=NucleusCore01 FILE=CORONAS\NucleusCore01.bmp GROUP=Coronas

defaultproperties
{
	MultiSkins(1)=NucleusCore01
	
	MinDrawScale=0.125000
	FadeInTime=0.125000
	FadeOutTime=1.250000
	LifeSpan=1.000000
	DrawScale=6.000000
	ScaleGlow=1.750000
}
