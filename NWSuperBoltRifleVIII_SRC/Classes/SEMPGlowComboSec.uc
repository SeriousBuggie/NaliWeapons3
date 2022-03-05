//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2013)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SEMPGlowComboSec expands SEMPGlowExpand;

#exec TEXTURE IMPORT NAME=SComboGlow FILE=Coronas\SComboGlow.bmp GROUP=Coronas FLAGS=2

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
	Texture=SComboGlow
}
