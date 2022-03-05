//////////////////////////////////////////////////////////////
//				Feralidragon (21-08-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravVortexEclipse expands NaliWEffects;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = FRand()*1.5 + 0.5;
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=GravBallEclipse
	Style=STY_Translucent
	bUnlit=True
	LifeSpan=0.000000
	
	DrawScale=2.000000
	ScaleGlow=2.000000
	SpriteProjForward=0.000000
}
