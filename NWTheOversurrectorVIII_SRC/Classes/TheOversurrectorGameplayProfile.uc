//////////////////////////////////////////////////////////////
//				Feralidragon (07-02-2014)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOversurrectorGameplayProfile expands NWProfile config(NWProfilesCfg);

struct TheOversurrectorStruct
{
	var() bool bSacrificeWeapon, bSacrificeAmmo, bAmmoNeededToSacrifice;
};
var() config TheOversurrectorStruct TheOversurrectorProfile[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local TheOversurrector OVS;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'TheOversurrector'.default.bSacrificeWeapon = default.TheOversurrectorProfile[i].bSacrificeWeapon;
	Class'TheOversurrector'.default.bSacrificeAmmo = default.TheOversurrectorProfile[i].bSacrificeAmmo;
	Class'TheOversurrector'.default.bAmmoNeededToSacrifice = default.TheOversurrectorProfile[i].bAmmoNeededToSacrifice;
	
	if (Lvl == None)
		Class'TheOversurrector'.static.StaticSaveConfig();
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'TheOversurrector', OVS)
		{
			OVS.default.bSacrificeWeapon = Class'TheOversurrector'.default.bSacrificeWeapon;
			OVS.bSacrificeWeapon = Class'TheOversurrector'.default.bSacrificeWeapon;
			OVS.default.bSacrificeAmmo = Class'TheOversurrector'.default.bSacrificeAmmo;
			OVS.bSacrificeAmmo = Class'TheOversurrector'.default.bSacrificeAmmo;
			OVS.default.bAmmoNeededToSacrifice = Class'TheOversurrector'.default.bAmmoNeededToSacrifice;
			OVS.bAmmoNeededToSacrifice = Class'TheOversurrector'.default.bAmmoNeededToSacrifice;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.TheOversurrectorProfile[i].bSacrificeWeapon = Class'TheOversurrector'.default.bSacrificeWeapon;
	default.TheOversurrectorProfile[i].bSacrificeAmmo = Class'TheOversurrector'.default.bSacrificeAmmo;
	default.TheOversurrectorProfile[i].bAmmoNeededToSacrifice = Class'TheOversurrector'.default.bAmmoNeededToSacrifice;
	
	StaticSaveConfig();
}


defaultproperties
{
	TheOversurrectorProfile(0)=(bSacrificeWeapon=True,bSacrificeAmmo=True,bAmmoNeededToSacrifice=True)
	TheOversurrectorProfile(1)=(bSacrificeWeapon=True,bSacrificeAmmo=True,bAmmoNeededToSacrifice=True)
	TheOversurrectorProfile(2)=(bSacrificeWeapon=True,bSacrificeAmmo=True,bAmmoNeededToSacrifice=True)
	TheOversurrectorProfile(3)=(bSacrificeWeapon=True,bSacrificeAmmo=False,bAmmoNeededToSacrifice=False)
	TheOversurrectorProfile(4)=(bSacrificeWeapon=False,bSacrificeAmmo=False,bAmmoNeededToSacrifice=False)
	TheOversurrectorProfile(5)=(bSacrificeWeapon=True,bSacrificeAmmo=True,bAmmoNeededToSacrifice=True)
	TheOversurrectorProfile(6)=(bSacrificeWeapon=True,bSacrificeAmmo=True,bAmmoNeededToSacrifice=True)
	TheOversurrectorProfile(7)=(bSacrificeWeapon=True,bSacrificeAmmo=True,bAmmoNeededToSacrifice=True)
}