//////////////////////////////////////////////////////////////
//				Feralidragon (12-09-2012)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SuperBoltRifleGameplayProfile expands NWProfile config(NWProfilesCfg);

struct SuperBoltRifleStruct
{
	var() bool bInfiniteAmmo, canDropWeapon;
	var() float RefireDelay;
	var() int SuperDamage;
};
var() config SuperBoltRifleStruct SuperBoltRifleProfile[8];


struct SuperBoltRifleExtraStruct
{
	var() bool enableCombo;
	var() int ProjectileDamage, ComboDamage, MaxProjectiles;
	var() float RefireDelayAlt;
};
var() config SuperBoltRifleExtraStruct SuperBoltRifleExtraProfile[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local SuperBoltRifle SBT;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'SuperBoltRifle'.default.bInfiniteAmmo = default.SuperBoltRifleProfile[i].bInfiniteAmmo;
	Class'SuperBoltRifle'.default.canDropWeapon = default.SuperBoltRifleProfile[i].canDropWeapon;
	Class'SuperBoltRifle'.default.RefireDelay = default.SuperBoltRifleProfile[i].RefireDelay;
	Class'SuperBoltRifle'.default.SuperDamage = default.SuperBoltRifleProfile[i].SuperDamage;
	
	Class'SuperBoltRifle'.default.enableCombo = default.SuperBoltRifleExtraProfile[i].enableCombo;
	Class'SuperBoltRifle'.default.ProjectileDamage = default.SuperBoltRifleExtraProfile[i].ProjectileDamage;
	Class'SuperBoltRifle'.default.ComboDamage = default.SuperBoltRifleExtraProfile[i].ComboDamage;
	Class'SuperBoltRifle'.default.MaxProjectiles = default.SuperBoltRifleExtraProfile[i].MaxProjectiles;
	Class'SuperBoltRifle'.default.RefireDelayAlt = default.SuperBoltRifleExtraProfile[i].RefireDelayAlt;
	
	if (Lvl == None)
		Class'SuperBoltRifle'.static.StaticSaveConfig();
	
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'SuperBoltRifle', SBT)
		{
			SBT.default.bInfiniteAmmo = Class'SuperBoltRifle'.default.bInfiniteAmmo;
			SBT.bInfiniteAmmo = Class'SuperBoltRifle'.default.bInfiniteAmmo;
			SBT.default.canDropWeapon = Class'SuperBoltRifle'.default.canDropWeapon;
			SBT.canDropWeapon = Class'SuperBoltRifle'.default.canDropWeapon;
			SBT.default.RefireDelay = Class'SuperBoltRifle'.default.RefireDelay;
			SBT.RefireDelay = Class'SuperBoltRifle'.default.RefireDelay;
			SBT.default.SuperDamage = Class'SuperBoltRifle'.default.SuperDamage;
			SBT.SuperDamage = Class'SuperBoltRifle'.default.SuperDamage;
			SBT.default.enableCombo = Class'SuperBoltRifle'.default.enableCombo;
			SBT.enableCombo = Class'SuperBoltRifle'.default.enableCombo;
			SBT.default.ProjectileDamage = Class'SuperBoltRifle'.default.ProjectileDamage;
			SBT.ProjectileDamage = Class'SuperBoltRifle'.default.ProjectileDamage;
			SBT.default.ComboDamage = Class'SuperBoltRifle'.default.ComboDamage;
			SBT.ComboDamage = Class'SuperBoltRifle'.default.ComboDamage;
			SBT.default.MaxProjectiles = Class'SuperBoltRifle'.default.MaxProjectiles;
			SBT.MaxProjectiles = Class'SuperBoltRifle'.default.MaxProjectiles;
			SBT.default.RefireDelayAlt = Class'SuperBoltRifle'.default.RefireDelayAlt;
			SBT.RefireDelayAlt = Class'SuperBoltRifle'.default.RefireDelayAlt;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.SuperBoltRifleProfile[i].bInfiniteAmmo = Class'SuperBoltRifle'.default.bInfiniteAmmo;
	default.SuperBoltRifleProfile[i].canDropWeapon = Class'SuperBoltRifle'.default.canDropWeapon;
	default.SuperBoltRifleProfile[i].RefireDelay = Class'SuperBoltRifle'.default.RefireDelay;
	default.SuperBoltRifleProfile[i].SuperDamage = Class'SuperBoltRifle'.default.SuperDamage;
	
	default.SuperBoltRifleExtraProfile[i].enableCombo = Class'SuperBoltRifle'.default.enableCombo;
	default.SuperBoltRifleExtraProfile[i].ProjectileDamage = Class'SuperBoltRifle'.default.ProjectileDamage;
	default.SuperBoltRifleExtraProfile[i].ComboDamage = Class'SuperBoltRifle'.default.ComboDamage;
	default.SuperBoltRifleExtraProfile[i].MaxProjectiles = Class'SuperBoltRifle'.default.MaxProjectiles;
	default.SuperBoltRifleExtraProfile[i].RefireDelayAlt = Class'SuperBoltRifle'.default.RefireDelayAlt;
	
	StaticSaveConfig();
}


defaultproperties
{
	SuperBoltRifleProfile(0)=(bInfiniteAmmo=False,canDropWeapon=True,RefireDelay=1.500000,SuperDamage=500)
	SuperBoltRifleExtraProfile(0)=(enableCombo=False,ProjectileDamage=125,ComboDamage=500,MaxProjectiles=1,RefireDelayAlt=0.850000)
	
	SuperBoltRifleProfile(1)=(bInfiniteAmmo=True,canDropWeapon=True,RefireDelay=1.500000,SuperDamage=1000)
	SuperBoltRifleExtraProfile(1)=(enableCombo=False,ProjectileDamage=200,ComboDamage=1000,MaxProjectiles=2,RefireDelayAlt=0.750000)
	
	SuperBoltRifleProfile(2)=(bInfiniteAmmo=True,canDropWeapon=True,RefireDelay=1.000000,SuperDamage=500000)
	SuperBoltRifleExtraProfile(2)=(enableCombo=False,ProjectileDamage=2000,ComboDamage=100000,MaxProjectiles=2,RefireDelayAlt=0.750000)
	
	SuperBoltRifleProfile(3)=(bInfiniteAmmo=False,canDropWeapon=True,RefireDelay=1.000000,SuperDamage=5000)
	SuperBoltRifleExtraProfile(3)=(enableCombo=True,ProjectileDamage=1000,ComboDamage=10000,MaxProjectiles=2,RefireDelayAlt=0.750000)
	
	SuperBoltRifleProfile(4)=(bInfiniteAmmo=False,canDropWeapon=True,RefireDelay=0.750000,SuperDamage=500000)
	SuperBoltRifleExtraProfile(4)=(enableCombo=True,ProjectileDamage=20000,ComboDamage=300000,MaxProjectiles=5,RefireDelayAlt=0.550000)
	
	SuperBoltRifleProfile(5)=(bInfiniteAmmo=True,canDropWeapon=True,RefireDelay=1.000000,SuperDamage=500000)
	SuperBoltRifleExtraProfile(5)=(enableCombo=False,ProjectileDamage=2000,ComboDamage=100000,MaxProjectiles=2,RefireDelayAlt=0.750000)
	
	SuperBoltRifleProfile(6)=(bInfiniteAmmo=True,canDropWeapon=True,RefireDelay=1.000000,SuperDamage=500000)
	SuperBoltRifleExtraProfile(6)=(enableCombo=False,ProjectileDamage=2000,ComboDamage=100000,MaxProjectiles=2,RefireDelayAlt=0.750000)
	
	SuperBoltRifleProfile(7)=(bInfiniteAmmo=True,canDropWeapon=True,RefireDelay=1.000000,SuperDamage=500000)
	SuperBoltRifleExtraProfile(7)=(enableCombo=False,ProjectileDamage=2000,ComboDamage=100000,MaxProjectiles=2,RefireDelayAlt=0.750000)
}