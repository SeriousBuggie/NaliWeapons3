//////////////////////////////////////////////////////////////
//				Feralidragon (14-11-2010)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRLightEffectR expands NaliZPEffects;

#exec TEXTURE IMPORT NAME=IRPRTraceCorRed FILE=Coronas\IRPRTraceCorRed.bmp GROUP=Coronas FLAGS=2

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (LifeSpan >= (2 * Default.LifeSpan / 3))
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / (Default.LifeSpan/3);
		else
			ScaleGlow = LifeSpan * Default.ScaleGlow / (2 * Default.LifeSpan / 3);
		
		DrawScale = LifeSpan * Default.DrawScale / Default.LifeSpan;
		SpriteProjForward = LifeSpan * Default.SpriteProjForward / Default.LifeSpan;
	}
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=IRPRTraceCorRed
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=0.300000
	LifeSpan=0.400000
	ScaleGlow=5.500000
	bNetTemporary=True
	
	SpriteProjForward=4.000000
}
