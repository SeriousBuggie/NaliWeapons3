//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2013)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SEMPLightTrail expands NaliTrail;

#exec TEXTURE IMPORT NAME=SBoltLight FILE=Coronas\SBoltLight.bmp GROUP=Coronas FLAGS=2

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = 0.85 + FRand()*1.25;
	Super.Tick(Delta);
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=SBoltLight
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=0.431250
	ScaleGlow=1.500000
	
	SpriteProjForward=0.000000
}
