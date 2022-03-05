//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class EMPLightTrail expands NaliTrail;

#exec TEXTURE IMPORT NAME=BoltLight FILE=Coronas\BoltLight.bmp GROUP=Coronas FLAGS=2

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = 0.85 + FRand()*1.25;
	Super.Tick(Delta);
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=BoltLight
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=0.431250
	ScaleGlow=1.500000
	
	SpriteProjForward=0.000000
}
