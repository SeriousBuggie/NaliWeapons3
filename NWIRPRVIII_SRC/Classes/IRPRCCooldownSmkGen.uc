//////////////////////////////////////////////////////////////
//				Feralidragon (14-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCCooldownSmkGen expands UT_ShortSmokeGen;

auto state Active
{
	simulated function Timer()
	{
		Super.Timer();
		SetTimer(SmokeDelay+FRand()*SmokeDelay, False);
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
    TotalNumPuffs=100000
    RisingVelocity=40.000000
    GenerationType=Class'Botpack.UT_SpriteSmokePuff'
}