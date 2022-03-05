//////////////////////////////////////////////////////////////
//	Nali Weapons III Inventory light FX base class
//				Feralidragon (17-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWInvLightFX expands NaliWEffects;

var ELightType savedLightType;
var bool isEnabled;

simulated function PostBeginPlay()
{
	SetTimer(0.2, True);
}

simulated function Timer()
{
	if (Level.NetMode != NM_DedicatedServer && Owner != None)
	{
		if (Owner.bHidden || Owner.Owner != None || !isEnabled)
			LightType = LT_None;
		else
			LightType = savedLightType;
	}
}

defaultproperties
{
	LifeSpan=0.000000
	bNetTemporary=False
	bHidden=False
	bAlwaysRelevant=True
	NetUpdateFrequency=5.000000
	Style=STY_Translucent
	Texture=TranslucInvis
	DrawScale=0.010000
	
	isEnabled=True
}