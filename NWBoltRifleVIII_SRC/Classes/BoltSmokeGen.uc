//////////////////////////////////////////////////////////////
//				Feralidragon (26-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltSmokeGen expands UT_ShortSmokeGen;

simulated function PostBeginPlay()
{
	if (Region.Zone.bWaterZone || Class'NaliZPEffects'.static.isStaticZPDiscarded(Owner))
		Destroy();
	else
		Super.PostBeginPlay();
}

auto state Active
{
    simulated function Timer()
	{
		if (Class'NaliZPEffects'.static.isStaticZPDiscarded(Owner))
		{
			SetTimer(0.0, False);
			return;
		}
		Super.Timer();
	}
}

defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bHidden=False
	DrawType=DT_Sprite
	Style=STY_Translucent
	Texture=TranslucInvis
	DrawScale=0.100000
}