//////////////////////////////////////////////////////////////
//				Feralidragon (02-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearLight expands Light;

var() float FadeOutTime;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (FadeOutTime == 0)
			LightBrightness = Byte(LifeSpan * Default.LightBrightness / Default.LifeSpan);
		else if (LifeSpan <= FadeOutTime)
			LightBrightness = Byte(LifeSpan * Default.LightBrightness / FadeOutTime);
	}
}

defaultproperties
{
	DrawType=DT_Sprite
	Style=STY_Translucent
	bUnlit=True
	Texture=TranslucInvis
	RemoteRole=ROLE_SimulatedProxy
	CollisionHeight=0.000000
	CollisionRadius=0.000000
	Mass=0.000000
	bNetTemporary=True
	LifeSpan=10.000000
	
	bStatic=False
	bHidden=False
	bNoDelete=False
	bMovable=True
	
	LightBrightness=100
	LightHue=0
	LightSaturation=0
	LightRadius=255
	LightEffect=LE_NonIncidence
}
