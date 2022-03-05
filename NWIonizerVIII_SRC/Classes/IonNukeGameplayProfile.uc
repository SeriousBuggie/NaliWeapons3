//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonNukeGameplayProfile expands NukesGameplayProfile config(NWProfilesCfg);

defaultproperties
{
	NukeExplClass=Class'IonNuclearExplosion'
	
	NukesProfileA(0)=(enableVisibleShockwave=True,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(0)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(0)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=1000,NucleusBaseDamage=2000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.200000)
	NukesProfileD(0)=(ShockwaveDmgTransparencyDist=128.000000,NucleusDmgTransparencyDist=128.000000,ShockwaveMufflingFactor=0.550000,NucleusMufflingFactor=0.550000)
	
	NukesProfileA(1)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(1)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(1)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=3000,NucleusBaseDamage=7500,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.200000)
	NukesProfileD(1)=(ShockwaveDmgTransparencyDist=256.000000,NucleusDmgTransparencyDist=256.000000,ShockwaveMufflingFactor=0.750000,NucleusMufflingFactor=0.750000)
	
	NukesProfileA(2)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(2)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(2)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=30000,NucleusBaseDamage=75000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.200000)
	NukesProfileD(2)=(ShockwaveDmgTransparencyDist=512.000000,NucleusDmgTransparencyDist=512.000000,ShockwaveMufflingFactor=0.950000,NucleusMufflingFactor=0.950000)
	
	NukesProfileA(3)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(3)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(3)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=30000,NucleusBaseDamage=75000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.200000)
	NukesProfileD(3)=(ShockwaveDmgTransparencyDist=512.000000,NucleusDmgTransparencyDist=512.000000,ShockwaveMufflingFactor=0.950000,NucleusMufflingFactor=0.950000)
	
	NukesProfileA(4)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(4)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(4)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=45000,NucleusBaseDamage=200000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.200000)
	NukesProfileD(4)=(ShockwaveDmgTransparencyDist=512.000000,NucleusDmgTransparencyDist=512.000000,ShockwaveMufflingFactor=0.950000,NucleusMufflingFactor=0.950000)
	
	NukesProfileA(5)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(5)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(5)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=30000,NucleusBaseDamage=75000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.200000)
	NukesProfileD(5)=(ShockwaveDmgTransparencyDist=512.000000,NucleusDmgTransparencyDist=512.000000,ShockwaveMufflingFactor=0.950000,NucleusMufflingFactor=0.950000)
	
	NukesProfileA(6)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(6)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(6)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=30000,NucleusBaseDamage=75000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.200000)
	NukesProfileD(6)=(ShockwaveDmgTransparencyDist=512.000000,NucleusDmgTransparencyDist=512.000000,ShockwaveMufflingFactor=0.950000,NucleusMufflingFactor=0.950000)
	
	NukesProfileA(7)=(enableVisibleShockwave=False,bSpawnExtraShockFX=True,bUseIndexedOptimization=True,ExtraShockFXAmount=5)
	NukesProfileB(7)=(ignoreFriends=True,ignoreInstigator=False,ignoreDecoration=False,ignoreProjectiles=False,ignoreStaticObjects=False,ignoreTriggers=False)
	NukesProfileC(7)=(ShockRadialDmgType=1,NucleusRadialDmgType=1,ShockwaveBaseDamage=30000,NucleusBaseDamage=75000,ShockwaveDmgUpdateTime=0.050000,NucleusDmgUpdateTime=0.200000)
	NukesProfileD(7)=(ShockwaveDmgTransparencyDist=512.000000,NucleusDmgTransparencyDist=512.000000,ShockwaveMufflingFactor=0.950000,NucleusMufflingFactor=0.950000)
}