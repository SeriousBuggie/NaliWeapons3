//////////////////////////////////////////////////////////////
//				Feralidragon (21-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearSuperRingC expands NaliWEffects;

#exec TEXTURE IMPORT NAME=NuclearRingB FILE=CORONAS\NuclearRingB.bmp GROUP=Coronas

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
		SpriteProjForward = (Default.LifeSpan-LifeSpan) * Default.SpriteProjForward / Default.LifeSpan;
		DrawScale = (Default.LifeSpan-LifeSpan) * Default.DrawScale / Default.LifeSpan;
	}
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=NuclearRingB
	bUnlit=True
	Style=STY_Translucent
	
	LifeSpan=0.500000
	SpriteProjForward=5000.000000
	ScaleGlow=1.000000
	DrawScale=150.000000
}
