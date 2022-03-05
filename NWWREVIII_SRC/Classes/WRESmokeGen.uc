//////////////////////////////////////////////////////////////
//				Feralidragon (12-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESmokeGen expands UT_ShortSmokeGen;

simulated function PostBeginPlay()
{
	if (Region.Zone.bWaterZone)
		Destroy();
	else
		Super.PostBeginPlay();
}

defaultproperties
{
    RemoteRole=ROLE_SimulatedProxy
	SmokeDelay=0.120000
    SizeVariance=2.500000
    BasePuffSize=3.750000
    TotalNumPuffs=8
    RisingVelocity=40.000000
    GenerationType=Class'Botpack.UT_SpriteSmokePuff'
	
	bHidden=False
	DrawType=DT_Sprite
	Style=STY_Translucent
	Texture=TranslucInvis
	DrawScale=0.100000
}