//////////////////////////////////////////////////////////////
//				Feralidragon (12-09-2012)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WREGameplayProfile expands NWProfile config(NWProfilesCfg);

struct WREStruct
{
	var() int GrenadeAmmoConsumption, HeadShotDmg;
	var() float RunningAimError, WalkingAimError, CrouchingAimError;
};
var() config WREStruct WREProfile[8];

struct WREOversStruct
{
	var() bool enableOversurrection;
	var() float OversurrectionLifeTime;
	var() int OversurrectiveHealth, OversurrectiveAttackDmg, OversurrectiveAttackHSDmg;
};
var() config WREOversStruct WREOversProfile[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local WRE WREnf;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'WRE'.default.GrenadeAmmoConsumption = default.WREProfile[i].GrenadeAmmoConsumption;
	Class'WRE'.default.HeadShotDmg = default.WREProfile[i].HeadShotDmg;
	Class'WRE'.default.RunningAimError = default.WREProfile[i].RunningAimError;
	Class'WRE'.default.WalkingAimError = default.WREProfile[i].WalkingAimError;
	Class'WRE'.default.CrouchingAimError = default.WREProfile[i].CrouchingAimError;
	
	Class'WRE'.default.enableOversurrection = default.WREOversProfile[i].enableOversurrection;
	Class'WRE'.default.OversurrectionLifeTime = default.WREOversProfile[i].OversurrectionLifeTime;
	Class'WRE'.default.OversurrectiveHealth = default.WREOversProfile[i].OversurrectiveHealth;
	Class'WRE'.default.OversurrectiveAttackDmg = default.WREOversProfile[i].OversurrectiveAttackDmg;
	Class'WRE'.default.OversurrectiveAttackHSDmg = default.WREOversProfile[i].OversurrectiveAttackHSDmg;
	
	if (Lvl == None)
		Class'WRE'.static.StaticSaveConfig();
		
		
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'WRE', WREnf)
		{
			WREnf.default.GrenadeAmmoConsumption = Class'WRE'.default.GrenadeAmmoConsumption;
			WREnf.GrenadeAmmoConsumption = Class'WRE'.default.GrenadeAmmoConsumption;
			WREnf.default.HeadShotDmg = Class'WRE'.default.HeadShotDmg;
			WREnf.HeadShotDmg = Class'WRE'.default.HeadShotDmg;
			WREnf.default.RunningAimError = Class'WRE'.default.RunningAimError;
			WREnf.RunningAimError = Class'WRE'.default.RunningAimError;
			WREnf.default.WalkingAimError = Class'WRE'.default.WalkingAimError;
			WREnf.WalkingAimError = Class'WRE'.default.WalkingAimError;
			WREnf.default.CrouchingAimError = Class'WRE'.default.CrouchingAimError;
			WREnf.CrouchingAimError = Class'WRE'.default.CrouchingAimError;
			WREnf.default.enableOversurrection = Class'WRE'.default.enableOversurrection;
			WREnf.enableOversurrection = Class'WRE'.default.enableOversurrection;
			WREnf.default.OversurrectionLifeTime = Class'WRE'.default.OversurrectionLifeTime;
			WREnf.OversurrectionLifeTime = Class'WRE'.default.OversurrectionLifeTime;
			WREnf.default.OversurrectiveHealth = Class'WRE'.default.OversurrectiveHealth;
			WREnf.OversurrectiveHealth = Class'WRE'.default.OversurrectiveHealth;
			WREnf.default.OversurrectiveAttackDmg = Class'WRE'.default.OversurrectiveAttackDmg;
			WREnf.OversurrectiveAttackDmg = Class'WRE'.default.OversurrectiveAttackDmg;
			WREnf.default.OversurrectiveAttackHSDmg = Class'WRE'.default.OversurrectiveAttackHSDmg;
			WREnf.OversurrectiveAttackHSDmg = Class'WRE'.default.OversurrectiveAttackHSDmg;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.WREProfile[i].GrenadeAmmoConsumption = Class'WRE'.default.GrenadeAmmoConsumption;
	default.WREProfile[i].HeadShotDmg = Class'WRE'.default.HeadShotDmg;
	default.WREProfile[i].RunningAimError = Class'WRE'.default.RunningAimError;
	default.WREProfile[i].WalkingAimError = Class'WRE'.default.WalkingAimError;
	default.WREProfile[i].CrouchingAimError = Class'WRE'.default.CrouchingAimError;
	
	default.WREOversProfile[i].enableOversurrection = Class'WRE'.default.enableOversurrection;
	default.WREOversProfile[i].OversurrectionLifeTime = Class'WRE'.default.OversurrectionLifeTime;
	default.WREOversProfile[i].OversurrectiveHealth = Class'WRE'.default.OversurrectiveHealth;
	default.WREOversProfile[i].OversurrectiveAttackDmg = Class'WRE'.default.OversurrectiveAttackDmg;
	default.WREOversProfile[i].OversurrectiveAttackHSDmg = Class'WRE'.default.OversurrectiveAttackHSDmg;
	
	StaticSaveConfig();
}


defaultproperties
{
	WREProfile(0)=(GrenadeAmmoConsumption=10,HeadShotDmg=50,RunningAimError=3.000000,WalkingAimError=1.750000,CrouchingAimError=0.250000)
	WREOversProfile(0)=(enableOversurrection=True,OversurrectionLifeTime=20.000000,OversurrectiveHealth=600,OversurrectiveAttackDmg=50,OversurrectiveAttackHSDmg=200)
	
	WREProfile(1)=(GrenadeAmmoConsumption=10,HeadShotDmg=75,RunningAimError=2.000000,WalkingAimError=1.000000,CrouchingAimError=0.000000)
	WREOversProfile(1)=(enableOversurrection=True,OversurrectionLifeTime=30.000000,OversurrectiveHealth=900,OversurrectiveAttackDmg=75,OversurrectiveAttackHSDmg=500)
	
	WREProfile(2)=(GrenadeAmmoConsumption=5,HeadShotDmg=75,RunningAimError=1.000000,WalkingAimError=0.500000,CrouchingAimError=0.000000)
	WREOversProfile(2)=(enableOversurrection=True,OversurrectionLifeTime=40.000000,OversurrectiveHealth=1200,OversurrectiveAttackDmg=100,OversurrectiveAttackHSDmg=1000)
	
	WREProfile(3)=(GrenadeAmmoConsumption=10,HeadShotDmg=50,RunningAimError=1.500000,WalkingAimError=0.750000,CrouchingAimError=0.100000)
	WREOversProfile(3)=(enableOversurrection=True,OversurrectionLifeTime=70.000000,OversurrectiveHealth=2000,OversurrectiveAttackDmg=150,OversurrectiveAttackHSDmg=2000)
	
	WREProfile(4)=(GrenadeAmmoConsumption=4,HeadShotDmg=150,RunningAimError=0.750000,WalkingAimError=0.300000,CrouchingAimError=0.000000)
	WREOversProfile(4)=(enableOversurrection=True,OversurrectionLifeTime=120.000000,OversurrectiveHealth=4000,OversurrectiveAttackDmg=300,OversurrectiveAttackHSDmg=6000)
	
	WREProfile(5)=(GrenadeAmmoConsumption=5,HeadShotDmg=75,RunningAimError=1.000000,WalkingAimError=0.500000,CrouchingAimError=0.000000)
	WREOversProfile(5)=(enableOversurrection=True,OversurrectionLifeTime=40.000000,OversurrectiveHealth=1200,OversurrectiveAttackDmg=100,OversurrectiveAttackHSDmg=1000)
	
	WREProfile(6)=(GrenadeAmmoConsumption=5,HeadShotDmg=75,RunningAimError=1.000000,WalkingAimError=0.500000,CrouchingAimError=0.000000)
	WREOversProfile(6)=(enableOversurrection=True,OversurrectionLifeTime=40.000000,OversurrectiveHealth=1200,OversurrectiveAttackDmg=100,OversurrectiveAttackHSDmg=1000)
	
	WREProfile(7)=(GrenadeAmmoConsumption=5,HeadShotDmg=75,RunningAimError=1.000000,WalkingAimError=0.500000,CrouchingAimError=0.000000)
	WREOversProfile(7)=(enableOversurrection=True,OversurrectionLifeTime=40.000000,OversurrectiveHealth=1200,OversurrectiveAttackDmg=100,OversurrectiveAttackHSDmg=1000)
}