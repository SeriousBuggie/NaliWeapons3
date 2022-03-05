//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTrackerGameplayProfile expands NWProfile config(NWProfilesCfg);

struct FlameTrackerStruct
{
	var() bool bAffectedByTemperature, BurnStaticObjects, bBurnInstigator;
	var() float FlamesDamageRate, FlamesOutSpeed;
	var() byte LavaAmmoConsumption, LavaBlobsAmount, BodyFlamesDamage;
};
var() config FlameTrackerStruct FlameTrackerProfile[8];

struct FlameTOversStruct
{
	var() bool enableOversurrection;
	var() float OversurrectionLifeTime, OversurrectiveBlobsRate;
	var() int OversurrectiveBlobsPerUpdate, OversurrectiveBlobsDamage;
};
var() config FlameTOversStruct FlameTOversProfile[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local FlameTracker FT;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'FlameTracker'.default.bAffectedByTemperature = default.FlameTrackerProfile[i].bAffectedByTemperature;
	Class'FlameTracker'.default.bBurnInstigator = default.FlameTrackerProfile[i].bBurnInstigator;
	Class'FlameTracker'.default.BurnStaticObjects = default.FlameTrackerProfile[i].BurnStaticObjects;
	Class'FlameTracker'.default.FlamesDamageRate = default.FlameTrackerProfile[i].FlamesDamageRate;
	Class'FlameTracker'.default.FlamesOutSpeed = default.FlameTrackerProfile[i].FlamesOutSpeed;
	Class'FlameTracker'.default.LavaAmmoConsumption = default.FlameTrackerProfile[i].LavaAmmoConsumption;
	Class'FlameTracker'.default.LavaBlobsAmount = default.FlameTrackerProfile[i].LavaBlobsAmount;
	Class'FlameTracker'.default.BodyFlamesDamage = default.FlameTrackerProfile[i].BodyFlamesDamage;
	
	Class'FlameTracker'.default.enableOversurrection = default.FlameTOversProfile[i].enableOversurrection;
	Class'FlameTracker'.default.OversurrectionLifeTime = default.FlameTOversProfile[i].OversurrectionLifeTime;
	Class'FlameTracker'.default.OversurrectiveBlobsRate = default.FlameTOversProfile[i].OversurrectiveBlobsRate;
	Class'FlameTracker'.default.OversurrectiveBlobsPerUpdate = default.FlameTOversProfile[i].OversurrectiveBlobsPerUpdate;
	Class'FlameTracker'.default.OversurrectiveBlobsDamage = default.FlameTOversProfile[i].OversurrectiveBlobsDamage;
	
	if (Lvl == None)
		Class'FlameTracker'.static.StaticSaveConfig();
		
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'FlameTracker', FT)
		{
			FT.default.bAffectedByTemperature = Class'FlameTracker'.default.bAffectedByTemperature;
			FT.bAffectedByTemperature = Class'FlameTracker'.default.bAffectedByTemperature;
			FT.default.bBurnInstigator = Class'FlameTracker'.default.bBurnInstigator;
			FT.bBurnInstigator = Class'FlameTracker'.default.bBurnInstigator;
			FT.default.BurnStaticObjects = Class'FlameTracker'.default.BurnStaticObjects;
			FT.BurnStaticObjects = Class'FlameTracker'.default.BurnStaticObjects;
			FT.default.FlamesDamageRate = Class'FlameTracker'.default.FlamesDamageRate;
			FT.FlamesDamageRate = Class'FlameTracker'.default.FlamesDamageRate;
			FT.default.FlamesOutSpeed = Class'FlameTracker'.default.FlamesOutSpeed;
			FT.FlamesOutSpeed = Class'FlameTracker'.default.FlamesOutSpeed;
			FT.default.LavaAmmoConsumption = Class'FlameTracker'.default.LavaAmmoConsumption;
			FT.LavaAmmoConsumption = Class'FlameTracker'.default.LavaAmmoConsumption;
			FT.default.LavaBlobsAmount = Class'FlameTracker'.default.LavaBlobsAmount;
			FT.LavaBlobsAmount = Class'FlameTracker'.default.LavaBlobsAmount;
			FT.default.BodyFlamesDamage = Class'FlameTracker'.default.BodyFlamesDamage;
			FT.BodyFlamesDamage = Class'FlameTracker'.default.BodyFlamesDamage;
			
			FT.default.enableOversurrection = Class'FlameTracker'.default.enableOversurrection;
			FT.enableOversurrection = Class'FlameTracker'.default.enableOversurrection;
			FT.default.OversurrectionLifeTime = Class'FlameTracker'.default.OversurrectionLifeTime;
			FT.OversurrectionLifeTime = Class'FlameTracker'.default.OversurrectionLifeTime;
			FT.default.OversurrectiveBlobsRate = Class'FlameTracker'.default.OversurrectiveBlobsRate;
			FT.OversurrectiveBlobsRate = Class'FlameTracker'.default.OversurrectiveBlobsRate;
			FT.default.OversurrectiveBlobsPerUpdate = Class'FlameTracker'.default.OversurrectiveBlobsPerUpdate;
			FT.OversurrectiveBlobsPerUpdate = Class'FlameTracker'.default.OversurrectiveBlobsPerUpdate;
			FT.default.OversurrectiveBlobsDamage = Class'FlameTracker'.default.OversurrectiveBlobsDamage;
			FT.OversurrectiveBlobsDamage = Class'FlameTracker'.default.OversurrectiveBlobsDamage;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.FlameTrackerProfile[i].bAffectedByTemperature = Class'FlameTracker'.default.bAffectedByTemperature;
	default.FlameTrackerProfile[i].bBurnInstigator = Class'FlameTracker'.default.bBurnInstigator;
	default.FlameTrackerProfile[i].BurnStaticObjects = Class'FlameTracker'.default.BurnStaticObjects;
	default.FlameTrackerProfile[i].FlamesDamageRate = Class'FlameTracker'.default.FlamesDamageRate;
	default.FlameTrackerProfile[i].FlamesOutSpeed = Class'FlameTracker'.default.FlamesOutSpeed;
	default.FlameTrackerProfile[i].LavaAmmoConsumption = Class'FlameTracker'.default.LavaAmmoConsumption;
	default.FlameTrackerProfile[i].LavaBlobsAmount = Class'FlameTracker'.default.LavaBlobsAmount;
	default.FlameTrackerProfile[i].BodyFlamesDamage = Class'FlameTracker'.default.BodyFlamesDamage;
	
	default.FlameTOversProfile[i].enableOversurrection = Class'FlameTracker'.default.enableOversurrection;
	default.FlameTOversProfile[i].OversurrectionLifeTime = Class'FlameTracker'.default.OversurrectionLifeTime;
	default.FlameTOversProfile[i].OversurrectiveBlobsRate = Class'FlameTracker'.default.OversurrectiveBlobsRate;
	default.FlameTOversProfile[i].OversurrectiveBlobsPerUpdate = Class'FlameTracker'.default.OversurrectiveBlobsPerUpdate;
	default.FlameTOversProfile[i].OversurrectiveBlobsDamage = Class'FlameTracker'.default.OversurrectiveBlobsDamage;
	
	StaticSaveConfig();
}


defaultproperties
{
	FlameTrackerProfile(0)=(bAffectedByTemperature=True,bBurnInstigator=True,BurnStaticObjects=True,FlamesDamageRate=3.500000,FlamesOutSpeed=425.000000,LavaAmmoConsumption=15,LavaBlobsAmount=2,BodyFlamesDamage=1)
	FlameTOversProfile(0)=(enableOversurrection=True,OversurrectionLifeTime=5.000000,OversurrectiveBlobsRate=10.000000,OversurrectiveBlobsPerUpdate=2,OversurrectiveBlobsDamage=150)
	
	FlameTrackerProfile(1)=(bAffectedByTemperature=False,bBurnInstigator=False,BurnStaticObjects=True,FlamesDamageRate=4.000000,FlamesOutSpeed=600.000000,LavaAmmoConsumption=10,LavaBlobsAmount=2,BodyFlamesDamage=2)
	FlameTOversProfile(1)=(enableOversurrection=True,OversurrectionLifeTime=8.000000,OversurrectiveBlobsRate=12.000000,OversurrectiveBlobsPerUpdate=3,OversurrectiveBlobsDamage=300)
	
	FlameTrackerProfile(2)=(bAffectedByTemperature=False,bBurnInstigator=False,BurnStaticObjects=True,FlamesDamageRate=5.000000,FlamesOutSpeed=850.000000,LavaAmmoConsumption=10,LavaBlobsAmount=3,BodyFlamesDamage=2)
	FlameTOversProfile(2)=(enableOversurrection=True,OversurrectionLifeTime=10.000000,OversurrectiveBlobsRate=15.000000,OversurrectiveBlobsPerUpdate=3,OversurrectiveBlobsDamage=500)
	
	FlameTrackerProfile(3)=(bAffectedByTemperature=False,bBurnInstigator=False,BurnStaticObjects=True,FlamesDamageRate=5.000000,FlamesOutSpeed=650.000000,LavaAmmoConsumption=15,LavaBlobsAmount=3,BodyFlamesDamage=3)
	FlameTOversProfile(3)=(enableOversurrection=True,OversurrectionLifeTime=15.000000,OversurrectiveBlobsRate=15.000000,OversurrectiveBlobsPerUpdate=3,OversurrectiveBlobsDamage=650)
	
	FlameTrackerProfile(4)=(bAffectedByTemperature=False,bBurnInstigator=False,BurnStaticObjects=True,FlamesDamageRate=6.000000,FlamesOutSpeed=1000.000000,LavaAmmoConsumption=8,LavaBlobsAmount=5,BodyFlamesDamage=5)
	FlameTOversProfile(4)=(enableOversurrection=True,OversurrectionLifeTime=25.000000,OversurrectiveBlobsRate=15.000000,OversurrectiveBlobsPerUpdate=4,OversurrectiveBlobsDamage=1000)
	
	FlameTrackerProfile(5)=(bAffectedByTemperature=False,bBurnInstigator=False,BurnStaticObjects=True,FlamesDamageRate=5.000000,FlamesOutSpeed=850.000000,LavaAmmoConsumption=10,LavaBlobsAmount=3,BodyFlamesDamage=2)
	FlameTOversProfile(5)=(enableOversurrection=True,OversurrectionLifeTime=10.000000,OversurrectiveBlobsRate=15.000000,OversurrectiveBlobsPerUpdate=3,OversurrectiveBlobsDamage=500)
	
	FlameTrackerProfile(6)=(bAffectedByTemperature=False,bBurnInstigator=False,BurnStaticObjects=True,FlamesDamageRate=5.000000,FlamesOutSpeed=850.000000,LavaAmmoConsumption=10,LavaBlobsAmount=3,BodyFlamesDamage=2)
	FlameTOversProfile(6)=(enableOversurrection=True,OversurrectionLifeTime=10.000000,OversurrectiveBlobsRate=15.000000,OversurrectiveBlobsPerUpdate=3,OversurrectiveBlobsDamage=500)
	
	FlameTrackerProfile(7)=(bAffectedByTemperature=False,bBurnInstigator=False,BurnStaticObjects=True,FlamesDamageRate=5.000000,FlamesOutSpeed=850.000000,LavaAmmoConsumption=10,LavaBlobsAmount=3,BodyFlamesDamage=2)
	FlameTOversProfile(7)=(enableOversurrection=True,OversurrectionLifeTime=10.000000,OversurrectiveBlobsRate=15.000000,OversurrectiveBlobsPerUpdate=3,OversurrectiveBlobsDamage=500)
}