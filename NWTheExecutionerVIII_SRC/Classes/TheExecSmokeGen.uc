//////////////////////////////////////////////////////////////
//	Nali Weapons III The Executioner weapon
//				Feralidragon (25-02-2012)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecSmokeGen expands UT_ShortSmokeGen;

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

	bHidden=False
	DrawType=DT_Sprite
	Style=STY_Translucent
	Texture=TranslucInvis
	DrawScale=0.100000
	
	SmokeDelay=0.120000
	SizeVariance=2.000000
	BasePuffSize=5.500000
	TotalNumPuffs=10
	RisingVelocity=40.000000
	GenerationType=Class'Botpack.UT_SpriteSmokePuff'
}