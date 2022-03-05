//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVXDischargeRedEnd expands NaliWEffects;

#exec TEXTURE IMPORT NAME=VXCorFXRed FILE=CORONAS\VXCorFXRed.bmp GROUP=Coronas LODSET=2

var() float fadeInTime;
var() float sizeMult;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (Default.LifeSpan - LifeSpan <= fadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / fadeInTime;
		else
			ScaleGlow = LifeSpan * Default.ScaleGlow / (Default.LifeSpan - fadeInTime);
	}
}

simulated function AdjustSize(float size)
{
	DrawScale = size * sizeMult;
	SpriteProjForward = size * sizeMult * 128.0;
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=VXCorFXRed
	SpriteProjForward=32.000000
	
	bUnlit=True
	Scaleglow=2.500000
	Style=STY_Translucent
	DrawScale=1.000000
	
	LifeSpan=0.450000
	fadeInTime=0.100000
	sizeMult=1.000000
	
	Skin=RedCybPallete
	LightBrightness=75
	LightType=LT_TexturePaletteOnce
	LightEffect=LE_NonIncidence
	LightHue=32
	LightSaturation=79
	LightRadius=8
}
