//////////////////////////////////////////////////////////////
//				Feralidragon (16-11-2010)
//
// NW3 INFRARED PRECISION RIFLE 1.00
//////////////////////////////////////////////////////////////

class IRPRSmokeGen expands UT_ShortSmokeGen;

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
	
	SmokeDelay=0.100000
    SizeVariance=1.250000
    BasePuffSize=0.750000
    TotalNumPuffs=6
    RisingVelocity=40.000000
    GenerationType=Class'Botpack.UT_SpriteSmokePuff'
}