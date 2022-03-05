//////////////////////////////////////////////////////////////
//	Nali Weapons III mutator to balance weapons
//				Feralidragon (04-01-2013)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWeaponBalanceBoardMut expands Mutator config(NWExtrasCfg);

var() class<NWUtils> UtilsClass;

struct WeaponOpts
{
	var() name WeaponClassName;
	var() string BasicOptions;
	var() string PropertyOptions;
};

var(ServerConfig) config WeaponOpts WeaponOptions[64];

var int WeaponOptsSize;

struct AmmoCached
{
	var class<Weapon> WeaponClass;
	var class<Ammo> AmmoClass;
	var string BOptions;
};

var AmmoCached CachedAmmoList[256];


function PreBeginPlay()
{
local int i;

	for (i = ArrayCount(WeaponOptions)-1; i >= 0; i--)
	{
		if (WeaponOptions[i].WeaponClassName != '')
		{
			WeaponOptsSize = i + 1;
			break;
		}
	}
	
	Super.PreBeginPlay();
}


function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	if (Weapon(Other) != None)
		HandleWeaponOptions(Weapon(Other));
	else if (Ammo(Other) != None)
		HandleAmmoOptions(Ammo(Other));
	return True;
}

function class<Weapon> getAmmoCachedWeaponClass(Ammo Am, optional out string BOptions)
{
local int i;

	BOptions = "";
	if (Am == None)
		return None;

	for (i = 0; i < ArrayCount(CachedAmmoList); i++)
	{
		if (CachedAmmoList[i].AmmoClass == None)
			return None;
		if (Am.Class == CachedAmmoList[i].AmmoClass)
		{
			BOptions = CachedAmmoList[i].BOptions;
			return CachedAmmoList[i].WeaponClass;
		}
	}
	return None;
}

function class<Ammo> getAmmoCachedAmmoClass(Weapon W, optional out string BOptions)
{
local int i;

	BOptions = "";
	if (W == None)
		return None;

	for (i = 0; i < ArrayCount(CachedAmmoList); i++)
	{
		if (CachedAmmoList[i].WeaponClass == None)
			return None;
		if (W.Class == CachedAmmoList[i].WeaponClass)
		{
			BOptions = CachedAmmoList[i].BOptions;
			return CachedAmmoList[i].AmmoClass;
		}
	}
	return None;
}

function addToAmmoCache(Weapon W, optional string BOptions)
{
local int i;

	if (W.AmmoName == None || getAmmoCachedAmmoClass(W) != None)
		return;
	
	for (i = 0; i < ArrayCount(CachedAmmoList); i++)
	{
		if (CachedAmmoList[i].WeaponClass == None)
		{
			CachedAmmoList[i].WeaponClass = W.Class;
			CachedAmmoList[i].AmmoClass = W.AmmoName;
			CachedAmmoList[i].BOptions = BOptions;
			return;
		}
	}
}

function HandleAmmoOptions(Ammo Am)
{
local float AmRespawn;
local int AmMaxAmmo, AmAmmo;
local string BOptions;

	if (getAmmoCachedWeaponClass(Am, BOptions) == None)
		return;

	ProcessAmmoStrOptions(BOptions, AmRespawn, AmMaxAmmo, AmAmmo);
	if (AmRespawn > 0 || AmMaxAmmo > 0 || AmAmmo > 0)
		ProcessAmmo(Am, AmRespawn, AmMaxAmmo, AmAmmo);
}

function HandleWeaponOptions(Weapon W)
{
local string BOptions, POptions, data;
local string strProp, strVal;
local int i;
local Ammo Am;
local float AmRespawn;
local int AmMaxAmmo, AmAmmo;


	if (!HasWeaponOptions(W, BOptions, POptions))
		return;

	//Set properties
	i = 0;
	while (POptions != "" && UtilsClass.static.hasPropertyFromStringList(POptions, i, strProp, strVal))
	{
		W.SetPropertyText(strProp, strVal);
		i++;
	}
	
	//Set basic options
	data = UtilsClass.static.getValueFromSettingsString("respawn", BOptions);
	if (data != "" && Float(data) > 0)
		W.RespawnTime = Float(data);
	
	if (NaliWeapons(W) != None)
	{
		data = UtilsClass.static.getValueFromSettingsString("firerate1", BOptions);
		if (Float(data) > 0)
			NaliWeapons(W).FireRateMult1 = Float(data);
			
		data = UtilsClass.static.getValueFromSettingsString("firerate2", BOptions);
		if (Float(data) > 0)
			NaliWeapons(W).FireRateMult2 = Float(data);
		
		data = UtilsClass.static.getValueFromSettingsString("damage1", BOptions);
		if (Float(data) > 0)
			NaliWeapons(W).DamageMult1 = Float(data);
			
		data = UtilsClass.static.getValueFromSettingsString("damage2", BOptions);
		if (Float(data) > 0)
			NaliWeapons(W).DamageMult2 = Float(data);
	}
	
	if (W.AmmoName != None)
	{
		ProcessAmmoStrOptions(BOptions, AmRespawn, AmMaxAmmo, AmAmmo);
		if (getAmmoCachedAmmoClass(W) == None && (AmRespawn > 0 || AmMaxAmmo > 0 || AmAmmo > 0))
		{
			foreach AllActors(Class'Ammo', Am)
			{
				if (Am.Class == W.AmmoName)
					ProcessAmmo(Am, AmRespawn, AmMaxAmmo, AmAmmo);
			}
		}
		
		data = UtilsClass.static.getValueFromSettingsString("startammo", BOptions);
		if (Int(data) > 0)
		{
			if (AmMaxAmmo <= 0)
				AmMaxAmmo = W.AmmoName.default.MaxAmmo;
			W.PickupAmmoCount = Min(Int(data), AmMaxAmmo);
		}
	}

	addToAmmoCache(W, BOptions);
}

function ProcessAmmo(Ammo Am, float AmRespawn, int AmMaxAmmo, int AmAmmo)
{
	if (Am == None)
		return;
	if (AmRespawn > 0)
		Am.RespawnTime = AmRespawn;
	if (AmMaxAmmo > 0)
		Am.MaxAmmo = AmMaxAmmo;
	if (AmAmmo > 0)
		Am.AmmoAmount = Min(AmAmmo, Am.MaxAmmo);
}

function ProcessAmmoStrOptions(string data, out float AmRespawn, out int AmMaxAmmo, out int AmAmmo)
{
	AmRespawn = 0;
	AmMaxAmmo = 0;
	AmAmmo = 0;
	
	if (data == "")
		return;
	AmRespawn = float(UtilsClass.static.getValueFromSettingsString("ammorespawn", data));
	AmMaxAmmo = int(UtilsClass.static.getValueFromSettingsString("maxammo", data));
	AmAmmo = int(UtilsClass.static.getValueFromSettingsString("ammo", data));
}

function bool HasWeaponOptions(Weapon W, optional out string BOptions, optional out string POptions)
{
local int i;

	BOptions = "";
	POptions = "";
	if (W == None)
		return False;

	for (i = WeaponOptsSize-1; i >= 0; i--)
	{
		if (WeaponOptions[i].WeaponClassName != '' && W.IsA(WeaponOptions[i].WeaponClassName))
		{
			BOptions = WeaponOptions[i].BasicOptions;
			POptions = WeaponOptions[i].PropertyOptions;
			return True;
		}
	}
	return False;
}

 
defaultproperties
{
	UtilsClass=Class'NWUtils'
}