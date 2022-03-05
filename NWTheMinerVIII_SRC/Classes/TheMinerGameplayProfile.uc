//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 THE MINER 1.00
//////////////////////////////////////////////////////////////

class TheMinerGameplayProfile expands NWProfile config(NWProfilesCfg);

struct TheMinerStructA
{
	var() bool enableFriendlyDamage, bMineChainReaction, bUseAmmoSea, bUseAmmoVeh, bUseAmmoAir;
	var() float MinesLifeSpan;
};
var() config TheMinerStructA TheMinerProfileA[8];

struct TheMinerStructB
{
	var() bool enableMineBeacons, ReduceMineBeaconsOnDistance;
	var() float MineBeaconsMaxDistance;
	var() int MaxMinesPerPlayer;
};
var() config TheMinerStructB TheMinerProfileB[8];

struct TheMinerStructC
{
	var() bool enableJump, enableSea, enableLand, enableVeh, enableAir;
};
var() config TheMinerStructC TheMinerProfileC[8];

struct TheMinerStructD
{
	var() int armorAttach, armorJump, armorSea, armorLand, armorVeh, armorAir;
};
var() config TheMinerStructD TheMinerProfileD[8];

struct TheMinerOversStructA
{
	var() bool enableOversurrection;
	var() float OversurrectionLifeTime;
	var() int OversurrectionSpreadMax;
};
var() config TheMinerOversStructA TheMinerOversProfileA[8];

struct TheMinerOversStructB
{
	var() float OversurrectionSpreadRate, OversurrectionSpreadEvalMaxH;
	var() float OversurrectionSpreadMaxRadius, OversurrectionSpreadMinRadius;
};
var() config TheMinerOversStructB TheMinerOversProfileB[8];

struct TheMinerOversStructC
{
	var() float OversurrectionMinesMinLifespan, OversurrectionMinesMaxLifespan, OversurrectionMinesDmgRadius;
	var() int OversurrectionMinesHealth, OversurrectionMinesDamage;
};
var() config TheMinerOversStructC TheMinerOversProfileC[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local TheMiner TM;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'TheMiner'.default.enableFriendlyDamage = default.TheMinerProfileA[i].enableFriendlyDamage;
	Class'TheMiner'.default.bMineChainReaction = default.TheMinerProfileA[i].bMineChainReaction;
	Class'TheMiner'.default.bUseAmmoSea = default.TheMinerProfileA[i].bUseAmmoSea;
	Class'TheMiner'.default.bUseAmmoVeh = default.TheMinerProfileA[i].bUseAmmoVeh;
	Class'TheMiner'.default.bUseAmmoAir = default.TheMinerProfileA[i].bUseAmmoAir;
	Class'TheMiner'.default.MinesLifeSpan = default.TheMinerProfileA[i].MinesLifeSpan;
	
	Class'TheMiner'.default.enableMineBeacons = default.TheMinerProfileB[i].enableMineBeacons;
	Class'TheMiner'.default.ReduceMineBeaconsOnDistance = default.TheMinerProfileB[i].ReduceMineBeaconsOnDistance;
	Class'TheMiner'.default.MineBeaconsMaxDistance = default.TheMinerProfileB[i].MineBeaconsMaxDistance;
	Class'TheMiner'.default.MaxMinesPerPlayer = default.TheMinerProfileB[i].MaxMinesPerPlayer;
	
	Class'TheMiner'.default.enableJump = default.TheMinerProfileC[i].enableJump;
	Class'TheMiner'.default.enableSea = default.TheMinerProfileC[i].enableSea;
	Class'TheMiner'.default.enableLand = default.TheMinerProfileC[i].enableLand;
	Class'TheMiner'.default.enableVeh = default.TheMinerProfileC[i].enableVeh;
	Class'TheMiner'.default.enableAir = default.TheMinerProfileC[i].enableAir;
	
	Class'TheMiner'.default.armorAttach = default.TheMinerProfileD[i].armorAttach;
	Class'TheMiner'.default.armorJump = default.TheMinerProfileD[i].armorJump;
	Class'TheMiner'.default.armorSea = default.TheMinerProfileD[i].armorSea;
	Class'TheMiner'.default.armorLand = default.TheMinerProfileD[i].armorLand;
	Class'TheMiner'.default.armorVeh = default.TheMinerProfileD[i].armorVeh;
	Class'TheMiner'.default.armorAir = default.TheMinerProfileD[i].armorAir;
	
	Class'TheMiner'.default.enableOversurrection = default.TheMinerOversProfileA[i].enableOversurrection;
	Class'TheMiner'.default.OversurrectionLifeTime = default.TheMinerOversProfileA[i].OversurrectionLifeTime;
	Class'TheMiner'.default.OversurrectionSpreadMax = default.TheMinerOversProfileA[i].OversurrectionSpreadMax;
	
	Class'TheMiner'.default.OversurrectionSpreadRate = default.TheMinerOversProfileB[i].OversurrectionSpreadRate;
	Class'TheMiner'.default.OversurrectionSpreadEvalMaxH = default.TheMinerOversProfileB[i].OversurrectionSpreadEvalMaxH;
	Class'TheMiner'.default.OversurrectionSpreadMaxRadius = default.TheMinerOversProfileB[i].OversurrectionSpreadMaxRadius;
	Class'TheMiner'.default.OversurrectionSpreadMinRadius = default.TheMinerOversProfileB[i].OversurrectionSpreadMinRadius;
	
	Class'TheMiner'.default.OversurrectionMinesMinLifespan = default.TheMinerOversProfileC[i].OversurrectionMinesMinLifespan;
	Class'TheMiner'.default.OversurrectionMinesMaxLifespan = default.TheMinerOversProfileC[i].OversurrectionMinesMaxLifespan;
	Class'TheMiner'.default.OversurrectionMinesDmgRadius = default.TheMinerOversProfileC[i].OversurrectionMinesDmgRadius;
	Class'TheMiner'.default.OversurrectionMinesHealth = default.TheMinerOversProfileC[i].OversurrectionMinesHealth;
	Class'TheMiner'.default.OversurrectionMinesDamage = default.TheMinerOversProfileC[i].OversurrectionMinesDamage;
	
	if (Lvl == None)
		Class'TheMiner'.static.StaticSaveConfig();
		
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'TheMiner', TM)
		{
			TM.default.enableFriendlyDamage = Class'TheMiner'.default.enableFriendlyDamage;
			TM.enableFriendlyDamage = Class'TheMiner'.default.enableFriendlyDamage;
			TM.default.bMineChainReaction = Class'TheMiner'.default.bMineChainReaction;
			TM.bMineChainReaction = Class'TheMiner'.default.bMineChainReaction;
			TM.default.bUseAmmoSea = Class'TheMiner'.default.bUseAmmoSea;
			TM.bUseAmmoSea = Class'TheMiner'.default.bUseAmmoSea;
			TM.default.bUseAmmoVeh = Class'TheMiner'.default.bUseAmmoVeh;
			TM.bUseAmmoVeh = Class'TheMiner'.default.bUseAmmoVeh;
			TM.default.bUseAmmoAir = Class'TheMiner'.default.bUseAmmoAir;
			TM.bUseAmmoAir = Class'TheMiner'.default.bUseAmmoAir;
			TM.default.MinesLifeSpan = Class'TheMiner'.default.MinesLifeSpan;
			TM.MinesLifeSpan = Class'TheMiner'.default.MinesLifeSpan;

			TM.default.enableMineBeacons = Class'TheMiner'.default.enableMineBeacons;
			TM.enableMineBeacons = Class'TheMiner'.default.enableMineBeacons;
			TM.default.ReduceMineBeaconsOnDistance = Class'TheMiner'.default.ReduceMineBeaconsOnDistance;
			TM.ReduceMineBeaconsOnDistance = Class'TheMiner'.default.ReduceMineBeaconsOnDistance;
			TM.default.MineBeaconsMaxDistance = Class'TheMiner'.default.MineBeaconsMaxDistance;
			TM.MineBeaconsMaxDistance = Class'TheMiner'.default.MineBeaconsMaxDistance;
			TM.default.MaxMinesPerPlayer = Class'TheMiner'.default.MaxMinesPerPlayer;
			TM.MaxMinesPerPlayer = Class'TheMiner'.default.MaxMinesPerPlayer;

			TM.default.enableJump = Class'TheMiner'.default.enableJump;
			TM.enableJump = Class'TheMiner'.default.enableJump;
			TM.default.enableSea = Class'TheMiner'.default.enableSea;
			TM.enableSea = Class'TheMiner'.default.enableSea;
			TM.default.enableLand = Class'TheMiner'.default.enableLand;
			TM.enableLand = Class'TheMiner'.default.enableLand;
			TM.default.enableVeh = Class'TheMiner'.default.enableVeh;
			TM.enableVeh = Class'TheMiner'.default.enableVeh;
			TM.default.enableAir = Class'TheMiner'.default.enableAir;
			TM.enableAir = Class'TheMiner'.default.enableAir;

			TM.default.armorAttach = Class'TheMiner'.default.armorAttach;
			TM.armorAttach = Class'TheMiner'.default.armorAttach;
			TM.default.armorJump = Class'TheMiner'.default.armorJump;
			TM.armorJump = Class'TheMiner'.default.armorJump;
			TM.default.armorSea = Class'TheMiner'.default.armorSea;
			TM.armorSea = Class'TheMiner'.default.armorSea;
			TM.default.armorLand = Class'TheMiner'.default.armorLand;
			TM.armorLand = Class'TheMiner'.default.armorLand;
			TM.default.armorVeh = Class'TheMiner'.default.armorVeh;
			TM.armorVeh = Class'TheMiner'.default.armorVeh;
			TM.default.armorAir = Class'TheMiner'.default.armorAir;
			TM.armorAir = Class'TheMiner'.default.armorAir;
			
			TM.default.enableOversurrection = Class'TheMiner'.default.enableOversurrection;
			TM.enableOversurrection = Class'TheMiner'.default.enableOversurrection;
			TM.default.OversurrectionLifeTime = Class'TheMiner'.default.OversurrectionLifeTime;
			TM.OversurrectionLifeTime = Class'TheMiner'.default.OversurrectionLifeTime;
			TM.default.OversurrectionSpreadMax = Class'TheMiner'.default.OversurrectionSpreadMax;
			TM.OversurrectionSpreadMax = Class'TheMiner'.default.OversurrectionSpreadMax;
			TM.default.OversurrectionSpreadRate = Class'TheMiner'.default.OversurrectionSpreadRate;
			TM.OversurrectionSpreadRate = Class'TheMiner'.default.OversurrectionSpreadRate;
			TM.default.OversurrectionSpreadEvalMaxH = Class'TheMiner'.default.OversurrectionSpreadEvalMaxH;
			TM.OversurrectionSpreadEvalMaxH = Class'TheMiner'.default.OversurrectionSpreadEvalMaxH;
			TM.default.OversurrectionSpreadMaxRadius = Class'TheMiner'.default.OversurrectionSpreadMaxRadius;
			TM.OversurrectionSpreadMaxRadius = Class'TheMiner'.default.OversurrectionSpreadMaxRadius;
			TM.default.OversurrectionSpreadMinRadius = Class'TheMiner'.default.OversurrectionSpreadMinRadius;
			TM.OversurrectionSpreadMinRadius = Class'TheMiner'.default.OversurrectionSpreadMinRadius;
			TM.default.OversurrectionMinesMinLifespan = Class'TheMiner'.default.OversurrectionMinesMinLifespan;
			TM.OversurrectionMinesMinLifespan = Class'TheMiner'.default.OversurrectionMinesMinLifespan;
			TM.default.OversurrectionMinesMaxLifespan = Class'TheMiner'.default.OversurrectionMinesMaxLifespan;
			TM.OversurrectionMinesMaxLifespan = Class'TheMiner'.default.OversurrectionMinesMaxLifespan;
			TM.default.OversurrectionMinesDmgRadius = Class'TheMiner'.default.OversurrectionMinesDmgRadius;
			TM.OversurrectionMinesDmgRadius = Class'TheMiner'.default.OversurrectionMinesDmgRadius;
			TM.default.OversurrectionMinesHealth = Class'TheMiner'.default.OversurrectionMinesHealth;
			TM.OversurrectionMinesHealth = Class'TheMiner'.default.OversurrectionMinesHealth;
			TM.default.OversurrectionMinesDamage = Class'TheMiner'.default.OversurrectionMinesDamage;
			TM.OversurrectionMinesDamage = Class'TheMiner'.default.OversurrectionMinesDamage;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.TheMinerProfileA[i].enableFriendlyDamage = Class'TheMiner'.default.enableFriendlyDamage;
	default.TheMinerProfileA[i].bMineChainReaction = Class'TheMiner'.default.bMineChainReaction;
	default.TheMinerProfileA[i].bUseAmmoSea = Class'TheMiner'.default.bUseAmmoSea;
	default.TheMinerProfileA[i].bUseAmmoVeh = Class'TheMiner'.default.bUseAmmoVeh;
	default.TheMinerProfileA[i].bUseAmmoAir = Class'TheMiner'.default.bUseAmmoAir;
	default.TheMinerProfileA[i].MinesLifeSpan = Class'TheMiner'.default.MinesLifeSpan;
	
	default.TheMinerProfileB[i].enableMineBeacons = Class'TheMiner'.default.enableMineBeacons;
	default.TheMinerProfileB[i].ReduceMineBeaconsOnDistance = Class'TheMiner'.default.ReduceMineBeaconsOnDistance;
	default.TheMinerProfileB[i].MineBeaconsMaxDistance = Class'TheMiner'.default.MineBeaconsMaxDistance;
	default.TheMinerProfileB[i].MaxMinesPerPlayer = Class'TheMiner'.default.MaxMinesPerPlayer;
	
	default.TheMinerProfileC[i].enableJump = Class'TheMiner'.default.enableJump;
	default.TheMinerProfileC[i].enableSea = Class'TheMiner'.default.enableSea;
	default.TheMinerProfileC[i].enableLand = Class'TheMiner'.default.enableLand;
	default.TheMinerProfileC[i].enableVeh = Class'TheMiner'.default.enableVeh;
	default.TheMinerProfileC[i].enableAir = Class'TheMiner'.default.enableAir;
	
	default.TheMinerProfileD[i].armorAttach = Class'TheMiner'.default.armorAttach;
	default.TheMinerProfileD[i].armorJump = Class'TheMiner'.default.armorJump;
	default.TheMinerProfileD[i].armorSea = Class'TheMiner'.default.armorSea;
	default.TheMinerProfileD[i].armorLand = Class'TheMiner'.default.armorLand;
	default.TheMinerProfileD[i].armorVeh = Class'TheMiner'.default.armorVeh;
	default.TheMinerProfileD[i].armorAir = Class'TheMiner'.default.armorAir;
	
	default.TheMinerOversProfileA[i].enableOversurrection = Class'TheMiner'.default.enableOversurrection;
	default.TheMinerOversProfileA[i].OversurrectionLifeTime = Class'TheMiner'.default.OversurrectionLifeTime;
	default.TheMinerOversProfileA[i].OversurrectionSpreadMax = Class'TheMiner'.default.OversurrectionSpreadMax;
	
	default.TheMinerOversProfileB[i].OversurrectionSpreadRate = Class'TheMiner'.default.OversurrectionSpreadRate;
	default.TheMinerOversProfileB[i].OversurrectionSpreadEvalMaxH = Class'TheMiner'.default.OversurrectionSpreadEvalMaxH;
	default.TheMinerOversProfileB[i].OversurrectionSpreadMaxRadius = Class'TheMiner'.default.OversurrectionSpreadMaxRadius;
	default.TheMinerOversProfileB[i].OversurrectionSpreadMinRadius = Class'TheMiner'.default.OversurrectionSpreadMinRadius;
	
	default.TheMinerOversProfileC[i].OversurrectionMinesMinLifespan = Class'TheMiner'.default.OversurrectionMinesMinLifespan;
	default.TheMinerOversProfileC[i].OversurrectionMinesMaxLifespan = Class'TheMiner'.default.OversurrectionMinesMaxLifespan;
	default.TheMinerOversProfileC[i].OversurrectionMinesDmgRadius = Class'TheMiner'.default.OversurrectionMinesDmgRadius;
	default.TheMinerOversProfileC[i].OversurrectionMinesHealth = Class'TheMiner'.default.OversurrectionMinesHealth;
	default.TheMinerOversProfileC[i].OversurrectionMinesDamage = Class'TheMiner'.default.OversurrectionMinesDamage;
	
	StaticSaveConfig();
}


defaultproperties
{
	TheMinerProfileA(0)=(enableFriendlyDamage=False,bMineChainReaction=False,bUseAmmoSea=True,bUseAmmoVeh=True,bUseAmmoAir=True,MinesLifeSpan=180.000000)
	TheMinerProfileB(0)=(enableMineBeacons=True,ReduceMineBeaconsOnDistance=True,MineBeaconsMaxDistance=1024.000000,MaxMinesPerPlayer=6)
	TheMinerProfileC(0)=(enableJump=True,enableLand=True,enableSea=False,enableVeh=False,enableAir=False)
	TheMinerProfileD(0)=(armorAttach=10,armorJump=20,armorLand=30,armorSea=45,armorVeh=60,armorAir=70)
	TheMinerOversProfileA(0)=(enableOversurrection=True,OversurrectionLifeTime=10.000000,OversurrectionSpreadMax=4)
	TheMinerOversProfileB(0)=(OversurrectionSpreadRate=6.500000,OversurrectionSpreadEvalMaxH=384.000000,OversurrectionSpreadMaxRadius=1024.000000,OversurrectionSpreadMinRadius=256.000000)
	TheMinerOversProfileC(0)=(OversurrectionMinesMinLifespan=8.000000,OversurrectionMinesMaxLifespan=37.000000,OversurrectionMinesDmgRadius=200.000000,OversurrectionMinesHealth=50,OversurrectionMinesDamage=100)
	
	TheMinerProfileA(1)=(enableFriendlyDamage=False,bMineChainReaction=False,bUseAmmoSea=True,bUseAmmoVeh=True,bUseAmmoAir=True,MinesLifeSpan=180.000000)
	TheMinerProfileB(1)=(enableMineBeacons=True,ReduceMineBeaconsOnDistance=True,MineBeaconsMaxDistance=1024.000000,MaxMinesPerPlayer=16)
	TheMinerProfileC(1)=(enableJump=True,enableLand=True,enableSea=True,enableVeh=True,enableAir=False)
	TheMinerProfileD(1)=(armorAttach=20,armorJump=40,armorLand=60,armorSea=70,armorVeh=120,armorAir=135)
	TheMinerOversProfileA(1)=(enableOversurrection=True,OversurrectionLifeTime=15.000000,OversurrectionSpreadMax=5)
	TheMinerOversProfileB(1)=(OversurrectionSpreadRate=8.000000,OversurrectionSpreadEvalMaxH=384.000000,OversurrectionSpreadMaxRadius=1536.000000,OversurrectionSpreadMinRadius=256.000000)
	TheMinerOversProfileC(1)=(OversurrectionMinesMinLifespan=10.000000,OversurrectionMinesMaxLifespan=35.000000,OversurrectionMinesDmgRadius=256.000000,OversurrectionMinesHealth=100,OversurrectionMinesDamage=250)
	
	TheMinerProfileA(2)=(enableFriendlyDamage=False,bMineChainReaction=False,bUseAmmoSea=False,bUseAmmoVeh=False,bUseAmmoAir=False,MinesLifeSpan=180.000000)
	TheMinerProfileB(2)=(enableMineBeacons=True,ReduceMineBeaconsOnDistance=True,MineBeaconsMaxDistance=1024.000000,MaxMinesPerPlayer=0)
	TheMinerProfileC(2)=(enableJump=True,enableLand=True,enableSea=True,enableVeh=True,enableAir=True)
	TheMinerProfileD(2)=(armorAttach=40,armorJump=80,armorLand=125,armorSea=150,armorVeh=250,armorAir=275)
	TheMinerOversProfileA(2)=(enableOversurrection=True,OversurrectionLifeTime=25.000000,OversurrectionSpreadMax=6)
	TheMinerOversProfileB(2)=(OversurrectionSpreadRate=10.000000,OversurrectionSpreadEvalMaxH=384.000000,OversurrectionSpreadMaxRadius=2048.000000,OversurrectionSpreadMinRadius=384.000000)
	TheMinerOversProfileC(2)=(OversurrectionMinesMinLifespan=15.000000,OversurrectionMinesMaxLifespan=45.000000,OversurrectionMinesDmgRadius=384.000000,OversurrectionMinesHealth=200,OversurrectionMinesDamage=500)
	
	TheMinerProfileA(3)=(enableFriendlyDamage=False,bMineChainReaction=False,bUseAmmoSea=True,bUseAmmoVeh=True,bUseAmmoAir=True,MinesLifeSpan=180.000000)
	TheMinerProfileB(3)=(enableMineBeacons=False,ReduceMineBeaconsOnDistance=True,MineBeaconsMaxDistance=1024.000000,MaxMinesPerPlayer=0)
	TheMinerProfileC(3)=(enableJump=True,enableLand=True,enableSea=True,enableVeh=True,enableAir=True)
	TheMinerProfileD(3)=(armorAttach=40,armorJump=80,armorLand=125,armorSea=150,armorVeh=250,armorAir=275)
	TheMinerOversProfileA(3)=(enableOversurrection=True,OversurrectionLifeTime=35.000000,OversurrectionSpreadMax=6)
	TheMinerOversProfileB(3)=(OversurrectionSpreadRate=10.000000,OversurrectionSpreadEvalMaxH=384.000000,OversurrectionSpreadMaxRadius=2048.000000,OversurrectionSpreadMinRadius=384.000000)
	TheMinerOversProfileC(3)=(OversurrectionMinesMinLifespan=15.000000,OversurrectionMinesMaxLifespan=45.000000,OversurrectionMinesDmgRadius=384.000000,OversurrectionMinesHealth=350,OversurrectionMinesDamage=1000)
	
	TheMinerProfileA(4)=(enableFriendlyDamage=False,bMineChainReaction=False,bUseAmmoSea=False,bUseAmmoVeh=False,bUseAmmoAir=True,MinesLifeSpan=180.000000)
	TheMinerProfileB(4)=(enableMineBeacons=False,ReduceMineBeaconsOnDistance=True,MineBeaconsMaxDistance=1024.000000,MaxMinesPerPlayer=0)
	TheMinerProfileC(4)=(enableJump=True,enableLand=True,enableSea=True,enableVeh=True,enableAir=True)
	TheMinerProfileD(4)=(armorAttach=100,armorJump=180,armorLand=270,armorSea=320,armorVeh=535,armorAir=600)
	TheMinerOversProfileA(4)=(enableOversurrection=True,OversurrectionLifeTime=45.000000,OversurrectionSpreadMax=8)
	TheMinerOversProfileB(4)=(OversurrectionSpreadRate=10.000000,OversurrectionSpreadEvalMaxH=384.000000,OversurrectionSpreadMaxRadius=2048.000000,OversurrectionSpreadMinRadius=384.000000)
	TheMinerOversProfileC(4)=(OversurrectionMinesMinLifespan=25.000000,OversurrectionMinesMaxLifespan=60.000000,OversurrectionMinesDmgRadius=512.000000,OversurrectionMinesHealth=1000,OversurrectionMinesDamage=2500)
	
	TheMinerProfileA(5)=(enableFriendlyDamage=False,bMineChainReaction=False,bUseAmmoSea=False,bUseAmmoVeh=False,bUseAmmoAir=False,MinesLifeSpan=180.000000)
	TheMinerProfileB(5)=(enableMineBeacons=True,ReduceMineBeaconsOnDistance=True,MineBeaconsMaxDistance=1024.000000,MaxMinesPerPlayer=0)
	TheMinerProfileC(5)=(enableJump=True,enableLand=True,enableSea=True,enableVeh=True,enableAir=True)
	TheMinerProfileD(5)=(armorAttach=40,armorJump=80,armorLand=125,armorSea=150,armorVeh=250,armorAir=275)
	TheMinerOversProfileA(5)=(enableOversurrection=True,OversurrectionLifeTime=25.000000,OversurrectionSpreadMax=6)
	TheMinerOversProfileB(5)=(OversurrectionSpreadRate=10.000000,OversurrectionSpreadEvalMaxH=384.000000,OversurrectionSpreadMaxRadius=2048.000000,OversurrectionSpreadMinRadius=384.000000)
	TheMinerOversProfileC(5)=(OversurrectionMinesMinLifespan=15.000000,OversurrectionMinesMaxLifespan=45.000000,OversurrectionMinesDmgRadius=384.000000,OversurrectionMinesHealth=200,OversurrectionMinesDamage=500)
	
	TheMinerProfileA(6)=(enableFriendlyDamage=False,bMineChainReaction=False,bUseAmmoSea=False,bUseAmmoVeh=False,bUseAmmoAir=False,MinesLifeSpan=180.000000)
	TheMinerProfileB(6)=(enableMineBeacons=True,ReduceMineBeaconsOnDistance=True,MineBeaconsMaxDistance=1024.000000,MaxMinesPerPlayer=0)
	TheMinerProfileC(6)=(enableJump=True,enableLand=True,enableSea=True,enableVeh=True,enableAir=True)
	TheMinerProfileD(6)=(armorAttach=40,armorJump=80,armorLand=125,armorSea=150,armorVeh=250,armorAir=275)
	TheMinerOversProfileA(6)=(enableOversurrection=True,OversurrectionLifeTime=25.000000,OversurrectionSpreadMax=6)
	TheMinerOversProfileB(6)=(OversurrectionSpreadRate=10.000000,OversurrectionSpreadEvalMaxH=384.000000,OversurrectionSpreadMaxRadius=2048.000000,OversurrectionSpreadMinRadius=384.000000)
	TheMinerOversProfileC(6)=(OversurrectionMinesMinLifespan=15.000000,OversurrectionMinesMaxLifespan=45.000000,OversurrectionMinesDmgRadius=384.000000,OversurrectionMinesHealth=200,OversurrectionMinesDamage=500)
	
	TheMinerProfileA(7)=(enableFriendlyDamage=False,bMineChainReaction=False,bUseAmmoSea=False,bUseAmmoVeh=False,bUseAmmoAir=False,MinesLifeSpan=180.000000)
	TheMinerProfileB(7)=(enableMineBeacons=True,ReduceMineBeaconsOnDistance=True,MineBeaconsMaxDistance=1024.000000,MaxMinesPerPlayer=0)
	TheMinerProfileC(7)=(enableJump=True,enableLand=True,enableSea=True,enableVeh=True,enableAir=True)
	TheMinerProfileD(7)=(armorAttach=40,armorJump=80,armorLand=125,armorSea=150,armorVeh=250,armorAir=275)
	TheMinerOversProfileA(7)=(enableOversurrection=True,OversurrectionLifeTime=25.000000,OversurrectionSpreadMax=6)
	TheMinerOversProfileB(7)=(OversurrectionSpreadRate=10.000000,OversurrectionSpreadEvalMaxH=384.000000,OversurrectionSpreadMaxRadius=2048.000000,OversurrectionSpreadMinRadius=384.000000)
	TheMinerOversProfileC(7)=(OversurrectionMinesMinLifespan=15.000000,OversurrectionMinesMaxLifespan=45.000000,OversurrectionMinesDmgRadius=384.000000,OversurrectionMinesHealth=200,OversurrectionMinesDamage=500)
}