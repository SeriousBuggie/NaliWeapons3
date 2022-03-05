//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeLvlAGameplayProfile expands NukesGameplayProfile config(NWProfilesCfg);

defaultproperties
{
	NukeExplClass=Class'NuclearExplosionLevelA'
	
	NukesProfileA(0)=(enableVisibleShockwave=True,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(0)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(0)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=500,NucleusBaseDamage=800,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(0)=(ShockwaveDmgTransparencyDist=0.000000,NucleusDmgTransparencyDist=64.000000,ShockwaveMufflingFactor=0.350000,NucleusMufflingFactor=0.450000)
	
	NukesProfileA(1)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(1)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(1)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=1000,NucleusBaseDamage=1200,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(1)=(ShockwaveDmgTransparencyDist=32.000000,NucleusDmgTransparencyDist=64.000000,ShockwaveMufflingFactor=0.650000,NucleusMufflingFactor=0.750000)
	
	NukesProfileA(2)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(2)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(2)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=2500,NucleusBaseDamage=3000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(2)=(ShockwaveDmgTransparencyDist=64.000000,NucleusDmgTransparencyDist=64.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
	
	NukesProfileA(3)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(3)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(3)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=3500,NucleusBaseDamage=4000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(3)=(ShockwaveDmgTransparencyDist=64.000000,NucleusDmgTransparencyDist=64.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
	
	NukesProfileA(4)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(4)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(4)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=7500,NucleusBaseDamage=12000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(4)=(ShockwaveDmgTransparencyDist=128.000000,NucleusDmgTransparencyDist=128.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
	
	NukesProfileA(5)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(5)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(5)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=2500,NucleusBaseDamage=3000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(5)=(ShockwaveDmgTransparencyDist=64.000000,NucleusDmgTransparencyDist=64.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
	
	NukesProfileA(6)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(6)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(6)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=2500,NucleusBaseDamage=3000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(6)=(ShockwaveDmgTransparencyDist=64.000000,NucleusDmgTransparencyDist=64.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
	
	NukesProfileA(7)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(7)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(7)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=2500,NucleusBaseDamage=3000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.100000)
	NukesProfileD(7)=(ShockwaveDmgTransparencyDist=64.000000,NucleusDmgTransparencyDist=64.000000,ShockwaveMufflingFactor=0.850000,NucleusMufflingFactor=0.850000)
}