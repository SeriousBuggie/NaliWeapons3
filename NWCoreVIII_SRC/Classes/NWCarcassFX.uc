//////////////////////////////////////////////////////////////
//	Nali Weapons III Carcass FX base class
//				Feralidragon (21-03-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWCarcassFX expands UT_HeavyWallHitEffect
abstract;

var() float CarcassRadiusCheck;
var() name ValidCarcassTypes[8];
var() bool bSplashEffected;

enum EFXSplashType
{
    SPLX_Precise,
    SPLX_Moderate,
	SPLX_Splash,
};
var() EFXSplashType SplashType;

//Server side / Standalone
simulated function PostBeginPlay()
{
local Carcass c;
local byte i;
local int fxt;

	Super.PostBeginPlay();

	if (Role == ROLE_Authority)
	{
		fxt = Class'NWInfo'.static.getCarcassFXSettings();
		if (fxt == 0 || (fxt - 1) < SplashType)
		{
			Destroy();
			return;
		}
		
		if (bSplashEffected && Instigator != None && NaliWeapons(Instigator.Weapon) != None)
			CarcassRadiusCheck *= FMax(1.0, NaliWeapons(Instigator.Weapon).Splasher);
		
		ForEach RadiusActors(Class'Carcass', c, CarcassRadiusCheck)
		{
			for (i = 0; i < ArrayCount(ValidCarcassTypes); i++)
			{
				if (ValidCarcassTypes[i] != '' && c.IsA(ValidCarcassTypes[i]) && !c.bShadowCast)
				{
					c.AmbientGlow = 0;
					c.RemoteRole = ROLE_SimulatedProxy;
					c.bShadowCast = True;
					ExecuteCarcass(c, i);
				}
			}
		}
	}
}

//Client side
simulated function SpawnEffects()
{
local Carcass c;
local byte i;
local int fxt;

	if (Role < ROLE_Authority)
	{
		fxt = Class'NWInfo'.static.getCarcassFXSettings();
		if (fxt == 0 || (fxt - 1) < SplashType)
		{
			Destroy();
			return;
		}
		
		if (bSplashEffected && Instigator != None && NaliWeapons(Instigator.Weapon) != None)
			CarcassRadiusCheck *= FMax(1.0, NaliWeapons(Instigator.Weapon).Splasher);
		
		ForEach RadiusActors(Class'Carcass', c, CarcassRadiusCheck)
		{
			for (i = 0; i < ArrayCount(ValidCarcassTypes); i++)
			{
				if (ValidCarcassTypes[i] != '' && c.IsA(ValidCarcassTypes[i]) && !c.bShadowCast)
				{
					c.AmbientGlow = 0;
					c.RemoteRole = ROLE_SimulatedProxy;
					c.bShadowCast = True;
					ExecuteCarcass(c, i);
				}
			}
		}
	}
	
	Destroy();
}

simulated function ExecuteCarcass(Carcass c, optional byte chosenIndex);

defaultproperties
{
	bNetTemporary=False
	bHidden=False
	
	CarcassRadiusCheck=80.000000
	ValidCarcassTypes(0)="Carcass"
	SplashType=SPLX_Moderate
	
	Style=STY_Translucent
	MultiSkins(0)=TranslucInvis
	MultiSkins(1)=TranslucInvis
	MultiSkins(2)=TranslucInvis
	MultiSkins(3)=TranslucInvis
	MultiSkins(4)=TranslucInvis
	MultiSkins(5)=TranslucInvis
	MultiSkins(6)=TranslucInvis
	MultiSkins(7)=TranslucInvis
	Texture=TranslucInvis
	Skin=TranslucInvis
	LODBias=0.250000
}