//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearShockRingSky expands NuclearShockRing;

#exec TEXTURE IMPORT NAME=NuclearShockRingSky FILE=CORONAS\NuclearShockRingSky.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MultiSkins(1)=NuclearShockRingSky
	MinDrawScale=0.500000
	FadeInTime=0.500000
	FadeOutTime=4.500000
	LifeSpan=15.000000
	DrawScale=120.000000
	ScaleGlow=1.000000
	TexUVMultiplier=1.049180
	
	RadiusView=28800.000000
	bAffectByDrawScale=False
}
