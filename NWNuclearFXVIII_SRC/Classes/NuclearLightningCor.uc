//////////////////////////////////////////////////////////////
//				Feralidragon (21-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearLightningCor expands NaliWEffects;

#exec TEXTURE IMPORT NAME=NuclearLightningCor FILE=CORONAS\NuclearLightningCor.bmp GROUP=Coronas FLAGS=2

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
    Texture=NuclearLightningCor
	SpriteProjForward=32.000000
	
	bUnlit=True
	Scaleglow=2.500000
	Style=STY_Translucent
	DrawScale=1.000000
	
	LifeSpan=0.600000
	fadeInTime=0.100000
	sizeMult=2.000000
}
