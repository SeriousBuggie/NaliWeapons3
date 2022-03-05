//////////////////////////////////////////////////////////////
//				Feralidragon (26-06-2010)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SBoltSmokeGen expands UT_ShortSmokeGen;

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
	SizeVariance=0.750000
	BasePuffSize=0.650000
	GenerationType=Class'SBoltBlackSmoke'
	SmokeDelay=0.175000

	bHidden=False
	DrawType=DT_Sprite
	Style=STY_Translucent
	Texture=TranslucInvis
	DrawScale=0.100000
}