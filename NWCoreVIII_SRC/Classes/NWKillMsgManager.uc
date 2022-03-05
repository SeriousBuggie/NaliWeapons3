//////////////////////////////////////////////////////////////
//				Feralidragon (20-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWKillMsgManager expands Mutator config(NWConfig);


var() config bool enableCachingPreload;

struct KillMsgOpt
{
	var() name DamageName;
	var() string WeaponItem;
};
var() config KillMsgOpt KillMessageOptions[64];


var class<Weapon> WClassCache[64];
var byte WClassCacheLoadFailed[64];
var int weapKIndex;

var bool hasPendingKillMsg;
var PlayerReplicationInfo SavedPRI1, SavedPRI2;
var Object SavedObj;

var bool hasPendingHeadshotKill;
var class<Weapon> HeadshotWeaponClass;


function PostBeginPlay()
{
local int i;

	if (enableCachingPreload)
	{
		for (i = 0; i < ArrayCount(WClassCache); i++)
			loadWClassCache(i);
	}

	Level.Game.RegisterMessageMutator(Self);
	Super.PostBeginPlay();
}

function loadWClassCache(int index)
{
	if (index < 0 || index >= ArrayCount(WClassCache) || KillMessageOptions[index].DamageName == '' || KillMessageOptions[index].WeaponItem == "")
		return;
	WClassCache[index] = class<Weapon>(DynamicLoadObject(KillMessageOptions[index].WeaponItem, class'Class'));
	if (WClassCache[index] == None)
		WClassCacheLoadFailed[index] = 1;
}

function prepareHeadshotKillMsg(Pawn Killer, Pawn Killed, class<Weapon> hsWClass)
{
	if (Killer == None || Killed == None || hsWClass == None)
		return;
	
	HeadshotWeaponClass = hsWClass;
	hasPendingHeadshotKill = True;
	prepareKillMsg(Killer, Killed);
}

function prepareKillMsg(Pawn Killer, Pawn Killed)
{
	if (Killer == None || Killed == None)
		return;
	
	SavedPRI1 = Killer.PlayerReplicationInfo;
	SavedPRI2 = Killed.PlayerReplicationInfo;
	if (Killer.Weapon != None)
		SavedObj = Killer.Weapon.Class;
	else
		SavedObj = None;
	hasPendingKillMsg = True;
}

function bool PreventDeath(Pawn Killed, Pawn Killer, name damageType, vector HitLocation)
{
local bool bPreventDeath;

	bPreventDeath = (NextMutator != None && NextMutator.PreventDeath(Killed, Killer, damageType, HitLocation));
	if (!bPreventDeath && Killer != None && Killed != None && (!hasPendingHeadshotKill || damageType != 'Decapitated'))
	{
		weapKIndex = getWeaponKillMessageIndex(damageType);
		if (weapKIndex >= 0 && weapKIndex < ArrayCount(WClassCache))
		{
			prepareKillMsg(Killer, Killed);
			hasPendingHeadshotKill = False;
		}
	}
	return bPreventDeath;
}

function int getWeaponKillMessageIndex(name damageType)
{
local byte i;

	if (damageType == '')
		return -1;
	
	for (i = 0; i < ArrayCount(KillMessageOptions); i++)
	{
		if (KillMessageOptions[i].DamageName == '' || KillMessageOptions[i].WeaponItem == "")
			return -1;
		if (KillMessageOptions[i].DamageName == damageType)
			return i;
	}
	return -1;
}

function bool MutatorBroadcastLocalizedMessage(Actor Sender, Pawn Receiver, out class<LocalMessage> Message, out optional int S, 
out optional PlayerReplicationInfo RelatedPRI_1, out optional PlayerReplicationInfo RelatedPRI_2, out optional Object OptObj)
{	
	if (hasPendingKillMsg && RelatedPRI_1 == SavedPRI1 && RelatedPRI_2 == SavedPRI2 && OptObj == SavedObj && weapKIndex >= 0 && weapKIndex < ArrayCount(WClassCache))
	{
		if (hasPendingHeadshotKill && HeadshotWeaponClass != None)
			OptObj = HeadshotWeaponClass;
		else if (WClassCache[weapKIndex] != None)
			OptObj = WClassCache[weapKIndex];
		else if (!enableCachingPreload && WClassCacheLoadFailed[weapKIndex] == 0)
		{
			loadWClassCache(weapKIndex);
			if (WClassCache[weapKIndex] != None)
				OptObj = WClassCache[weapKIndex];
		}
		
		hasPendingKillMsg = False;
		hasPendingHeadshotKill = False;
	}

	if (NextMessageMutator != None)
		return NextMessageMutator.MutatorBroadcastLocalizedMessage(Sender, Receiver, Message, S, RelatedPRI_1, RelatedPRI_2, OptObj);
	return True;
}


defaultproperties
{
	enableCachingPreload=False
	
	KillMessageOptions(0)=(DamageName="Nuclear01",WeaponItem="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelA")
	KillMessageOptions(1)=(DamageName="Nuclear02",WeaponItem="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelB")
	KillMessageOptions(2)=(DamageName="Nuclear03",WeaponItem="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelC")
	KillMessageOptions(3)=(DamageName="Nuclear04",WeaponItem="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelD")
	KillMessageOptions(4)=(DamageName="Nuclear05",WeaponItem="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelE")
	KillMessageOptions(5)=(DamageName="NuclearElectric05",WeaponItem="NWNuclearLauncherVIII_SRC.NuclearLauncherLevelE")
	KillMessageOptions(6)=(DamageName="NuclearMega",WeaponItem="NWMegatonVIII_SRC.Megaton")
	KillMessageOptions(7)=(DamageName="NuclearUltima",WeaponItem="NWUltimaProtosVIII_SRC.UltimaProtos")
	KillMessageOptions(8)=(DamageName="NuclearElectricUltima",WeaponItem="NWUltimaProtosVIII_SRC.UltimaProtos")
	KillMessageOptions(9)=(DamageName="NuclearIon",WeaponItem="NWIonizerVIII_SRC.Ionizer")
	KillMessageOptions(10)=(DamageName="Ionized",WeaponItem="NWWREVIII_SRC.WRE")
	KillMessageOptions(11)=(DamageName="Burned",WeaponItem="NWFlameTrackerVIII_SRC.FlameTracker")
	KillMessageOptions(12)=(DamageName="Electrified",WeaponItem="NWBoltRifleVIII_SRC.BoltRifle")
	KillMessageOptions(13)=(DamageName="GravitonPush",WeaponItem="NWGravitonVIII_SRC.Graviton")
	KillMessageOptions(14)=(DamageName="Quantumized",WeaponItem="NWGravitonVIII_SRC.Graviton")
	KillMessageOptions(15)=(DamageName="Frozen",WeaponItem="NWFreezerVIII_SRC.Freezer")
	KillMessageOptions(16)=(DamageName="IcePierced",WeaponItem="NWFreezerVIII_SRC.Freezer")
	KillMessageOptions(17)=(DamageName="Vulcanized",WeaponItem="NWVulcanVIII_SRC.Vulcan")
	KillMessageOptions(18)=(DamageName="MineExplosion",WeaponItem="NWTheMinerVIII_SRC.TheMiner")
	KillMessageOptions(19)=(DamageName="RocketExplosion",WeaponItem="NWMultiMissileVIII_SRC.MultiMissile")
	KillMessageOptions(20)=(DamageName="ThermicExplosion",WeaponItem="NWMultiMissileVIII_SRC.MultiMissile")
	KillMessageOptions(21)=(DamageName="MiniNuclear",WeaponItem="NWMultiMissileVIII_SRC.MultiMissile")
	KillMessageOptions(22)=(DamageName="CybotLaser",WeaponItem="NWCybotLauncherVIII_SRC.CybotLauncher")
	KillMessageOptions(23)=(DamageName="CybotExploded",WeaponItem="NWCybotLauncherVIII_SRC.CybotLauncher")
	KillMessageOptions(24)=(DamageName="CybotSliced",WeaponItem="NWCybotLauncherVIII_SRC.CybotLauncher")
	KillMessageOptions(25)=(DamageName="FieldDamage",WeaponItem="NWCybotLauncherVIII_SRC.CybotLauncher")
	KillMessageOptions(26)=(DamageName="GravityVacuum",WeaponItem="NWCybotLauncherVIII_SRC.CybotLauncher")
	KillMessageOptions(27)=(DamageName="RazorCut",WeaponItem="NWRTVIII_SRC.RT")
	KillMessageOptions(28)=(DamageName="Nuclear00",WeaponItem="NWNuclearLauncherVIII_SRC.NuclearLauncherLevel")
	KillMessageOptions(29)=(DamageName="ElectricCombo",WeaponItem="NWBoltRifleVIII_SRC.BoltRifle")
	KillMessageOptions(30)=(DamageName="Smashed",WeaponItem="NWGravitonVIII_SRC.Graviton")
}