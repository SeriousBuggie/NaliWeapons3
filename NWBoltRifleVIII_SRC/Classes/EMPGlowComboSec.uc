//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class EMPGlowComboSec expands EMPGlowExpand;

#exec TEXTURE IMPORT NAME=ComboGlow FILE=Coronas\ComboGlow.bmp GROUP=Coronas FLAGS=2

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * Default.DrawScale / Default.LifeSpan;
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
	}
}

defaultproperties
{
	LifeSpan=0.750000
	DrawScale=1.550000
	ScaleGlow=3.000000
	Texture=ComboGlow
}
