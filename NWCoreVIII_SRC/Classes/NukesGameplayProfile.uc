//////////////////////////////////////////////////////////////
//				Feralidragon (28-09-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NukesGameplayProfile expands NWProfile config(NWProfilesCfg);

var() class<NuclearExplosions> NukeExplClass;

struct NukesStructA
{
	var() bool enableVisibleShockwave, bSpawnExtraShockFX, bUseIndexedOptimization, bDamageActors;
	var() byte ExtraShockFXAmount;
};
var() config NukesStructA NukesProfileA[8];
	
struct NukesStructB
{
	var() bool ignoreFriends, ignoreInstigator, ignoreDecoration, ignoreProjectiles;
	var() bool ignoreStaticObjects, ignoreTriggers;
};
var() config NukesStructB NukesProfileB[8];

struct NukesStructC
{
	var() byte ShockRadialDmgType, NucleusRadialDmgType;
	var() int ShockwaveBaseDamage, NucleusBaseDamage;
	var() float ShockwaveDmgUpdateTime, NucleusDmgUpdateTime;
};
var() config NukesStructC NukesProfileC[8];

struct NukesStructD
{
	var() float ShockwaveDmgTransparencyDist, NucleusDmgTransparencyDist, ShockwaveMufflingFactor, NucleusMufflingFactor;
};
var() config NukesStructD NukesProfileD[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.NukeExplClass.default.enableVisibleShockwave = default.NukesProfileA[i].enableVisibleShockwave;
	default.NukeExplClass.default.bSpawnExtraShockFX = default.NukesProfileA[i].bSpawnExtraShockFX;
	default.NukeExplClass.default.bUseIndexedOptimization = default.NukesProfileA[i].bUseIndexedOptimization;
	default.NukeExplClass.default.ExtraShockFXAmount = default.NukesProfileA[i].ExtraShockFXAmount;
	default.NukeExplClass.default.bDamageActors = default.NukesProfileA[i].bDamageActors;
	
	default.NukeExplClass.default.ignoreFriends = default.NukesProfileB[i].ignoreFriends;
	default.NukeExplClass.default.ignoreInstigator = default.NukesProfileB[i].ignoreInstigator;
	default.NukeExplClass.default.ignoreDecoration = default.NukesProfileB[i].ignoreDecoration;
	default.NukeExplClass.default.ignoreProjectiles = default.NukesProfileB[i].ignoreProjectiles;
	default.NukeExplClass.default.ignoreStaticObjects = default.NukesProfileB[i].ignoreStaticObjects;
	default.NukeExplClass.default.ignoreTriggers = default.NukesProfileB[i].ignoreTriggers;
	
	default.NukeExplClass.default.ShockRadialDmgType = default.NukeExplClass.static.GetERadialDmgFromByte(default.NukesProfileC[i].ShockRadialDmgType);
	default.NukeExplClass.default.NucleusRadialDmgType = default.NukeExplClass.static.GetERadialDmgFromByte(default.NukesProfileC[i].NucleusRadialDmgType);
	default.NukeExplClass.default.ShockwaveBaseDamage = default.NukesProfileC[i].ShockwaveBaseDamage;
	default.NukeExplClass.default.NucleusBaseDamage = default.NukesProfileC[i].NucleusBaseDamage;
	default.NukeExplClass.default.ShockwaveDmgUpdateTime = default.NukesProfileC[i].ShockwaveDmgUpdateTime;
	default.NukeExplClass.default.NucleusDmgUpdateTime = default.NukesProfileC[i].NucleusDmgUpdateTime;
	
	default.NukeExplClass.default.ShockwaveDmgTransparencyDist = default.NukesProfileD[i].ShockwaveDmgTransparencyDist;
	default.NukeExplClass.default.NucleusDmgTransparencyDist = default.NukesProfileD[i].NucleusDmgTransparencyDist;
	default.NukeExplClass.default.ShockwaveMufflingFactor = default.NukesProfileD[i].ShockwaveMufflingFactor;
	default.NukeExplClass.default.NucleusMufflingFactor = default.NukesProfileD[i].NucleusMufflingFactor;
	
	if (Lvl == None)
		default.NukeExplClass.static.StaticSaveConfig();
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.NukesProfileA[i].enableVisibleShockwave = default.NukeExplClass.default.enableVisibleShockwave;
	default.NukesProfileA[i].bSpawnExtraShockFX = default.NukeExplClass.default.bSpawnExtraShockFX;
	default.NukesProfileA[i].bUseIndexedOptimization = default.NukeExplClass.default.bUseIndexedOptimization;
	default.NukesProfileA[i].ExtraShockFXAmount = default.NukeExplClass.default.ExtraShockFXAmount;
	default.NukesProfileA[i].bDamageActors = default.NukeExplClass.default.bDamageActors;
	
	default.NukesProfileB[i].ignoreFriends = default.NukeExplClass.default.ignoreFriends;
	default.NukesProfileB[i].ignoreInstigator = default.NukeExplClass.default.ignoreInstigator;
	default.NukesProfileB[i].ignoreDecoration = default.NukeExplClass.default.ignoreDecoration;
	default.NukesProfileB[i].ignoreProjectiles = default.NukeExplClass.default.ignoreProjectiles;
	default.NukesProfileB[i].ignoreStaticObjects = default.NukeExplClass.default.ignoreStaticObjects;
	default.NukesProfileB[i].ignoreTriggers = default.NukeExplClass.default.ignoreTriggers;
	
	default.NukesProfileC[i].ShockRadialDmgType = default.NukeExplClass.default.ShockRadialDmgType;
	default.NukesProfileC[i].NucleusRadialDmgType = default.NukeExplClass.default.NucleusRadialDmgType;
	default.NukesProfileC[i].ShockwaveBaseDamage = default.NukeExplClass.default.ShockwaveBaseDamage;
	default.NukesProfileC[i].NucleusBaseDamage = default.NukeExplClass.default.NucleusBaseDamage;
	default.NukesProfileC[i].ShockwaveDmgUpdateTime = default.NukeExplClass.default.ShockwaveDmgUpdateTime;
	default.NukesProfileC[i].NucleusDmgUpdateTime = default.NukeExplClass.default.NucleusDmgUpdateTime;
	
	default.NukesProfileD[i].ShockwaveDmgTransparencyDist = default.NukeExplClass.default.ShockwaveDmgTransparencyDist;
	default.NukesProfileD[i].NucleusDmgTransparencyDist = default.NukeExplClass.default.NucleusDmgTransparencyDist;
	default.NukesProfileD[i].ShockwaveMufflingFactor = default.NukeExplClass.default.ShockwaveMufflingFactor;
	default.NukesProfileD[i].NucleusMufflingFactor = default.NukeExplClass.default.NucleusMufflingFactor;
	
	StaticSaveConfig();
}


defaultproperties
{
	NukeExplClass=Class'NuclearExplosions'
	
	NukesProfileA(0)=(enableVisibleShockwave=True,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5,bDamageActors=False)
	NukesProfileB(0)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=True,ignoreTriggers=False)
	NukesProfileC(0)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=500,NucleusBaseDamage=1000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(0)=(ShockwaveDmgTransparencyDist=64.000000,NucleusDmgTransparencyDist=128.000000,ShockwaveMufflingFactor=0.350000,NucleusMufflingFactor=0.550000)
	
	NukesProfileA(1)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5,bDamageActors=False)
	NukesProfileB(1)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=True,ignoreTriggers=False)
	NukesProfileC(1)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=1000,NucleusBaseDamage=10000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(1)=(ShockwaveDmgTransparencyDist=128.000000,NucleusDmgTransparencyDist=256.000000,ShockwaveMufflingFactor=0.650000,NucleusMufflingFactor=0.750000)
	
	NukesProfileA(2)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5,bDamageActors=False)
	NukesProfileB(2)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=True,ignoreTriggers=False)
	NukesProfileC(2)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=1000,NucleusBaseDamage=10000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(2)=(ShockwaveDmgTransparencyDist=256.000000,NucleusDmgTransparencyDist=256.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
	
	NukesProfileA(3)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5,bDamageActors=False)
	NukesProfileB(3)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=True,ignoreTriggers=False)
	NukesProfileC(3)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=1000,NucleusBaseDamage=10000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(3)=(ShockwaveDmgTransparencyDist=256.000000,NucleusDmgTransparencyDist=256.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
	
	NukesProfileA(4)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5,bDamageActors=False)
	NukesProfileB(4)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=True,ignoreTriggers=False)
	NukesProfileC(4)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=10000,NucleusBaseDamage=100000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(4)=(ShockwaveDmgTransparencyDist=256.000000,NucleusDmgTransparencyDist=256.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
	
	NukesProfileA(5)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5,bDamageActors=False)
	NukesProfileB(5)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=True,ignoreTriggers=False)
	NukesProfileC(5)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=1000,NucleusBaseDamage=10000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(5)=(ShockwaveDmgTransparencyDist=256.000000,NucleusDmgTransparencyDist=256.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
	
	NukesProfileA(6)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5,bDamageActors=False)
	NukesProfileB(6)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=True,ignoreTriggers=False)
	NukesProfileC(6)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=1000,NucleusBaseDamage=10000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(6)=(ShockwaveDmgTransparencyDist=256.000000,NucleusDmgTransparencyDist=256.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
	
	NukesProfileA(7)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5,bDamageActors=False)
	NukesProfileB(7)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=True,ignoreTriggers=False)
	NukesProfileC(7)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=1000,NucleusBaseDamage=10000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(7)=(ShockwaveDmgTransparencyDist=256.000000,NucleusDmgTransparencyDist=256.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
}