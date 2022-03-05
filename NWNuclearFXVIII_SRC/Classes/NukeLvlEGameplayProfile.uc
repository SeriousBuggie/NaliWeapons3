//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeLvlEGameplayProfile expands NukesGameplayProfile config(NWProfilesCfg);

struct NukeLvlEStructA
{
	var() byte LightningsAmountPerUpdate;
	var() int LightningDamage;
	var() float LightningsRate, LightningDmgRadius, LightningMaxDistance;
};
var() config NukeLvlEStructA NukeLvlEProfileA[8];

struct NukeLvlEStructB
{
	var() byte finalBoltAmountPerUpdate;
	var() float finalBoltRate, finalBoltMinDistance, finalBoltMaxDistance;
};
var() config NukeLvlEStructB NukeLvlEProfileB[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'NuclearExplosionLevelE'.default.LightningsAmountPerUpdate = default.NukeLvlEProfileA[i].LightningsAmountPerUpdate;
	Class'NuclearExplosionLevelE'.default.LightningDamage = default.NukeLvlEProfileA[i].LightningDamage;
	Class'NuclearExplosionLevelE'.default.LightningsRate = default.NukeLvlEProfileA[i].LightningsRate;
	Class'NuclearExplosionLevelE'.default.LightningDmgRadius = default.NukeLvlEProfileA[i].LightningDmgRadius;
	Class'NuclearExplosionLevelE'.default.LightningMaxDistance = default.NukeLvlEProfileA[i].LightningMaxDistance;
	
	Class'NuclearExplosionLevelE'.default.finalBoltAmountPerUpdate = default.NukeLvlEProfileB[i].finalBoltAmountPerUpdate;
	Class'NuclearExplosionLevelE'.default.finalBoltRate = default.NukeLvlEProfileB[i].finalBoltRate;
	Class'NuclearExplosionLevelE'.default.finalBoltMinDistance = default.NukeLvlEProfileB[i].finalBoltMinDistance;
	Class'NuclearExplosionLevelE'.default.finalBoltMaxDistance = default.NukeLvlEProfileB[i].finalBoltMaxDistance;
	
	Super.ProcessProfileChange(i, Lvl);
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.NukeLvlEProfileA[i].LightningsAmountPerUpdate = Class'NuclearExplosionLevelE'.default.LightningsAmountPerUpdate;
	default.NukeLvlEProfileA[i].LightningDamage = Class'NuclearExplosionLevelE'.default.LightningDamage;
	default.NukeLvlEProfileA[i].LightningsRate = Class'NuclearExplosionLevelE'.default.LightningsRate;
	default.NukeLvlEProfileA[i].LightningDmgRadius = Class'NuclearExplosionLevelE'.default.LightningDmgRadius;
	default.NukeLvlEProfileA[i].LightningMaxDistance = Class'NuclearExplosionLevelE'.default.LightningMaxDistance;
	
	default.NukeLvlEProfileB[i].finalBoltAmountPerUpdate = Class'NuclearExplosionLevelE'.default.finalBoltAmountPerUpdate;
	default.NukeLvlEProfileB[i].finalBoltRate = Class'NuclearExplosionLevelE'.default.finalBoltRate;
	default.NukeLvlEProfileB[i].finalBoltMinDistance = Class'NuclearExplosionLevelE'.default.finalBoltMinDistance;
	default.NukeLvlEProfileB[i].finalBoltMaxDistance = Class'NuclearExplosionLevelE'.default.finalBoltMaxDistance;
	
	Super.ProcessProfileSave(i);
}


defaultproperties
{
	NukeExplClass=Class'NuclearExplosionLevelE'
	
	NukesProfileA(0)=(enableVisibleShockwave=True,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(0)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(0)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=8000,NucleusBaseDamage=14000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(0)=(ShockwaveDmgTransparencyDist=64.000000,NucleusDmgTransparencyDist=128.000000,ShockwaveMufflingFactor=0.350000,NucleusMufflingFactor=0.450000)
	
	NukesProfileA(1)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(1)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(1)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=16000,NucleusBaseDamage=20000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(1)=(ShockwaveDmgTransparencyDist=128.000000,NucleusDmgTransparencyDist=128.000000,ShockwaveMufflingFactor=0.650000,NucleusMufflingFactor=0.750000)
	
	NukesProfileA(2)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(2)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(2)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=40000,NucleusBaseDamage=50000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(2)=(ShockwaveDmgTransparencyDist=256.000000,NucleusDmgTransparencyDist=256.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)	
	
	NukesProfileA(3)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(3)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(3)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=56000,NucleusBaseDamage=64000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(3)=(ShockwaveDmgTransparencyDist=128.000000,NucleusDmgTransparencyDist=256.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
	
	NukesProfileA(4)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(4)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(4)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=120000,NucleusBaseDamage=192000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(4)=(ShockwaveDmgTransparencyDist=256.000000,NucleusDmgTransparencyDist=256.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
	
	NukesProfileA(5)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(5)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(5)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=40000,NucleusBaseDamage=50000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(5)=(ShockwaveDmgTransparencyDist=256.000000,NucleusDmgTransparencyDist=256.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
	
	NukesProfileA(6)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(6)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(6)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=40000,NucleusBaseDamage=50000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(6)=(ShockwaveDmgTransparencyDist=256.000000,NucleusDmgTransparencyDist=256.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
	
	NukesProfileA(7)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(7)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(7)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=40000,NucleusBaseDamage=50000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(7)=(ShockwaveDmgTransparencyDist=256.000000,NucleusDmgTransparencyDist=256.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)

	
	NukeLvlEProfileA(0)=(LightningsAmountPerUpdate=5,LightningDamage=500,LightningsRate=5.000000,LightningDmgRadius=256.000000,LightningMaxDistance=3500.000000)
	NukeLvlEProfileB(0)=(finalBoltAmountPerUpdate=4,finalBoltRate=5.000000,finalBoltMinDistance=3500.000000,finalBoltMaxDistance=7500.000000)

	NukeLvlEProfileA(1)=(LightningsAmountPerUpdate=7,LightningDamage=1000,LightningsRate=6.500000,LightningDmgRadius=512.000000,LightningMaxDistance=4500.000000)
	NukeLvlEProfileB(1)=(finalBoltAmountPerUpdate=7,finalBoltRate=7.500000,finalBoltMinDistance=5000.000000,finalBoltMaxDistance=10000.000000)
	
	NukeLvlEProfileA(2)=(LightningsAmountPerUpdate=10,LightningDamage=2000,LightningsRate=10.000000,LightningDmgRadius=768.000000,LightningMaxDistance=6000.000000)
	NukeLvlEProfileB(2)=(finalBoltAmountPerUpdate=10,finalBoltRate=10.000000,finalBoltMinDistance=10000.000000,finalBoltMaxDistance=20000.000000)
	
	NukeLvlEProfileA(3)=(LightningsAmountPerUpdate=10,LightningDamage=4000,LightningsRate=10.000000,LightningDmgRadius=768.000000,LightningMaxDistance=6000.000000)
	NukeLvlEProfileB(3)=(finalBoltAmountPerUpdate=10,finalBoltRate=10.000000,finalBoltMinDistance=10000.000000,finalBoltMaxDistance=20000.000000)
	
	NukeLvlEProfileA(4)=(LightningsAmountPerUpdate=14,LightningDamage=7500,LightningsRate=13.500000,LightningDmgRadius=966.000000,LightningMaxDistance=8200.000000)
	NukeLvlEProfileB(4)=(finalBoltAmountPerUpdate=10,finalBoltRate=10.000000,finalBoltMinDistance=15000.000000,finalBoltMaxDistance=30000.000000)
	
	NukeLvlEProfileA(5)=(LightningsAmountPerUpdate=10,LightningDamage=2000,LightningsRate=10.000000,LightningDmgRadius=768.000000,LightningMaxDistance=6000.000000)
	NukeLvlEProfileB(5)=(finalBoltAmountPerUpdate=10,finalBoltRate=10.000000,finalBoltMinDistance=10000.000000,finalBoltMaxDistance=20000.000000)
	
	NukeLvlEProfileA(6)=(LightningsAmountPerUpdate=10,LightningDamage=2000,LightningsRate=10.000000,LightningDmgRadius=768.000000,LightningMaxDistance=6000.000000)
	NukeLvlEProfileB(6)=(finalBoltAmountPerUpdate=10,finalBoltRate=10.000000,finalBoltMinDistance=10000.000000,finalBoltMaxDistance=20000.000000)
	
	NukeLvlEProfileA(7)=(LightningsAmountPerUpdate=10,LightningDamage=2000,LightningsRate=10.000000,LightningDmgRadius=768.000000,LightningMaxDistance=6000.000000)
	NukeLvlEProfileB(7)=(finalBoltAmountPerUpdate=10,finalBoltRate=10.000000,finalBoltMinDistance=10000.000000,finalBoltMaxDistance=20000.000000)
}