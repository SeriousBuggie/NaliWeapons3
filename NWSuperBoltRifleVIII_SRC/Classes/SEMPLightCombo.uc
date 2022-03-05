//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2013)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SEMPLightCombo expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=SBoltFrontLightLong FILE=CORONAS\SBoltFrontLightLong.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=20000.000000
	FadeInTime=0.050000
	FadeOutTime=0.650000
	CoronaSprite=SBoltFrontLightLong
	MaxCoronaSize=14.500000
	MinCoronaSize=10.000000
	CGlow=2.000000
	EndScaleTime=0.750000
	EndScaleCoef=1.000000
	LifeSpan=0.750000
}
