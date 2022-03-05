//////////////////////////////////////////////////////////////
//				Feralidragon (17-09-2012)
//
// NW3 INFRARED PRECISION RIFLE 1.00
//////////////////////////////////////////////////////////////

class IRPRGameplayProfile expands NWProfile config(NWProfilesCfg);

struct IRPRStructA
{
	var() bool enableWallThroughZoom, enableScopeTeamMarkers, enableScopeEnemyMarkers, enableScopeFriendlyMarkers, bPlayersAlwaysRelevant;
};
var() config IRPRStructA IRPRProfileA[8];

struct IRPRStructB
{
	var() bool bReduceDamageByWallthrough;
	var() byte MaxWallthroughPrecision;
	var() float MaxWallthroughDepth;
	var() int MaxWallthroughShots;
};
var() config IRPRStructB IRPRProfileB[8];

struct IRPRStructC
{
	var() int HeadShotDmg;
	var() float ZoomInViewRange, ZoomOutViewRange;
};
var() config IRPRStructC IRPRProfileC[8];

struct IRPRStructD
{
	var() bool enableTeamColoredLaser, bAlwaysTeamColoredLaser, enableZoomIR, enableZoomGreenIRGlass, enableTraceBeam;
	var() byte defaultLaserColor;
};
var() config IRPRStructD IRPRProfileD[8];


struct IRPROversStructA
{
	var() bool enableOversurrection;
	var() float OversurrectionLifeTime, OversurrectionTurretRotRate, OversurrectionFireCycleRate;
};
var() config IRPROversStructA IRPROversProfileA[8];

struct IRPROversStructB
{
	var() float OversurrectionLaserPrepareTime, OversurrectionLaserCooldownTime, OversurrectionLaserFireMaxTime;
};
var() config IRPROversStructB IRPROversProfileB[8];

struct IRPROversStructC
{
	var() float OversurrectionScanEnemiesRadius, OversurrectionRangedEnemiesPeriph, OversurrectionAttackMinPeriph;
};
var() config IRPROversStructC IRPROversProfileC[8];

struct IRPROversStructD
{
	var() int OversurrectionLaserDamage, OversurrectionMaxWTTraces, OversurrectionMaxWTTracePrecision;
};
var() config IRPROversStructD IRPROversProfileD[8];

struct IRPROversStructE
{
	var() float OversurrectionMaxTraceRange, OversurrectionMaxWTTraceDepth, OversurrectionStopFireOdds;
};
var() config IRPROversStructE IRPROversProfileE[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local IRPR IRPRifle;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'IRPR'.default.enableWallThroughZoom = default.IRPRProfileA[i].enableWallThroughZoom;
	Class'IRPR'.default.enableScopeTeamMarkers = default.IRPRProfileA[i].enableScopeTeamMarkers;
	Class'IRPR'.default.enableScopeEnemyMarkers = default.IRPRProfileA[i].enableScopeEnemyMarkers;
	Class'IRPR'.default.enableScopeFriendlyMarkers = default.IRPRProfileA[i].enableScopeFriendlyMarkers;
	Class'IRPR'.default.bPlayersAlwaysRelevant = default.IRPRProfileA[i].bPlayersAlwaysRelevant;
	
	Class'IRPR'.default.bReduceDamageByWallthrough = default.IRPRProfileB[i].bReduceDamageByWallthrough;
	Class'IRPR'.default.MaxWallthroughPrecision = default.IRPRProfileB[i].MaxWallthroughPrecision;
	Class'IRPR'.default.MaxWallthroughDepth = default.IRPRProfileB[i].MaxWallthroughDepth;
	Class'IRPR'.default.MaxWallthroughShots = default.IRPRProfileB[i].MaxWallthroughShots;
	
	Class'IRPR'.default.HeadShotDmg = default.IRPRProfileC[i].HeadShotDmg;
	Class'IRPR'.default.ZoomInViewRange = default.IRPRProfileC[i].ZoomInViewRange;
	Class'IRPR'.default.ZoomOutViewRange = default.IRPRProfileC[i].ZoomOutViewRange;
	
	Class'IRPR'.default.enableTeamColoredLaser = default.IRPRProfileD[i].enableTeamColoredLaser;
	Class'IRPR'.default.bAlwaysTeamColoredLaser = default.IRPRProfileD[i].bAlwaysTeamColoredLaser;
	Class'IRPR'.default.enableZoomIR = default.IRPRProfileD[i].enableZoomIR;
	Class'IRPR'.default.enableZoomGreenIRGlass = default.IRPRProfileD[i].enableZoomGreenIRGlass;
	Class'IRPR'.default.enableTraceBeam = default.IRPRProfileD[i].enableTraceBeam;
	Class'IRPR'.default.defaultLaserColor =  Class'IRPR'.static.GetELaserColorFromByte(default.IRPRProfileD[i].defaultLaserColor);
	
	Class'IRPR'.default.enableOversurrection = default.IRPROversProfileA[i].enableOversurrection;
	Class'IRPR'.default.OversurrectionLifeTime = default.IRPROversProfileA[i].OversurrectionLifeTime;
	Class'IRPR'.default.OversurrectionTurretRotRate = default.IRPROversProfileA[i].OversurrectionTurretRotRate;
	Class'IRPR'.default.OversurrectionFireCycleRate = default.IRPROversProfileA[i].OversurrectionFireCycleRate;
	
	Class'IRPR'.default.OversurrectionLaserPrepareTime = default.IRPROversProfileB[i].OversurrectionLaserPrepareTime;
	Class'IRPR'.default.OversurrectionLaserCooldownTime = default.IRPROversProfileB[i].OversurrectionLaserCooldownTime;
	Class'IRPR'.default.OversurrectionLaserFireMaxTime = default.IRPROversProfileB[i].OversurrectionLaserFireMaxTime;
	
	Class'IRPR'.default.OversurrectionScanEnemiesRadius = default.IRPROversProfileC[i].OversurrectionScanEnemiesRadius;
	Class'IRPR'.default.OversurrectionRangedEnemiesPeriph = default.IRPROversProfileC[i].OversurrectionRangedEnemiesPeriph;
	Class'IRPR'.default.OversurrectionAttackMinPeriph = default.IRPROversProfileC[i].OversurrectionAttackMinPeriph;
	
	Class'IRPR'.default.OversurrectionLaserDamage = default.IRPROversProfileD[i].OversurrectionLaserDamage;
	Class'IRPR'.default.OversurrectionMaxWTTraces = default.IRPROversProfileD[i].OversurrectionMaxWTTraces;
	Class'IRPR'.default.OversurrectionMaxWTTracePrecision = default.IRPROversProfileD[i].OversurrectionMaxWTTracePrecision;
	
	Class'IRPR'.default.OversurrectionMaxTraceRange = default.IRPROversProfileE[i].OversurrectionMaxTraceRange;
	Class'IRPR'.default.OversurrectionMaxWTTraceDepth = default.IRPROversProfileE[i].OversurrectionMaxWTTraceDepth;
	Class'IRPR'.default.OversurrectionStopFireOdds = default.IRPROversProfileE[i].OversurrectionStopFireOdds;
	
	if (Lvl == None)
		Class'IRPR'.static.StaticSaveConfig();
	
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'IRPR', IRPRifle)
		{
			IRPRifle.default.enableWallThroughZoom = Class'IRPR'.default.enableWallThroughZoom;
			IRPRifle.enableWallThroughZoom = Class'IRPR'.default.enableWallThroughZoom;
			IRPRifle.default.enableScopeTeamMarkers = Class'IRPR'.default.enableScopeTeamMarkers;
			IRPRifle.enableScopeTeamMarkers = Class'IRPR'.default.enableScopeTeamMarkers;
			IRPRifle.default.enableScopeEnemyMarkers = Class'IRPR'.default.enableScopeEnemyMarkers;
			IRPRifle.enableScopeEnemyMarkers = Class'IRPR'.default.enableScopeEnemyMarkers;
			IRPRifle.default.enableScopeFriendlyMarkers = Class'IRPR'.default.enableScopeFriendlyMarkers;
			IRPRifle.enableScopeFriendlyMarkers = Class'IRPR'.default.enableScopeFriendlyMarkers;
			IRPRifle.default.bPlayersAlwaysRelevant = Class'IRPR'.default.bPlayersAlwaysRelevant;
			IRPRifle.bPlayersAlwaysRelevant = Class'IRPR'.default.bPlayersAlwaysRelevant;

			IRPRifle.default.bReduceDamageByWallthrough = Class'IRPR'.default.bReduceDamageByWallthrough;
			IRPRifle.bReduceDamageByWallthrough = Class'IRPR'.default.bReduceDamageByWallthrough;
			IRPRifle.default.MaxWallthroughPrecision = Class'IRPR'.default.MaxWallthroughPrecision;
			IRPRifle.MaxWallthroughPrecision = Class'IRPR'.default.MaxWallthroughPrecision;
			IRPRifle.default.MaxWallthroughDepth = Class'IRPR'.default.MaxWallthroughDepth;
			IRPRifle.MaxWallthroughDepth = Class'IRPR'.default.MaxWallthroughDepth;
			IRPRifle.default.MaxWallthroughShots = Class'IRPR'.default.MaxWallthroughShots;
			IRPRifle.MaxWallthroughShots = Class'IRPR'.default.MaxWallthroughShots;

			IRPRifle.default.HeadShotDmg = Class'IRPR'.default.HeadShotDmg;
			IRPRifle.HeadShotDmg = Class'IRPR'.default.HeadShotDmg;
			IRPRifle.default.ZoomInViewRange = Class'IRPR'.default.ZoomInViewRange;
			IRPRifle.ZoomInViewRange = Class'IRPR'.default.ZoomInViewRange;
			IRPRifle.default.ZoomOutViewRange = Class'IRPR'.default.ZoomOutViewRange;
			IRPRifle.ZoomOutViewRange = Class'IRPR'.default.ZoomOutViewRange;

			IRPRifle.default.enableTeamColoredLaser = Class'IRPR'.default.enableTeamColoredLaser;
			IRPRifle.enableTeamColoredLaser = Class'IRPR'.default.enableTeamColoredLaser;
			IRPRifle.default.bAlwaysTeamColoredLaser = Class'IRPR'.default.bAlwaysTeamColoredLaser;
			IRPRifle.bAlwaysTeamColoredLaser = Class'IRPR'.default.bAlwaysTeamColoredLaser;
			IRPRifle.default.defaultLaserColor = Class'IRPR'.default.defaultLaserColor;
			IRPRifle.defaultLaserColor = Class'IRPR'.default.defaultLaserColor;
			IRPRifle.default.enableZoomIR = Class'IRPR'.default.enableZoomIR;
			IRPRifle.enableZoomIR = Class'IRPR'.default.enableZoomIR;
			IRPRifle.default.enableZoomGreenIRGlass = Class'IRPR'.default.enableZoomGreenIRGlass;
			IRPRifle.enableZoomGreenIRGlass = Class'IRPR'.default.enableZoomGreenIRGlass;
			IRPRifle.default.enableTraceBeam = Class'IRPR'.default.enableTraceBeam;
			IRPRifle.enableTraceBeam = Class'IRPR'.default.enableTraceBeam;
			
			IRPRifle.default.enableOversurrection = Class'IRPR'.default.enableOversurrection;
			IRPRifle.enableOversurrection = Class'IRPR'.default.enableOversurrection;
			IRPRifle.default.OversurrectionLifeTime = Class'IRPR'.default.OversurrectionLifeTime;
			IRPRifle.OversurrectionLifeTime = Class'IRPR'.default.OversurrectionLifeTime;
			IRPRifle.default.OversurrectionTurretRotRate = Class'IRPR'.default.OversurrectionTurretRotRate;
			IRPRifle.OversurrectionTurretRotRate = Class'IRPR'.default.OversurrectionTurretRotRate;
			IRPRifle.default.OversurrectionFireCycleRate = Class'IRPR'.default.OversurrectionFireCycleRate;
			IRPRifle.OversurrectionFireCycleRate = Class'IRPR'.default.OversurrectionFireCycleRate;
			IRPRifle.default.OversurrectionLaserPrepareTime = Class'IRPR'.default.OversurrectionLaserPrepareTime;
			IRPRifle.OversurrectionLaserPrepareTime = Class'IRPR'.default.OversurrectionLaserPrepareTime;
			IRPRifle.default.OversurrectionLaserCooldownTime = Class'IRPR'.default.OversurrectionLaserCooldownTime;
			IRPRifle.OversurrectionLaserCooldownTime = Class'IRPR'.default.OversurrectionLaserCooldownTime;
			IRPRifle.default.OversurrectionLaserFireMaxTime = Class'IRPR'.default.OversurrectionLaserFireMaxTime;
			IRPRifle.OversurrectionLaserFireMaxTime = Class'IRPR'.default.OversurrectionLaserFireMaxTime;
			IRPRifle.default.OversurrectionScanEnemiesRadius = Class'IRPR'.default.OversurrectionScanEnemiesRadius;
			IRPRifle.OversurrectionScanEnemiesRadius = Class'IRPR'.default.OversurrectionScanEnemiesRadius;
			IRPRifle.default.OversurrectionRangedEnemiesPeriph = Class'IRPR'.default.OversurrectionRangedEnemiesPeriph;
			IRPRifle.OversurrectionRangedEnemiesPeriph = Class'IRPR'.default.OversurrectionRangedEnemiesPeriph;
			IRPRifle.default.OversurrectionAttackMinPeriph = Class'IRPR'.default.OversurrectionAttackMinPeriph;
			IRPRifle.OversurrectionAttackMinPeriph = Class'IRPR'.default.OversurrectionAttackMinPeriph;
			IRPRifle.default.OversurrectionLaserDamage = Class'IRPR'.default.OversurrectionLaserDamage;
			IRPRifle.OversurrectionLaserDamage = Class'IRPR'.default.OversurrectionLaserDamage;
			IRPRifle.default.OversurrectionMaxWTTraces = Class'IRPR'.default.OversurrectionMaxWTTraces;
			IRPRifle.OversurrectionMaxWTTraces = Class'IRPR'.default.OversurrectionMaxWTTraces;
			IRPRifle.default.OversurrectionMaxWTTracePrecision = Class'IRPR'.default.OversurrectionMaxWTTracePrecision;
			IRPRifle.OversurrectionMaxWTTracePrecision = Class'IRPR'.default.OversurrectionMaxWTTracePrecision;
			IRPRifle.default.OversurrectionMaxTraceRange = Class'IRPR'.default.OversurrectionMaxTraceRange;
			IRPRifle.OversurrectionMaxTraceRange = Class'IRPR'.default.OversurrectionMaxTraceRange;
			IRPRifle.default.OversurrectionMaxWTTraceDepth = Class'IRPR'.default.OversurrectionMaxWTTraceDepth;
			IRPRifle.OversurrectionMaxWTTraceDepth = Class'IRPR'.default.OversurrectionMaxWTTraceDepth;
			IRPRifle.default.OversurrectionStopFireOdds = Class'IRPR'.default.OversurrectionStopFireOdds;
			IRPRifle.OversurrectionStopFireOdds = Class'IRPR'.default.OversurrectionStopFireOdds;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.IRPRProfileA[i].enableWallThroughZoom = Class'IRPR'.default.enableWallThroughZoom;
	default.IRPRProfileA[i].enableScopeTeamMarkers = Class'IRPR'.default.enableScopeTeamMarkers;
	default.IRPRProfileA[i].enableScopeEnemyMarkers = Class'IRPR'.default.enableScopeEnemyMarkers;
	default.IRPRProfileA[i].enableScopeFriendlyMarkers = Class'IRPR'.default.enableScopeFriendlyMarkers;
	default.IRPRProfileA[i].bPlayersAlwaysRelevant = Class'IRPR'.default.bPlayersAlwaysRelevant;
	
	default.IRPRProfileB[i].bReduceDamageByWallthrough = Class'IRPR'.default.bReduceDamageByWallthrough;
	default.IRPRProfileB[i].MaxWallthroughPrecision = Class'IRPR'.default.MaxWallthroughPrecision;
	default.IRPRProfileB[i].MaxWallthroughDepth = Class'IRPR'.default.MaxWallthroughDepth;
	default.IRPRProfileB[i].MaxWallthroughShots = Class'IRPR'.default.MaxWallthroughShots;
	
	default.IRPRProfileC[i].HeadShotDmg = Class'IRPR'.default.HeadShotDmg;
	default.IRPRProfileC[i].ZoomInViewRange = Class'IRPR'.default.ZoomInViewRange;
	default.IRPRProfileC[i].ZoomOutViewRange = Class'IRPR'.default.ZoomOutViewRange;
	
	default.IRPRProfileD[i].enableTeamColoredLaser = Class'IRPR'.default.enableTeamColoredLaser;
	default.IRPRProfileD[i].bAlwaysTeamColoredLaser = Class'IRPR'.default.bAlwaysTeamColoredLaser;
	default.IRPRProfileD[i].defaultLaserColor = Class'IRPR'.default.defaultLaserColor;
	default.IRPRProfileD[i].enableZoomIR = Class'IRPR'.default.enableZoomIR;
	default.IRPRProfileD[i].enableZoomGreenIRGlass = Class'IRPR'.default.enableZoomGreenIRGlass;
	default.IRPRProfileD[i].enableTraceBeam = Class'IRPR'.default.enableTraceBeam;
	
	default.IRPROversProfileA[i].enableOversurrection = Class'IRPR'.default.enableOversurrection;
	default.IRPROversProfileA[i].OversurrectionLifeTime = Class'IRPR'.default.OversurrectionLifeTime;
	default.IRPROversProfileA[i].OversurrectionTurretRotRate = Class'IRPR'.default.OversurrectionTurretRotRate;
	default.IRPROversProfileA[i].OversurrectionFireCycleRate = Class'IRPR'.default.OversurrectionFireCycleRate;
	
	default.IRPROversProfileB[i].OversurrectionLaserPrepareTime = Class'IRPR'.default.OversurrectionLaserPrepareTime;
	default.IRPROversProfileB[i].OversurrectionLaserCooldownTime = Class'IRPR'.default.OversurrectionLaserCooldownTime;
	default.IRPROversProfileB[i].OversurrectionLaserFireMaxTime = Class'IRPR'.default.OversurrectionLaserFireMaxTime;
	
	default.IRPROversProfileC[i].OversurrectionScanEnemiesRadius = Class'IRPR'.default.OversurrectionScanEnemiesRadius;
	default.IRPROversProfileC[i].OversurrectionRangedEnemiesPeriph = Class'IRPR'.default.OversurrectionRangedEnemiesPeriph;
	default.IRPROversProfileC[i].OversurrectionAttackMinPeriph = Class'IRPR'.default.OversurrectionAttackMinPeriph;
	
	default.IRPROversProfileD[i].OversurrectionLaserDamage = Class'IRPR'.default.OversurrectionLaserDamage;
	default.IRPROversProfileD[i].OversurrectionMaxWTTraces = Class'IRPR'.default.OversurrectionMaxWTTraces;
	default.IRPROversProfileD[i].OversurrectionMaxWTTracePrecision = Class'IRPR'.default.OversurrectionMaxWTTracePrecision;
	
	default.IRPROversProfileE[i].OversurrectionMaxTraceRange = Class'IRPR'.default.OversurrectionMaxTraceRange;
	default.IRPROversProfileE[i].OversurrectionMaxWTTraceDepth = Class'IRPR'.default.OversurrectionMaxWTTraceDepth;
	default.IRPROversProfileE[i].OversurrectionStopFireOdds = Class'IRPR'.default.OversurrectionStopFireOdds;
	
	StaticSaveConfig();
}


defaultproperties
{
	IRPRProfileA(0)=(enableWallThroughZoom=False,enableScopeTeamMarkers=True,enableScopeEnemyMarkers=False,enableScopeFriendlyMarkers=True,bPlayersAlwaysRelevant=False)
	IRPRProfileB(0)=(bReduceDamageByWallthrough=True,MaxWallthroughPrecision=10,MaxWallthroughDepth=128.000000,MaxWallthroughShots=0)
	IRPRProfileC(0)=(HeadShotDmg=125,ZoomInViewRange=10000.000000,ZoomOutViewRange=750.000000)
	IRPRProfileD(0)=(enableTeamColoredLaser=True,bAlwaysTeamColoredLaser=False,defaultLaserColor=0,enableZoomIR=False,enableZoomGreenIRGlass=False,enableTraceBeam=True)
	IRPROversProfileA(0)=(enableOversurrection=True,OversurrectionLifeTime=30.000000,OversurrectionTurretRotRate=6500.000000,OversurrectionFireCycleRate=1.000000)
	IRPROversProfileB(0)=(OversurrectionLaserPrepareTime=3.000000,OversurrectionLaserCooldownTime=4.500000,OversurrectionLaserFireMaxTime=3.5000000)
	IRPROversProfileC(0)=(OversurrectionScanEnemiesRadius=25000.000000,OversurrectionRangedEnemiesPeriph=0.700000,OversurrectionAttackMinPeriph=0.900000)
	IRPROversProfileD(0)=(OversurrectionLaserDamage=200,OversurrectionMaxWTTraces=1,OversurrectionMaxWTTracePrecision=32)
	IRPROversProfileE(0)=(OversurrectionMaxTraceRange=25000.000000,OversurrectionMaxWTTraceDepth=256.000000,OversurrectionStopFireOdds=0.750000)
	
	IRPRProfileA(1)=(enableWallThroughZoom=True,enableScopeTeamMarkers=True,enableScopeEnemyMarkers=False,enableScopeFriendlyMarkers=True,bPlayersAlwaysRelevant=False)
	IRPRProfileB(1)=(bReduceDamageByWallthrough=True,MaxWallthroughPrecision=10,MaxWallthroughDepth=192.000000,MaxWallthroughShots=1)
	IRPRProfileC(1)=(HeadShotDmg=125,ZoomInViewRange=12000.000000,ZoomOutViewRange=1500.000000)
	IRPRProfileD(1)=(enableTeamColoredLaser=True,bAlwaysTeamColoredLaser=False,defaultLaserColor=0,enableZoomIR=True,enableZoomGreenIRGlass=False,enableTraceBeam=True)
	IRPROversProfileA(1)=(enableOversurrection=True,OversurrectionLifeTime=35.000000,OversurrectionTurretRotRate=6500.000000,OversurrectionFireCycleRate=1.000000)
	IRPROversProfileB(1)=(OversurrectionLaserPrepareTime=2.500000,OversurrectionLaserCooldownTime=3.500000,OversurrectionLaserFireMaxTime=5.000000)
	IRPROversProfileC(1)=(OversurrectionScanEnemiesRadius=30000.000000,OversurrectionRangedEnemiesPeriph=0.500000,OversurrectionAttackMinPeriph=0.900000)
	IRPROversProfileD(1)=(OversurrectionLaserDamage=500,OversurrectionMaxWTTraces=3,OversurrectionMaxWTTracePrecision=16)
	IRPROversProfileE(1)=(OversurrectionMaxTraceRange=30000.000000,OversurrectionMaxWTTraceDepth=512.000000,OversurrectionStopFireOdds=0.450000)

	IRPRProfileA(2)=(enableWallThroughZoom=True,enableScopeTeamMarkers=True,enableScopeEnemyMarkers=False,enableScopeFriendlyMarkers=True,bPlayersAlwaysRelevant=False)
	IRPRProfileB(2)=(bReduceDamageByWallthrough=False,MaxWallthroughPrecision=10,MaxWallthroughDepth=256.000000,MaxWallthroughShots=5)
	IRPRProfileC(2)=(HeadShotDmg=250,ZoomInViewRange=18000.000000,ZoomOutViewRange=2500.000000)
	IRPRProfileD(2)=(enableTeamColoredLaser=True,bAlwaysTeamColoredLaser=False,defaultLaserColor=0,enableZoomIR=True,enableZoomGreenIRGlass=True,enableTraceBeam=True)
	IRPROversProfileA(2)=(enableOversurrection=True,OversurrectionLifeTime=45.000000,OversurrectionTurretRotRate=6500.000000,OversurrectionFireCycleRate=1.000000)
	IRPROversProfileB(2)=(OversurrectionLaserPrepareTime=2.000000,OversurrectionLaserCooldownTime=3.500000,OversurrectionLaserFireMaxTime=6.000000)
	IRPROversProfileC(2)=(OversurrectionScanEnemiesRadius=40000.000000,OversurrectionRangedEnemiesPeriph=0.500000,OversurrectionAttackMinPeriph=0.900000)
	IRPROversProfileD(2)=(OversurrectionLaserDamage=1000,OversurrectionMaxWTTraces=5,OversurrectionMaxWTTracePrecision=16)
	IRPROversProfileE(2)=(OversurrectionMaxTraceRange=40000.000000,OversurrectionMaxWTTraceDepth=1024.000000,OversurrectionStopFireOdds=0.250000)
	
	IRPRProfileA(3)=(enableWallThroughZoom=True,enableScopeTeamMarkers=False,enableScopeEnemyMarkers=False,enableScopeFriendlyMarkers=False,bPlayersAlwaysRelevant=False)
	IRPRProfileB(3)=(bReduceDamageByWallthrough=True,MaxWallthroughPrecision=10,MaxWallthroughDepth=192.000000,MaxWallthroughShots=1)
	IRPRProfileC(3)=(HeadShotDmg=250,ZoomInViewRange=15000.000000,ZoomOutViewRange=2000.000000)
	IRPRProfileD(3)=(enableTeamColoredLaser=False,bAlwaysTeamColoredLaser=False,defaultLaserColor=0,enableZoomIR=True,enableZoomGreenIRGlass=True,enableTraceBeam=True)
	IRPROversProfileA(3)=(enableOversurrection=True,OversurrectionLifeTime=60.000000,OversurrectionTurretRotRate=6500.000000,OversurrectionFireCycleRate=1.000000)
	IRPROversProfileB(3)=(OversurrectionLaserPrepareTime=2.000000,OversurrectionLaserCooldownTime=3.500000,OversurrectionLaserFireMaxTime=6.000000)
	IRPROversProfileC(3)=(OversurrectionScanEnemiesRadius=40000.000000,OversurrectionRangedEnemiesPeriph=0.500000,OversurrectionAttackMinPeriph=0.900000)
	IRPROversProfileD(3)=(OversurrectionLaserDamage=3000,OversurrectionMaxWTTraces=5,OversurrectionMaxWTTracePrecision=16)
	IRPROversProfileE(3)=(OversurrectionMaxTraceRange=40000.000000,OversurrectionMaxWTTraceDepth=1024.000000,OversurrectionStopFireOdds=0.250000)
	
	IRPRProfileA(4)=(enableWallThroughZoom=True,enableScopeTeamMarkers=False,enableScopeEnemyMarkers=False,enableScopeFriendlyMarkers=False,bPlayersAlwaysRelevant=False)
	IRPRProfileB(4)=(bReduceDamageByWallthrough=False,MaxWallthroughPrecision=10,MaxWallthroughDepth=256.000000,MaxWallthroughShots=10)
	IRPRProfileC(4)=(HeadShotDmg=350,ZoomInViewRange=22000.000000,ZoomOutViewRange=3000.000000)
	IRPRProfileD(4)=(enableTeamColoredLaser=False,bAlwaysTeamColoredLaser=False,defaultLaserColor=0,enableZoomIR=True,enableZoomGreenIRGlass=True,enableTraceBeam=True)
	IRPROversProfileA(4)=(enableOversurrection=True,OversurrectionLifeTime=75.000000,OversurrectionTurretRotRate=8000.000000,OversurrectionFireCycleRate=0.500000)
	IRPROversProfileB(4)=(OversurrectionLaserPrepareTime=1.000000,OversurrectionLaserCooldownTime=2.500000,OversurrectionLaserFireMaxTime=8.500000)
	IRPROversProfileC(4)=(OversurrectionScanEnemiesRadius=40000.000000,OversurrectionRangedEnemiesPeriph=0.400000,OversurrectionAttackMinPeriph=0.900000)
	IRPROversProfileD(4)=(OversurrectionLaserDamage=10000,OversurrectionMaxWTTraces=7,OversurrectionMaxWTTracePrecision=16)
	IRPROversProfileE(4)=(OversurrectionMaxTraceRange=40000.000000,OversurrectionMaxWTTraceDepth=1280.000000,OversurrectionStopFireOdds=0.150000)
	
	IRPRProfileA(5)=(enableWallThroughZoom=True,enableScopeTeamMarkers=True,enableScopeEnemyMarkers=False,enableScopeFriendlyMarkers=True,bPlayersAlwaysRelevant=False)
	IRPRProfileB(5)=(bReduceDamageByWallthrough=False,MaxWallthroughPrecision=10,MaxWallthroughDepth=256.000000,MaxWallthroughShots=5)
	IRPRProfileC(5)=(HeadShotDmg=250,ZoomInViewRange=18000.000000,ZoomOutViewRange=2500.000000)
	IRPRProfileD(5)=(enableTeamColoredLaser=True,bAlwaysTeamColoredLaser=False,defaultLaserColor=0,enableZoomIR=True,enableZoomGreenIRGlass=True,enableTraceBeam=True)
	IRPROversProfileA(5)=(enableOversurrection=True,OversurrectionLifeTime=45.000000,OversurrectionTurretRotRate=6500.000000,OversurrectionFireCycleRate=1.000000)
	IRPROversProfileB(5)=(OversurrectionLaserPrepareTime=2.000000,OversurrectionLaserCooldownTime=3.500000,OversurrectionLaserFireMaxTime=6.000000)
	IRPROversProfileC(5)=(OversurrectionScanEnemiesRadius=40000.000000,OversurrectionRangedEnemiesPeriph=0.500000,OversurrectionAttackMinPeriph=0.900000)
	IRPROversProfileD(5)=(OversurrectionLaserDamage=1000,OversurrectionMaxWTTraces=5,OversurrectionMaxWTTracePrecision=16)
	IRPROversProfileE(5)=(OversurrectionMaxTraceRange=40000.000000,OversurrectionMaxWTTraceDepth=1024.000000,OversurrectionStopFireOdds=0.250000)
	
	IRPRProfileA(6)=(enableWallThroughZoom=True,enableScopeTeamMarkers=True,enableScopeEnemyMarkers=False,enableScopeFriendlyMarkers=True,bPlayersAlwaysRelevant=False)
	IRPRProfileB(6)=(bReduceDamageByWallthrough=False,MaxWallthroughPrecision=10,MaxWallthroughDepth=256.000000,MaxWallthroughShots=5)
	IRPRProfileC(6)=(HeadShotDmg=250,ZoomInViewRange=18000.000000,ZoomOutViewRange=2500.000000)
	IRPRProfileD(6)=(enableTeamColoredLaser=True,bAlwaysTeamColoredLaser=False,defaultLaserColor=0,enableZoomIR=True,enableZoomGreenIRGlass=True,enableTraceBeam=True)
	IRPROversProfileA(6)=(enableOversurrection=True,OversurrectionLifeTime=45.000000,OversurrectionTurretRotRate=6500.000000,OversurrectionFireCycleRate=1.000000)
	IRPROversProfileB(6)=(OversurrectionLaserPrepareTime=2.000000,OversurrectionLaserCooldownTime=3.500000,OversurrectionLaserFireMaxTime=6.000000)
	IRPROversProfileC(6)=(OversurrectionScanEnemiesRadius=40000.000000,OversurrectionRangedEnemiesPeriph=0.500000,OversurrectionAttackMinPeriph=0.900000)
	IRPROversProfileD(6)=(OversurrectionLaserDamage=1000,OversurrectionMaxWTTraces=5,OversurrectionMaxWTTracePrecision=16)
	IRPROversProfileE(6)=(OversurrectionMaxTraceRange=40000.000000,OversurrectionMaxWTTraceDepth=1024.000000,OversurrectionStopFireOdds=0.250000)
	
	IRPRProfileA(7)=(enableWallThroughZoom=True,enableScopeTeamMarkers=True,enableScopeEnemyMarkers=False,enableScopeFriendlyMarkers=True,bPlayersAlwaysRelevant=False)
	IRPRProfileB(7)=(bReduceDamageByWallthrough=False,MaxWallthroughPrecision=10,MaxWallthroughDepth=256.000000,MaxWallthroughShots=5)
	IRPRProfileC(7)=(HeadShotDmg=250,ZoomInViewRange=18000.000000,ZoomOutViewRange=2500.000000)
	IRPRProfileD(7)=(enableTeamColoredLaser=True,bAlwaysTeamColoredLaser=False,defaultLaserColor=0,enableZoomIR=True,enableZoomGreenIRGlass=True,enableTraceBeam=True)
	IRPROversProfileA(7)=(enableOversurrection=True,OversurrectionLifeTime=45.000000,OversurrectionTurretRotRate=6500.000000,OversurrectionFireCycleRate=1.000000)
	IRPROversProfileB(7)=(OversurrectionLaserPrepareTime=2.000000,OversurrectionLaserCooldownTime=3.500000,OversurrectionLaserFireMaxTime=6.000000)
	IRPROversProfileC(7)=(OversurrectionScanEnemiesRadius=40000.000000,OversurrectionRangedEnemiesPeriph=0.500000,OversurrectionAttackMinPeriph=0.900000)
	IRPROversProfileD(7)=(OversurrectionLaserDamage=1000,OversurrectionMaxWTTraces=5,OversurrectionMaxWTTracePrecision=16)
	IRPROversProfileE(7)=(OversurrectionMaxTraceRange=40000.000000,OversurrectionMaxWTTraceDepth=1024.000000,OversurrectionStopFireOdds=0.250000)
}