//////////////////////////////////////////////////////////////
//				Feralidragon (12-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WREGrenadeLight expands NaliTrail;

#exec TEXTURE IMPORT NAME=WREGrenadeLight FILE=Coronas\WREGrenadeLight.bmp GROUP=Coronas FLAGS=2

var() float LifeTime;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		LifeTime -= Delta;
		ScaleGlow = (Default.LifeTime - LifeTime) * Default.ScaleGlow / Default.LifeTime;
		DrawScale = (Default.LifeTime - LifeTime) * Default.DrawScale / Default.LifeTime;
	}
}

defaultproperties
{
    DrawType=DT_Sprite
	Texture=WREGrenadeLight
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=2.000000
	LifeTime=2.500000
	DrawScale=0.1450000
	SpriteProjForward=0.000000
}
