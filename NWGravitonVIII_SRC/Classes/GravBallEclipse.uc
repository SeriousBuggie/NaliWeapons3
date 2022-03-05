//////////////////////////////////////////////////////////////
//				Feralidragon (30-08-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravBallEclipse expands NaliTrail;

#exec TEXTURE IMPORT NAME=GravBallEclipse FILE=Coronas\GravBallEclipse.bmp GROUP=Coronas FLAGS=2

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = FRand() + 1.0;
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=GravBallEclipse
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=0.200000
	ScaleGlow=2.000000
	SpriteProjForward=0.000000
}
