//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class XShockCor expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=XShockCor FILE=CORONAS\XShockCor.bmp GROUP=Coronas FLAGS=2

defaultproperties
{
	MaxDistance=200000.000000
	FadeInTime=0.100000
	FadeOutTime=0.500000
	CoronaSprite=XShockCor
	MaxCoronaSize=15.000000
	MinCoronaSize=7.500000
	CGlow=1.500000
	LifeSpan=0.800000
	
	EndScaleCoef=3.000000
	EndScaleTime=0.800000
	
	LightType=LT_TexturePaletteOnce
	LightEffect=LE_NonIncidence
	LightBrightness=85
	LightHue=27
	LightSaturation=71
	LightRadius=24
	Skin=Texture'UnrealShare.Effects.ExplosionPal'
}
