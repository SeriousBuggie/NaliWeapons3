//////////////////////////////////////////////////////////////
//				Feralidragon (22-08-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravBeamCorona expands NaliTrail;

#exec TEXTURE IMPORT NAME=GravBeamCorona FILE=Coronas\GravBeamCorona.bmp GROUP=Coronas FLAGS=2

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		ScaleGlow = FRand() + 1.0;
		DrawScale = FRand()*0.1 + Default.DrawScale;
	}
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=GravBeamCorona
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=0.275000
	ScaleGlow=1.500000
	SpriteProjForward=24.000000
}
