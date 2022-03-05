//////////////////////////////////////////////////////////////
//				Feralidragon (25-09-2012)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecutionerGameplayProfile expands NWProfile config(NWProfilesCfg);

struct TheExecutionerStructA
{
	var() bool bEnableHeadShot, bFireMixedMoves, bChargingAltFire, bChargingKillMultiple, bChargeTriggerOnTouch;
};
var() config TheExecutionerStructA TheExecutionerProfileA[8];

struct TheExecutionerStructB
{
	var() int HeadShotDamage, ChargeAttackDamage, ChargeOwnDamage, ChargeOwnMaxMomentum;
};
var() config TheExecutionerStructB TheExecutionerProfileB[8];

struct TheExecutionerStructC
{
	var() float ChargeTotalTime, ChargeAttackMaxRange, ChargeOwnDamageMaxDist;
};
var() config TheExecutionerStructC TheExecutionerProfileC[8];

struct TheExecOverStruct
{
	var() bool enableOversurrection;
	var() float OversurrectionLifeTime;
	var() int OversurrectiveAttackDmgA, OversurrectiveAttackDmgB, OversurrectiveAttackDmgC;
};
var() config TheExecOverStruct TheExecOversProfile[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local TheExecutioner tEx;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'TheExecutioner'.default.bEnableHeadShot = default.TheExecutionerProfileA[i].bEnableHeadShot;
	Class'TheExecutioner'.default.bFireMixedMoves = default.TheExecutionerProfileA[i].bFireMixedMoves;
	Class'TheExecutioner'.default.bChargingAltFire = default.TheExecutionerProfileA[i].bChargingAltFire;
	Class'TheExecutioner'.default.bChargingKillMultiple = default.TheExecutionerProfileA[i].bChargingKillMultiple;
	Class'TheExecutioner'.default.bChargeTriggerOnTouch = default.TheExecutionerProfileA[i].bChargeTriggerOnTouch;
	
	Class'TheExecutioner'.default.HeadShotDamage = default.TheExecutionerProfileB[i].HeadShotDamage;
	Class'TheExecutioner'.default.ChargeAttackDamage = default.TheExecutionerProfileB[i].ChargeAttackDamage;
	Class'TheExecutioner'.default.ChargeOwnDamage = default.TheExecutionerProfileB[i].ChargeOwnDamage;
	Class'TheExecutioner'.default.ChargeOwnMaxMomentum = default.TheExecutionerProfileB[i].ChargeOwnMaxMomentum;
	
	Class'TheExecutioner'.default.ChargeTotalTime = default.TheExecutionerProfileC[i].ChargeTotalTime;
	Class'TheExecutioner'.default.ChargeAttackMaxRange = default.TheExecutionerProfileC[i].ChargeAttackMaxRange;
	Class'TheExecutioner'.default.ChargeOwnDamageMaxDist = default.TheExecutionerProfileC[i].ChargeOwnDamageMaxDist;
	
	Class'TheExecutioner'.default.enableOversurrection = default.TheExecOversProfile[i].enableOversurrection;
	Class'TheExecutioner'.default.OversurrectionLifeTime = default.TheExecOversProfile[i].OversurrectionLifeTime;
	Class'TheExecutioner'.default.OversurrectiveAttackDmgA = default.TheExecOversProfile[i].OversurrectiveAttackDmgA;
	Class'TheExecutioner'.default.OversurrectiveAttackDmgB = default.TheExecOversProfile[i].OversurrectiveAttackDmgB;
	Class'TheExecutioner'.default.OversurrectiveAttackDmgC = default.TheExecOversProfile[i].OversurrectiveAttackDmgC;
	
	if (Lvl == None)
		Class'TheExecutioner'.static.StaticSaveConfig();
		
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'TheExecutioner', tEx)
		{
			tEx.default.bEnableHeadShot = Class'TheExecutioner'.default.bEnableHeadShot;
			tEx.bEnableHeadShot = Class'TheExecutioner'.default.bEnableHeadShot;
			tEx.default.bFireMixedMoves = Class'TheExecutioner'.default.bFireMixedMoves;
			tEx.bFireMixedMoves = Class'TheExecutioner'.default.bFireMixedMoves;
			tEx.default.bChargingAltFire = Class'TheExecutioner'.default.bChargingAltFire;
			tEx.bChargingAltFire = Class'TheExecutioner'.default.bChargingAltFire;
			tEx.default.bChargingKillMultiple = Class'TheExecutioner'.default.bChargingKillMultiple;
			tEx.bChargingKillMultiple = Class'TheExecutioner'.default.bChargingKillMultiple;
			tEx.default.bChargeTriggerOnTouch = Class'TheExecutioner'.default.bChargeTriggerOnTouch;
			tEx.bChargeTriggerOnTouch = Class'TheExecutioner'.default.bChargeTriggerOnTouch;

			tEx.default.HeadShotDamage = Class'TheExecutioner'.default.HeadShotDamage;
			tEx.HeadShotDamage = Class'TheExecutioner'.default.HeadShotDamage;
			tEx.default.ChargeAttackDamage = Class'TheExecutioner'.default.ChargeAttackDamage;
			tEx.ChargeAttackDamage = Class'TheExecutioner'.default.ChargeAttackDamage;
			tEx.default.ChargeOwnDamage = Class'TheExecutioner'.default.ChargeOwnDamage;
			tEx.ChargeOwnDamage = Class'TheExecutioner'.default.ChargeOwnDamage;
			tEx.default.ChargeOwnMaxMomentum = Class'TheExecutioner'.default.ChargeOwnMaxMomentum;
			tEx.ChargeOwnMaxMomentum = Class'TheExecutioner'.default.ChargeOwnMaxMomentum;

			tEx.default.ChargeTotalTime = Class'TheExecutioner'.default.ChargeTotalTime;
			tEx.ChargeTotalTime = Class'TheExecutioner'.default.ChargeTotalTime;
			tEx.default.ChargeAttackMaxRange = Class'TheExecutioner'.default.ChargeAttackMaxRange;
			tEx.ChargeAttackMaxRange = Class'TheExecutioner'.default.ChargeAttackMaxRange;
			tEx.default.ChargeOwnDamageMaxDist = Class'TheExecutioner'.default.ChargeOwnDamageMaxDist;
			tEx.ChargeOwnDamageMaxDist = Class'TheExecutioner'.default.ChargeOwnDamageMaxDist;
			
			tEx.default.enableOversurrection = Class'TheExecutioner'.default.enableOversurrection;
			tEx.enableOversurrection = Class'TheExecutioner'.default.enableOversurrection;
			tEx.default.OversurrectionLifeTime = Class'TheExecutioner'.default.OversurrectionLifeTime;
			tEx.OversurrectionLifeTime = Class'TheExecutioner'.default.OversurrectionLifeTime;
			tEx.default.OversurrectiveAttackDmgA = Class'TheExecutioner'.default.OversurrectiveAttackDmgA;
			tEx.OversurrectiveAttackDmgA = Class'TheExecutioner'.default.OversurrectiveAttackDmgA;
			tEx.default.OversurrectiveAttackDmgB = Class'TheExecutioner'.default.OversurrectiveAttackDmgB;
			tEx.OversurrectiveAttackDmgB = Class'TheExecutioner'.default.OversurrectiveAttackDmgB;
			tEx.default.OversurrectiveAttackDmgC = Class'TheExecutioner'.default.OversurrectiveAttackDmgC;
			tEx.OversurrectiveAttackDmgC = Class'TheExecutioner'.default.OversurrectiveAttackDmgC;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.TheExecutionerProfileA[i].bEnableHeadShot = Class'TheExecutioner'.default.bEnableHeadShot;
	default.TheExecutionerProfileA[i].bFireMixedMoves = Class'TheExecutioner'.default.bFireMixedMoves;
	default.TheExecutionerProfileA[i].bChargingAltFire = Class'TheExecutioner'.default.bChargingAltFire;
	default.TheExecutionerProfileA[i].bChargingKillMultiple = Class'TheExecutioner'.default.bChargingKillMultiple;
	default.TheExecutionerProfileA[i].bChargeTriggerOnTouch = Class'TheExecutioner'.default.bChargeTriggerOnTouch;
	
	default.TheExecutionerProfileB[i].HeadShotDamage = Class'TheExecutioner'.default.HeadShotDamage;
	default.TheExecutionerProfileB[i].ChargeAttackDamage = Class'TheExecutioner'.default.ChargeAttackDamage;
	default.TheExecutionerProfileB[i].ChargeOwnDamage = Class'TheExecutioner'.default.ChargeOwnDamage;
	default.TheExecutionerProfileB[i].ChargeOwnMaxMomentum = Class'TheExecutioner'.default.ChargeOwnMaxMomentum;
	
	default.TheExecutionerProfileC[i].ChargeTotalTime = Class'TheExecutioner'.default.ChargeTotalTime;
	default.TheExecutionerProfileC[i].ChargeAttackMaxRange = Class'TheExecutioner'.default.ChargeAttackMaxRange;
	default.TheExecutionerProfileC[i].ChargeOwnDamageMaxDist = Class'TheExecutioner'.default.ChargeOwnDamageMaxDist;
	
	default.TheExecOversProfile[i].enableOversurrection = Class'TheExecutioner'.default.enableOversurrection;
	default.TheExecOversProfile[i].OversurrectionLifeTime = Class'TheExecutioner'.default.OversurrectionLifeTime;
	default.TheExecOversProfile[i].OversurrectiveAttackDmgA = Class'TheExecutioner'.default.OversurrectiveAttackDmgA;
	default.TheExecOversProfile[i].OversurrectiveAttackDmgB = Class'TheExecutioner'.default.OversurrectiveAttackDmgB;
	default.TheExecOversProfile[i].OversurrectiveAttackDmgC = Class'TheExecutioner'.default.OversurrectiveAttackDmgC;
	
	StaticSaveConfig();
}


defaultproperties
{
	TheExecutionerProfileA(1)=(bEnableHeadshot=True,bFireMixedMoves=True,bChargingAltFire=True,bChargingKillMultiple=False,bChargeTriggerOnTouch=False)
	TheExecutionerProfileB(1)=(HeadShotDamage=125,ChargeAttackDamage=100,ChargeOwnDamage=55,ChargeOwnMaxMomentum=69000)
	TheExecutionerProfileC(1)=(ChargeTotalTime=2.750000,ChargeAttackMaxRange=70.000000,ChargeOwnDamageMaxDist=80.000000)
	TheExecOversProfile(0)=(enableOversurrection=True,OversurrectionLifeTime=10.000000,OversurrectiveAttackDmgA=500,OversurrectiveAttackDmgB=250,OversurrectiveAttackDmgC=1000)

	TheExecutionerProfileA(1)=(bEnableHeadshot=True,bFireMixedMoves=True,bChargingAltFire=True,bChargingKillMultiple=False,bChargeTriggerOnTouch=True)
	TheExecutionerProfileB(1)=(HeadShotDamage=150,ChargeAttackDamage=150,ChargeOwnDamage=45,ChargeOwnMaxMomentum=69000)
	TheExecutionerProfileC(1)=(ChargeTotalTime=2.250000,ChargeAttackMaxRange=150.000000,ChargeOwnDamageMaxDist=70.000000)
	TheExecOversProfile(1)=(enableOversurrection=True,OversurrectionLifeTime=16.000000,OversurrectiveAttackDmgA=1000,OversurrectiveAttackDmgB=500,OversurrectiveAttackDmgC=5000)
	
	TheExecutionerProfileA(2)=(bEnableHeadshot=True,bFireMixedMoves=True,bChargingAltFire=True,bChargingKillMultiple=True,bChargeTriggerOnTouch=True)
	TheExecutionerProfileB(2)=(HeadShotDamage=200,ChargeAttackDamage=300,ChargeOwnDamage=35,ChargeOwnMaxMomentum=69000)
	TheExecutionerProfileC(2)=(ChargeTotalTime=2.000000,ChargeAttackMaxRange=165.000000,ChargeOwnDamageMaxDist=63.000000)
	TheExecOversProfile(2)=(enableOversurrection=True,OversurrectionLifeTime=22.000000,OversurrectiveAttackDmgA=2000,OversurrectiveAttackDmgB=1000,OversurrectiveAttackDmgC=10000)
	
	TheExecutionerProfileA(3)=(bEnableHeadshot=True,bFireMixedMoves=True,bChargingAltFire=True,bChargingKillMultiple=True,bChargeTriggerOnTouch=True)
	TheExecutionerProfileB(3)=(HeadShotDamage=300,ChargeAttackDamage=500,ChargeOwnDamage=35,ChargeOwnMaxMomentum=69000)
	TheExecutionerProfileC(3)=(ChargeTotalTime=2.000000,ChargeAttackMaxRange=165.000000,ChargeOwnDamageMaxDist=63.000000)
	TheExecOversProfile(3)=(enableOversurrection=True,OversurrectionLifeTime=25.000000,OversurrectiveAttackDmgA=1000,OversurrectiveAttackDmgB=500,OversurrectiveAttackDmgC=6000)
	
	TheExecutionerProfileA(4)=(bEnableHeadshot=True,bFireMixedMoves=True,bChargingAltFire=True,bChargingKillMultiple=True,bChargeTriggerOnTouch=True)
	TheExecutionerProfileB(4)=(HeadShotDamage=500,ChargeAttackDamage=1000,ChargeOwnDamage=25,ChargeOwnMaxMomentum=120000)
	TheExecutionerProfileC(4)=(ChargeTotalTime=2.000000,ChargeAttackMaxRange=250.000000,ChargeOwnDamageMaxDist=70.000000)
	TheExecOversProfile(4)=(enableOversurrection=True,OversurrectionLifeTime=35.000000,OversurrectiveAttackDmgA=5000,OversurrectiveAttackDmgB=2500,OversurrectiveAttackDmgC=30000)
	
	TheExecutionerProfileA(5)=(bEnableHeadshot=True,bFireMixedMoves=True,bChargingAltFire=True,bChargingKillMultiple=True,bChargeTriggerOnTouch=True)
	TheExecutionerProfileB(5)=(HeadShotDamage=200,ChargeAttackDamage=300,ChargeOwnDamage=35,ChargeOwnMaxMomentum=69000)
	TheExecutionerProfileC(5)=(ChargeTotalTime=2.000000,ChargeAttackMaxRange=165.000000,ChargeOwnDamageMaxDist=63.000000)
	TheExecOversProfile(5)=(enableOversurrection=True,OversurrectionLifeTime=22.000000,OversurrectiveAttackDmgA=2000,OversurrectiveAttackDmgB=1000,OversurrectiveAttackDmgC=10000)
	
	TheExecutionerProfileA(6)=(bEnableHeadshot=True,bFireMixedMoves=True,bChargingAltFire=True,bChargingKillMultiple=True,bChargeTriggerOnTouch=True)
	TheExecutionerProfileB(6)=(HeadShotDamage=200,ChargeAttackDamage=300,ChargeOwnDamage=35,ChargeOwnMaxMomentum=69000)
	TheExecutionerProfileC(6)=(ChargeTotalTime=2.000000,ChargeAttackMaxRange=165.000000,ChargeOwnDamageMaxDist=63.000000)
	TheExecOversProfile(6)=(enableOversurrection=True,OversurrectionLifeTime=22.000000,OversurrectiveAttackDmgA=2000,OversurrectiveAttackDmgB=1000,OversurrectiveAttackDmgC=10000)
	
	TheExecutionerProfileA(7)=(bEnableHeadshot=True,bFireMixedMoves=True,bChargingAltFire=True,bChargingKillMultiple=True,bChargeTriggerOnTouch=True)
	TheExecutionerProfileB(7)=(HeadShotDamage=200,ChargeAttackDamage=300,ChargeOwnDamage=35,ChargeOwnMaxMomentum=69000)
	TheExecutionerProfileC(7)=(ChargeTotalTime=2.000000,ChargeAttackMaxRange=165.000000,ChargeOwnDamageMaxDist=63.000000)
	TheExecOversProfile(7)=(enableOversurrection=True,OversurrectionLifeTime=22.000000,OversurrectiveAttackDmgA=2000,OversurrectiveAttackDmgB=1000,OversurrectiveAttackDmgC=10000)
}