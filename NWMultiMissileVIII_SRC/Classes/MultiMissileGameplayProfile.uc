//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMissileGameplayProfile expands NWProfile config(NWProfilesCfg);

struct MultiMissileStruct
{
	var() bool canPlayerHoldLock, bUseAmmoT, bUseAmmoX;
	var() int XMissileBaseDamage;
	var() bool enableA, enableH, enableT, enableX;
	var() float LockingRate, LockingStayTime;
};
var() config MultiMissileStruct MultiMissileProfile[8];


struct MultiMOversStructA
{
	var() bool enableOversurrection;
	var() float OversurrectionLifeTime;
	var() float OversurrectionTurretRotRate, OversurrectionFireCycleRate;
};
var() config MultiMOversStructA MultiMOversProfileA[8];

struct MultiMOversStructB
{
	var() float OversurrectionReloadPauseTime, OversurrectionReloadTime;
	var() float OversurrectionScanEnemiesRadius, OversurrectionRangedEnemiesPeriph, OversurrectionAttackMinPeriph;
};
var() config MultiMOversStructB MultiMOversProfileB[8];

struct MultiMOversStructC
{
	var() float OversurrectionHexaAtkOdds, OversurrectionQuadAtkOdds, OversurrectionDualAtkOdds;
	var() int OversurrectionMissileDamage;
	var() float OversurrectionMissileDamageRadius;
};
var() config MultiMOversStructC MultiMOversProfileC[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local MultiMissile MM;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'MultiMissile'.default.canPlayerHoldLock = default.MultiMissileProfile[i].canPlayerHoldLock;
	Class'MultiMissile'.default.bUseAmmoT = default.MultiMissileProfile[i].bUseAmmoT;
	Class'MultiMissile'.default.bUseAmmoX = default.MultiMissileProfile[i].bUseAmmoX;
	Class'MultiMissile'.default.XMissileBaseDamage = default.MultiMissileProfile[i].XMissileBaseDamage;
	Class'MultiMissile'.default.enableA = default.MultiMissileProfile[i].enableA;
	Class'MultiMissile'.default.enableH = default.MultiMissileProfile[i].enableH;
	Class'MultiMissile'.default.enableT = default.MultiMissileProfile[i].enableT;
	Class'MultiMissile'.default.enableX = default.MultiMissileProfile[i].enableX;
	Class'MultiMissile'.default.LockingRate = default.MultiMissileProfile[i].LockingRate;
	Class'MultiMissile'.default.LockingStayTime = default.MultiMissileProfile[i].LockingStayTime;
	
	Class'MultiMissile'.default.enableOversurrection = default.MultiMOversProfileA[i].enableOversurrection;
	Class'MultiMissile'.default.OversurrectionLifeTime = default.MultiMOversProfileA[i].OversurrectionLifeTime;
	Class'MultiMissile'.default.OversurrectionTurretRotRate = default.MultiMOversProfileA[i].OversurrectionTurretRotRate;
	Class'MultiMissile'.default.OversurrectionFireCycleRate = default.MultiMOversProfileA[i].OversurrectionFireCycleRate;
	
	Class'MultiMissile'.default.OversurrectionReloadPauseTime = default.MultiMOversProfileB[i].OversurrectionReloadPauseTime;
	Class'MultiMissile'.default.OversurrectionReloadTime = default.MultiMOversProfileB[i].OversurrectionReloadTime;
	Class'MultiMissile'.default.OversurrectionScanEnemiesRadius = default.MultiMOversProfileB[i].OversurrectionScanEnemiesRadius;
	Class'MultiMissile'.default.OversurrectionRangedEnemiesPeriph = default.MultiMOversProfileB[i].OversurrectionRangedEnemiesPeriph;
	Class'MultiMissile'.default.OversurrectionAttackMinPeriph = default.MultiMOversProfileB[i].OversurrectionAttackMinPeriph;
	
	Class'MultiMissile'.default.OversurrectionHexaAtkOdds = default.MultiMOversProfileC[i].OversurrectionHexaAtkOdds;
	Class'MultiMissile'.default.OversurrectionQuadAtkOdds = default.MultiMOversProfileC[i].OversurrectionQuadAtkOdds;
	Class'MultiMissile'.default.OversurrectionDualAtkOdds = default.MultiMOversProfileC[i].OversurrectionDualAtkOdds;
	Class'MultiMissile'.default.OversurrectionMissileDamage = default.MultiMOversProfileC[i].OversurrectionMissileDamage;
	Class'MultiMissile'.default.OversurrectionMissileDamageRadius = default.MultiMOversProfileC[i].OversurrectionMissileDamageRadius;
	
	if (Lvl == None)
		Class'MultiMissile'.static.StaticSaveConfig();
		
		
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'MultiMissile', MM)
		{
			MM.default.canPlayerHoldLock = Class'MultiMissile'.default.canPlayerHoldLock;
			MM.canPlayerHoldLock = Class'MultiMissile'.default.canPlayerHoldLock;
			MM.default.bUseAmmoT = Class'MultiMissile'.default.bUseAmmoT;
			MM.bUseAmmoT = Class'MultiMissile'.default.bUseAmmoT;
			MM.default.bUseAmmoX = Class'MultiMissile'.default.bUseAmmoX;
			MM.bUseAmmoX = Class'MultiMissile'.default.bUseAmmoX;
			MM.default.XMissileBaseDamage = Class'MultiMissile'.default.XMissileBaseDamage;
			MM.XMissileBaseDamage = Class'MultiMissile'.default.XMissileBaseDamage;
			MM.default.enableA = Class'MultiMissile'.default.enableA;
			MM.enableA = Class'MultiMissile'.default.enableA;
			MM.default.enableH = Class'MultiMissile'.default.enableH;
			MM.enableH = Class'MultiMissile'.default.enableH;
			MM.default.enableT = Class'MultiMissile'.default.enableT;
			MM.enableT = Class'MultiMissile'.default.enableT;
			MM.default.enableX = Class'MultiMissile'.default.enableX;
			MM.enableX = Class'MultiMissile'.default.enableX;
			MM.default.LockingRate = Class'MultiMissile'.default.LockingRate;
			MM.LockingRate = Class'MultiMissile'.default.LockingRate;
			MM.default.LockingStayTime = Class'MultiMissile'.default.LockingStayTime;
			MM.LockingStayTime = Class'MultiMissile'.default.LockingStayTime;
			
			MM.default.enableOversurrection = Class'MultiMissile'.default.enableOversurrection;
			MM.enableOversurrection = Class'MultiMissile'.default.enableOversurrection;
			MM.default.OversurrectionLifeTime = Class'MultiMissile'.default.OversurrectionLifeTime;
			MM.OversurrectionLifeTime = Class'MultiMissile'.default.OversurrectionLifeTime;
			MM.default.OversurrectionTurretRotRate = Class'MultiMissile'.default.OversurrectionTurretRotRate;
			MM.OversurrectionTurretRotRate = Class'MultiMissile'.default.OversurrectionTurretRotRate;
			MM.default.OversurrectionFireCycleRate = Class'MultiMissile'.default.OversurrectionFireCycleRate;
			MM.OversurrectionFireCycleRate = Class'MultiMissile'.default.OversurrectionFireCycleRate;
			
			MM.default.OversurrectionReloadPauseTime = Class'MultiMissile'.default.OversurrectionReloadPauseTime;
			MM.OversurrectionReloadPauseTime = Class'MultiMissile'.default.OversurrectionReloadPauseTime;
			MM.default.OversurrectionReloadTime = Class'MultiMissile'.default.OversurrectionReloadTime;
			MM.OversurrectionReloadTime = Class'MultiMissile'.default.OversurrectionReloadTime;
			MM.default.OversurrectionScanEnemiesRadius = Class'MultiMissile'.default.OversurrectionScanEnemiesRadius;
			MM.OversurrectionScanEnemiesRadius = Class'MultiMissile'.default.OversurrectionScanEnemiesRadius;
			MM.default.OversurrectionRangedEnemiesPeriph = Class'MultiMissile'.default.OversurrectionRangedEnemiesPeriph;
			MM.OversurrectionRangedEnemiesPeriph = Class'MultiMissile'.default.OversurrectionRangedEnemiesPeriph;
			MM.default.OversurrectionAttackMinPeriph = Class'MultiMissile'.default.OversurrectionAttackMinPeriph;
			MM.OversurrectionAttackMinPeriph = Class'MultiMissile'.default.OversurrectionAttackMinPeriph;
			
			MM.default.OversurrectionHexaAtkOdds = Class'MultiMissile'.default.OversurrectionHexaAtkOdds;
			MM.OversurrectionHexaAtkOdds = Class'MultiMissile'.default.OversurrectionHexaAtkOdds;
			MM.default.OversurrectionQuadAtkOdds = Class'MultiMissile'.default.OversurrectionQuadAtkOdds;
			MM.OversurrectionQuadAtkOdds = Class'MultiMissile'.default.OversurrectionQuadAtkOdds;
			MM.default.OversurrectionDualAtkOdds = Class'MultiMissile'.default.OversurrectionDualAtkOdds;
			MM.OversurrectionDualAtkOdds = Class'MultiMissile'.default.OversurrectionDualAtkOdds;
			MM.default.OversurrectionMissileDamage = Class'MultiMissile'.default.OversurrectionMissileDamage;
			MM.OversurrectionMissileDamage = Class'MultiMissile'.default.OversurrectionMissileDamage;
			MM.default.OversurrectionMissileDamageRadius = Class'MultiMissile'.default.OversurrectionMissileDamageRadius;
			MM.OversurrectionMissileDamageRadius = Class'MultiMissile'.default.OversurrectionMissileDamageRadius;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.MultiMissileProfile[i].canPlayerHoldLock = Class'MultiMissile'.default.canPlayerHoldLock;
	default.MultiMissileProfile[i].bUseAmmoT = Class'MultiMissile'.default.bUseAmmoT;
	default.MultiMissileProfile[i].bUseAmmoX = Class'MultiMissile'.default.bUseAmmoX;
	default.MultiMissileProfile[i].XMissileBaseDamage = Class'MultiMissile'.default.XMissileBaseDamage;
	default.MultiMissileProfile[i].enableA = Class'MultiMissile'.default.enableA;
	default.MultiMissileProfile[i].enableH = Class'MultiMissile'.default.enableH;
	default.MultiMissileProfile[i].enableT = Class'MultiMissile'.default.enableT;
	default.MultiMissileProfile[i].enableX = Class'MultiMissile'.default.enableX;
	default.MultiMissileProfile[i].LockingRate = Class'MultiMissile'.default.LockingRate;
	default.MultiMissileProfile[i].LockingStayTime = Class'MultiMissile'.default.LockingStayTime;
	
	default.MultiMOversProfileA[i].enableOversurrection = Class'MultiMissile'.default.enableOversurrection;
	default.MultiMOversProfileA[i].OversurrectionLifeTime = Class'MultiMissile'.default.OversurrectionLifeTime;
	default.MultiMOversProfileA[i].OversurrectionTurretRotRate = Class'MultiMissile'.default.OversurrectionTurretRotRate;
	default.MultiMOversProfileA[i].OversurrectionFireCycleRate = Class'MultiMissile'.default.OversurrectionFireCycleRate;
	
	default.MultiMOversProfileB[i].OversurrectionReloadPauseTime = Class'MultiMissile'.default.OversurrectionReloadPauseTime;
	default.MultiMOversProfileB[i].OversurrectionReloadTime = Class'MultiMissile'.default.OversurrectionReloadTime;
	default.MultiMOversProfileB[i].OversurrectionScanEnemiesRadius = Class'MultiMissile'.default.OversurrectionScanEnemiesRadius;
	default.MultiMOversProfileB[i].OversurrectionRangedEnemiesPeriph = Class'MultiMissile'.default.OversurrectionRangedEnemiesPeriph;
	default.MultiMOversProfileB[i].OversurrectionAttackMinPeriph = Class'MultiMissile'.default.OversurrectionAttackMinPeriph;
	
	default.MultiMOversProfileC[i].OversurrectionHexaAtkOdds = Class'MultiMissile'.default.OversurrectionHexaAtkOdds;
	default.MultiMOversProfileC[i].OversurrectionQuadAtkOdds = Class'MultiMissile'.default.OversurrectionQuadAtkOdds;
	default.MultiMOversProfileC[i].OversurrectionDualAtkOdds = Class'MultiMissile'.default.OversurrectionDualAtkOdds;
	default.MultiMOversProfileC[i].OversurrectionMissileDamage = Class'MultiMissile'.default.OversurrectionMissileDamage;
	default.MultiMOversProfileC[i].OversurrectionMissileDamageRadius = Class'MultiMissile'.default.OversurrectionMissileDamageRadius;
	
	StaticSaveConfig();
}


defaultproperties
{
	MultiMissileProfile(0)=(canPlayerHoldLock=False,bUseAmmoT=True,bUseAmmoX=True,XMissileBaseDamage=550,enableA=True,enableH=True,enableT=False,enableX=False,LockingRate=1.000000,LockingStayTime=0.500000)
	MultiMOversProfileA(0)=(enableOversurrection=True,OversurrectionLifeTime=25.000000,OversurrectionTurretRotRate=7500.000000,OversurrectionFireCycleRate=0.500000)
	MultiMOversProfileB(0)=(OversurrectionReloadPauseTime=4.500000,OversurrectionReloadTime=1.250000,OversurrectionScanEnemiesRadius=25000.000000,OversurrectionRangedEnemiesPeriph=0.750000,OversurrectionAttackMinPeriph=0.925000)
	MultiMOversProfileC(0)=(OversurrectionHexaAtkOdds=0.150000,OversurrectionQuadAtkOdds=0.250000,OversurrectionDualAtkOdds=0.350000,OversurrectionMissileDamage=300,OversurrectionMissileDamageRadius=400.000000)
	
	MultiMissileProfile(1)=(canPlayerHoldLock=False,bUseAmmoT=True,bUseAmmoX=True,XMissileBaseDamage=800,enableA=True,enableH=True,enableT=True,enableX=False,LockingRate=1.500000,LockingStayTime=1.500000)
	MultiMOversProfileA(1)=(enableOversurrection=True,OversurrectionLifeTime=35.000000,OversurrectionTurretRotRate=10000.000000,OversurrectionFireCycleRate=1.000000)
	MultiMOversProfileB(1)=(OversurrectionReloadPauseTime=3.000000,OversurrectionReloadTime=1.000000,OversurrectionScanEnemiesRadius=35000.000000,OversurrectionRangedEnemiesPeriph=0.600000,OversurrectionAttackMinPeriph=0.900000)
	MultiMOversProfileC(1)=(OversurrectionHexaAtkOdds=0.350000,OversurrectionQuadAtkOdds=0.300000,OversurrectionDualAtkOdds=0.650000,OversurrectionMissileDamage=500,OversurrectionMissileDamageRadius=600.000000)
	
	MultiMissileProfile(2)=(canPlayerHoldLock=False,bUseAmmoT=False,bUseAmmoX=False,XMissileBaseDamage=1000,enableA=True,enableH=True,enableT=True,enableX=True,LockingRate=1.500000,LockingStayTime=1.500000)
	MultiMOversProfileA(2)=(enableOversurrection=True,OversurrectionLifeTime=45.000000,OversurrectionTurretRotRate=12000.000000,OversurrectionFireCycleRate=1.000000)
	MultiMOversProfileB(2)=(OversurrectionReloadPauseTime=3.000000,OversurrectionReloadTime=0.750000,OversurrectionScanEnemiesRadius=40000.000000,OversurrectionRangedEnemiesPeriph=0.500000,OversurrectionAttackMinPeriph=0.900000)
	MultiMOversProfileC(2)=(OversurrectionHexaAtkOdds=0.450000,OversurrectionQuadAtkOdds=0.450000,OversurrectionDualAtkOdds=0.750000,OversurrectionMissileDamage=1000,OversurrectionMissileDamageRadius=1200.000000)
	
	MultiMissileProfile(3)=(canPlayerHoldLock=False,bUseAmmoT=True,bUseAmmoX=True,XMissileBaseDamage=1500,enableA=True,enableH=True,enableT=True,enableX=True,LockingRate=1.000000,LockingStayTime=2.500000)
	MultiMOversProfileA(3)=(enableOversurrection=True,OversurrectionLifeTime=60.000000,OversurrectionTurretRotRate=12000.000000,OversurrectionFireCycleRate=1.000000)
	MultiMOversProfileB(3)=(OversurrectionReloadPauseTime=3.000000,OversurrectionReloadTime=0.750000,OversurrectionScanEnemiesRadius=40000.000000,OversurrectionRangedEnemiesPeriph=0.500000,OversurrectionAttackMinPeriph=0.900000)
	MultiMOversProfileC(3)=(OversurrectionHexaAtkOdds=0.550000,OversurrectionQuadAtkOdds=0.550000,OversurrectionDualAtkOdds=0.750000,OversurrectionMissileDamage=2000,OversurrectionMissileDamageRadius=1200.000000)
	
	MultiMissileProfile(4)=(canPlayerHoldLock=False,bUseAmmoT=False,bUseAmmoX=True,XMissileBaseDamage=2500,enableA=True,enableH=True,enableT=True,enableX=True,LockingRate=1.500000,LockingStayTime=2.500000)
	MultiMOversProfileA(4)=(enableOversurrection=True,OversurrectionLifeTime=90.000000,OversurrectionTurretRotRate=14500.000000,OversurrectionFireCycleRate=1.250000)
	MultiMOversProfileB(4)=(OversurrectionReloadPauseTime=2.000000,OversurrectionReloadTime=0.500000,OversurrectionScanEnemiesRadius=45000.000000,OversurrectionRangedEnemiesPeriph=0.400000,OversurrectionAttackMinPeriph=0.825000)
	MultiMOversProfileC(4)=(OversurrectionHexaAtkOdds=0.750000,OversurrectionQuadAtkOdds=0.650000,OversurrectionDualAtkOdds=0.950000,OversurrectionMissileDamage=5000,OversurrectionMissileDamageRadius=1400.000000)
	
	MultiMissileProfile(5)=(canPlayerHoldLock=False,bUseAmmoT=False,bUseAmmoX=False,XMissileBaseDamage=1000,enableA=True,enableH=True,enableT=True,enableX=True,LockingRate=1.000000,LockingStayTime=2.500000)
	MultiMOversProfileA(5)=(enableOversurrection=True,OversurrectionLifeTime=45.000000,OversurrectionTurretRotRate=12000.000000,OversurrectionFireCycleRate=1.000000)
	MultiMOversProfileB(5)=(OversurrectionReloadPauseTime=3.000000,OversurrectionReloadTime=0.750000,OversurrectionScanEnemiesRadius=40000.000000,OversurrectionRangedEnemiesPeriph=0.500000,OversurrectionAttackMinPeriph=0.900000)
	MultiMOversProfileC(5)=(OversurrectionHexaAtkOdds=0.450000,OversurrectionQuadAtkOdds=0.450000,OversurrectionDualAtkOdds=0.750000,OversurrectionMissileDamage=1000,OversurrectionMissileDamageRadius=1200.000000)
	
	MultiMissileProfile(6)=(canPlayerHoldLock=False,bUseAmmoT=False,bUseAmmoX=False,XMissileBaseDamage=1000,enableA=True,enableH=True,enableT=True,enableX=True,LockingRate=1.000000,LockingStayTime=2.500000)
	MultiMOversProfileA(6)=(enableOversurrection=True,OversurrectionLifeTime=45.000000,OversurrectionTurretRotRate=12000.000000,OversurrectionFireCycleRate=1.000000)
	MultiMOversProfileB(6)=(OversurrectionReloadPauseTime=3.000000,OversurrectionReloadTime=0.750000,OversurrectionScanEnemiesRadius=40000.000000,OversurrectionRangedEnemiesPeriph=0.500000,OversurrectionAttackMinPeriph=0.900000)
	MultiMOversProfileC(6)=(OversurrectionHexaAtkOdds=0.450000,OversurrectionQuadAtkOdds=0.450000,OversurrectionDualAtkOdds=0.750000,OversurrectionMissileDamage=1000,OversurrectionMissileDamageRadius=1200.000000)
	
	MultiMissileProfile(7)=(canPlayerHoldLock=False,bUseAmmoT=False,bUseAmmoX=False,XMissileBaseDamage=1000,enableA=True,enableH=True,enableT=True,enableX=True,LockingRate=1.000000,LockingStayTime=2.500000)
	MultiMOversProfileA(7)=(enableOversurrection=True,OversurrectionLifeTime=45.000000,OversurrectionTurretRotRate=12000.000000,OversurrectionFireCycleRate=1.000000)
	MultiMOversProfileB(7)=(OversurrectionReloadPauseTime=3.000000,OversurrectionReloadTime=0.750000,OversurrectionScanEnemiesRadius=40000.000000,OversurrectionRangedEnemiesPeriph=0.500000,OversurrectionAttackMinPeriph=0.900000)
	MultiMOversProfileC(7)=(OversurrectionHexaAtkOdds=0.450000,OversurrectionQuadAtkOdds=0.450000,OversurrectionDualAtkOdds=0.750000,OversurrectionMissileDamage=1000,OversurrectionMissileDamageRadius=1200.000000)
}