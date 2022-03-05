//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanGameplayProfile expands NWProfile config(NWProfilesCfg);

struct VulcanStruct
{
	var() bool bAffectedByHeat;
	var() float DrillHeatRework, DrillHeatUpRate, DrillHeatDownRate, RunningAimError, WalkingAimError, CrouchingAimError;
};
var() config VulcanStruct VulcanProfile[8];


struct VulcanOversStructA
{
	var() bool enableOversurrection;
	var() float OversurrectionLifeTime;
};
var() config VulcanOversStructA VulcanOversProfileA[8];

struct VulcanOversStructB
{
	var() float OversurrectionProjSkyFireRate, OversurrectionProjSkyFireOdds, OversurrectionProjSkyFireRadius;
	var() int OversurrectionProjSkyFireMax, OversurrectionProjSkyFireDmg;
};
var() config VulcanOversStructB VulcanOversProfileB[8];

struct VulcanOversStructC
{
	var() float OversurrectionHProjSkyFireRate, OversurrectionHProjSkyFireOdds, OversurrectionHProjSkyFireRadius;
	var() int OversurrectionHProjSkyFireMax, OversurrectionHProjSkyFireDmg;
};
var() config VulcanOversStructC VulcanOversProfileC[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local Vulcan Vulc;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'Vulcan'.default.bAffectedByHeat = default.VulcanProfile[i].bAffectedByHeat;
	Class'Vulcan'.default.DrillHeatRework = default.VulcanProfile[i].DrillHeatRework;
	Class'Vulcan'.default.DrillHeatUpRate = default.VulcanProfile[i].DrillHeatUpRate;
	Class'Vulcan'.default.DrillHeatDownRate = default.VulcanProfile[i].DrillHeatDownRate;
	Class'Vulcan'.default.RunningAimError = default.VulcanProfile[i].RunningAimError;
	Class'Vulcan'.default.WalkingAimError = default.VulcanProfile[i].WalkingAimError;
	Class'Vulcan'.default.CrouchingAimError = default.VulcanProfile[i].CrouchingAimError;
	
	Class'Vulcan'.default.enableOversurrection = default.VulcanOversProfileA[i].enableOversurrection;
	Class'Vulcan'.default.OversurrectionLifeTime = default.VulcanOversProfileA[i].OversurrectionLifeTime;
	
	Class'Vulcan'.default.OversurrectionProjSkyFireRate = default.VulcanOversProfileB[i].OversurrectionProjSkyFireRate;
	Class'Vulcan'.default.OversurrectionProjSkyFireOdds = default.VulcanOversProfileB[i].OversurrectionProjSkyFireOdds;
	Class'Vulcan'.default.OversurrectionProjSkyFireRadius = default.VulcanOversProfileB[i].OversurrectionProjSkyFireRadius;
	Class'Vulcan'.default.OversurrectionProjSkyFireMax = default.VulcanOversProfileB[i].OversurrectionProjSkyFireMax;
	Class'Vulcan'.default.OversurrectionProjSkyFireDmg = default.VulcanOversProfileB[i].OversurrectionProjSkyFireDmg;
	
	Class'Vulcan'.default.OversurrectionHProjSkyFireRate = default.VulcanOversProfileC[i].OversurrectionHProjSkyFireRate;
	Class'Vulcan'.default.OversurrectionHProjSkyFireOdds = default.VulcanOversProfileC[i].OversurrectionHProjSkyFireOdds;
	Class'Vulcan'.default.OversurrectionHProjSkyFireRadius = default.VulcanOversProfileC[i].OversurrectionHProjSkyFireRadius;
	Class'Vulcan'.default.OversurrectionHProjSkyFireMax = default.VulcanOversProfileC[i].OversurrectionHProjSkyFireMax;
	Class'Vulcan'.default.OversurrectionHProjSkyFireDmg = default.VulcanOversProfileC[i].OversurrectionHProjSkyFireDmg;
	
	if (Lvl == None)
		Class'Vulcan'.static.StaticSaveConfig();
	
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'Vulcan', Vulc)
		{
			Vulc.default.bAffectedByHeat = Class'Vulcan'.default.bAffectedByHeat;
			Vulc.bAffectedByHeat = Class'Vulcan'.default.bAffectedByHeat;
			Vulc.default.DrillHeatRework = Class'Vulcan'.default.DrillHeatRework;
			Vulc.DrillHeatRework = Class'Vulcan'.default.DrillHeatRework;
			Vulc.default.DrillHeatUpRate = Class'Vulcan'.default.DrillHeatUpRate;
			Vulc.DrillHeatUpRate = Class'Vulcan'.default.DrillHeatUpRate;
			Vulc.default.DrillHeatDownRate = Class'Vulcan'.default.DrillHeatDownRate;
			Vulc.DrillHeatDownRate = Class'Vulcan'.default.DrillHeatDownRate;
			Vulc.default.RunningAimError = Class'Vulcan'.default.RunningAimError;
			Vulc.RunningAimError = Class'Vulcan'.default.RunningAimError;
			Vulc.default.WalkingAimError = Class'Vulcan'.default.WalkingAimError;
			Vulc.WalkingAimError = Class'Vulcan'.default.WalkingAimError;
			Vulc.default.CrouchingAimError = Class'Vulcan'.default.CrouchingAimError;
			Vulc.CrouchingAimError = Class'Vulcan'.default.CrouchingAimError;
			
			Vulc.default.enableOversurrection = Class'Vulcan'.default.enableOversurrection;
			Vulc.enableOversurrection = Class'Vulcan'.default.enableOversurrection;
			Vulc.default.OversurrectionLifeTime = Class'Vulcan'.default.OversurrectionLifeTime;
			Vulc.OversurrectionLifeTime = Class'Vulcan'.default.OversurrectionLifeTime;
			
			Vulc.default.OversurrectionProjSkyFireRate = Class'Vulcan'.default.OversurrectionProjSkyFireRate;
			Vulc.OversurrectionProjSkyFireRate = Class'Vulcan'.default.OversurrectionProjSkyFireRate;
			Vulc.default.OversurrectionProjSkyFireOdds = Class'Vulcan'.default.OversurrectionProjSkyFireOdds;
			Vulc.OversurrectionProjSkyFireOdds = Class'Vulcan'.default.OversurrectionProjSkyFireOdds;
			Vulc.default.OversurrectionProjSkyFireRadius = Class'Vulcan'.default.OversurrectionProjSkyFireRadius;
			Vulc.OversurrectionProjSkyFireRadius = Class'Vulcan'.default.OversurrectionProjSkyFireRadius;
			Vulc.default.OversurrectionProjSkyFireMax = Class'Vulcan'.default.OversurrectionProjSkyFireMax;
			Vulc.OversurrectionProjSkyFireMax = Class'Vulcan'.default.OversurrectionProjSkyFireMax;
			Vulc.default.OversurrectionProjSkyFireDmg = Class'Vulcan'.default.OversurrectionProjSkyFireDmg;
			Vulc.OversurrectionProjSkyFireDmg = Class'Vulcan'.default.OversurrectionProjSkyFireDmg;
			
			Vulc.default.OversurrectionHProjSkyFireRate = Class'Vulcan'.default.OversurrectionHProjSkyFireRate;
			Vulc.OversurrectionHProjSkyFireRate = Class'Vulcan'.default.OversurrectionHProjSkyFireRate;
			Vulc.default.OversurrectionHProjSkyFireOdds = Class'Vulcan'.default.OversurrectionHProjSkyFireOdds;
			Vulc.OversurrectionHProjSkyFireOdds = Class'Vulcan'.default.OversurrectionHProjSkyFireOdds;
			Vulc.default.OversurrectionHProjSkyFireRadius = Class'Vulcan'.default.OversurrectionHProjSkyFireRadius;
			Vulc.OversurrectionHProjSkyFireRadius = Class'Vulcan'.default.OversurrectionHProjSkyFireRadius;
			Vulc.default.OversurrectionHProjSkyFireMax = Class'Vulcan'.default.OversurrectionHProjSkyFireMax;
			Vulc.OversurrectionHProjSkyFireMax = Class'Vulcan'.default.OversurrectionHProjSkyFireMax;
			Vulc.default.OversurrectionHProjSkyFireDmg = Class'Vulcan'.default.OversurrectionHProjSkyFireDmg;
			Vulc.OversurrectionHProjSkyFireDmg = Class'Vulcan'.default.OversurrectionHProjSkyFireDmg;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.VulcanProfile[i].bAffectedByHeat = Class'Vulcan'.default.bAffectedByHeat;
	default.VulcanProfile[i].DrillHeatRework = Class'Vulcan'.default.DrillHeatRework;
	default.VulcanProfile[i].DrillHeatUpRate = Class'Vulcan'.default.DrillHeatUpRate;
	default.VulcanProfile[i].DrillHeatDownRate = Class'Vulcan'.default.DrillHeatDownRate;
	default.VulcanProfile[i].RunningAimError = Class'Vulcan'.default.RunningAimError;
	default.VulcanProfile[i].WalkingAimError = Class'Vulcan'.default.WalkingAimError;
	default.VulcanProfile[i].CrouchingAimError = Class'Vulcan'.default.CrouchingAimError;
	
	default.VulcanOversProfileA[i].enableOversurrection = Class'Vulcan'.default.enableOversurrection;
	default.VulcanOversProfileA[i].OversurrectionLifeTime = Class'Vulcan'.default.OversurrectionLifeTime;
	
	default.VulcanOversProfileB[i].OversurrectionProjSkyFireRate = Class'Vulcan'.default.OversurrectionProjSkyFireRate;
	default.VulcanOversProfileB[i].OversurrectionProjSkyFireOdds = Class'Vulcan'.default.OversurrectionProjSkyFireOdds;
	default.VulcanOversProfileB[i].OversurrectionProjSkyFireRadius = Class'Vulcan'.default.OversurrectionProjSkyFireRadius;
	default.VulcanOversProfileB[i].OversurrectionProjSkyFireMax = Class'Vulcan'.default.OversurrectionProjSkyFireMax;
	default.VulcanOversProfileB[i].OversurrectionProjSkyFireDmg = Class'Vulcan'.default.OversurrectionProjSkyFireDmg;
	
	default.VulcanOversProfileC[i].OversurrectionHProjSkyFireRate = Class'Vulcan'.default.OversurrectionHProjSkyFireRate;
	default.VulcanOversProfileC[i].OversurrectionHProjSkyFireOdds = Class'Vulcan'.default.OversurrectionHProjSkyFireOdds;
	default.VulcanOversProfileC[i].OversurrectionHProjSkyFireRadius = Class'Vulcan'.default.OversurrectionHProjSkyFireRadius;
	default.VulcanOversProfileC[i].OversurrectionHProjSkyFireMax = Class'Vulcan'.default.OversurrectionHProjSkyFireMax;
	default.VulcanOversProfileC[i].OversurrectionHProjSkyFireDmg = Class'Vulcan'.default.OversurrectionHProjSkyFireDmg;
	
	StaticSaveConfig();
}


defaultproperties
{
	VulcanProfile(0)=(bAffectedByHeat=True,DrillHeatRework=0.200000,DrillHeatUpRate=0.250000,DrillHeatDownRate=0.375000,RunningAimError=6.750000,WalkingAimError=3.750000,CrouchingAimError=2.500000)
	VulcanOversProfileA(0)=(enableOversurrection=True,OversurrectionLifeTime=10.000000)
	VulcanOversProfileB(0)=(OversurrectionProjSkyFireRate=4.500000,OversurrectionProjSkyFireOdds=0.750000,OversurrectionProjSkyFireMax=8,OversurrectionProjSkyFireDmg=100,OversurrectionProjSkyFireRadius=150.000000)
	VulcanOversProfileC(0)=(OversurrectionHProjSkyFireRate=1.000000,OversurrectionHProjSkyFireOdds=0.150000,OversurrectionHProjSkyFireMax=3,OversurrectionHProjSkyFireDmg=500,OversurrectionHProjSkyFireRadius=400.000000)
	
	VulcanProfile(1)=(bAffectedByHeat=True,DrillHeatRework=0.300000,DrillHeatUpRate=0.350000,DrillHeatDownRate=0.275000,RunningAimError=5.000000,WalkingAimError=2.750000,CrouchingAimError=1.500000)
	VulcanOversProfileA(1)=(enableOversurrection=True,OversurrectionLifeTime=18.000000)
	VulcanOversProfileB(1)=(OversurrectionProjSkyFireRate=6.500000,OversurrectionProjSkyFireOdds=0.850000,OversurrectionProjSkyFireMax=12,OversurrectionProjSkyFireDmg=200,OversurrectionProjSkyFireRadius=250.000000)
	VulcanOversProfileC(1)=(OversurrectionHProjSkyFireRate=1.500000,OversurrectionHProjSkyFireOdds=0.250000,OversurrectionHProjSkyFireMax=5,OversurrectionHProjSkyFireDmg=1000,OversurrectionHProjSkyFireRadius=500.000000)
	
	VulcanProfile(2)=(bAffectedByHeat=False,DrillHeatRework=0.400000,DrillHeatUpRate=0.350000,DrillHeatDownRate=0.275000,RunningAimError=4.000000,WalkingAimError=2.250000,CrouchingAimError=1.500000)
	VulcanOversProfileA(2)=(enableOversurrection=True,OversurrectionLifeTime=25.000000)
	VulcanOversProfileB(2)=(OversurrectionProjSkyFireRate=7.500000,OversurrectionProjSkyFireOdds=0.900000,OversurrectionProjSkyFireMax=15,OversurrectionProjSkyFireDmg=500,OversurrectionProjSkyFireRadius=350.000000)
	VulcanOversProfileC(2)=(OversurrectionHProjSkyFireRate=2.500000,OversurrectionHProjSkyFireOdds=0.350000,OversurrectionHProjSkyFireMax=5,OversurrectionHProjSkyFireDmg=2000,OversurrectionHProjSkyFireRadius=600.000000)
	
	VulcanProfile(3)=(bAffectedByHeat=False,DrillHeatRework=0.300000,DrillHeatUpRate=0.350000,DrillHeatDownRate=0.275000,RunningAimError=5.000000,WalkingAimError=2.750000,CrouchingAimError=1.500000)
	VulcanOversProfileA(3)=(enableOversurrection=True,OversurrectionLifeTime=35.000000)
	VulcanOversProfileB(3)=(OversurrectionProjSkyFireRate=7.500000,OversurrectionProjSkyFireOdds=0.900000,OversurrectionProjSkyFireMax=15,OversurrectionProjSkyFireDmg=1500,OversurrectionProjSkyFireRadius=450.000000)
	VulcanOversProfileC(3)=(OversurrectionHProjSkyFireRate=2.500000,OversurrectionHProjSkyFireOdds=0.450000,OversurrectionHProjSkyFireMax=5,OversurrectionHProjSkyFireDmg=5000,OversurrectionHProjSkyFireRadius=750.000000)
	
	VulcanProfile(4)=(bAffectedByHeat=False,DrillHeatRework=0.800000,DrillHeatUpRate=0.150000,DrillHeatDownRate=0.475000,RunningAimError=2.000000,WalkingAimError=1.000000,CrouchingAimError=0.250000)
	VulcanOversProfileA(4)=(enableOversurrection=True,OversurrectionLifeTime=45.000000)
	VulcanOversProfileB(4)=(OversurrectionProjSkyFireRate=9.500000,OversurrectionProjSkyFireOdds=0.900000,OversurrectionProjSkyFireMax=20,OversurrectionProjSkyFireDmg=2000,OversurrectionProjSkyFireRadius=450.000000)
	VulcanOversProfileC(4)=(OversurrectionHProjSkyFireRate=4.000000,OversurrectionHProjSkyFireOdds=0.550000,OversurrectionHProjSkyFireMax=8,OversurrectionHProjSkyFireDmg=10000,OversurrectionHProjSkyFireRadius=750.000000)
	
	VulcanProfile(5)=(bAffectedByHeat=False,DrillHeatRework=0.400000,DrillHeatUpRate=0.350000,DrillHeatDownRate=0.275000,RunningAimError=4.000000,WalkingAimError=2.250000,CrouchingAimError=1.500000)
	VulcanOversProfileA(5)=(enableOversurrection=True,OversurrectionLifeTime=25.000000)
	VulcanOversProfileB(5)=(OversurrectionProjSkyFireRate=7.500000,OversurrectionProjSkyFireOdds=0.900000,OversurrectionProjSkyFireMax=15,OversurrectionProjSkyFireDmg=500,OversurrectionProjSkyFireRadius=350.000000)
	VulcanOversProfileC(5)=(OversurrectionHProjSkyFireRate=2.500000,OversurrectionHProjSkyFireOdds=0.350000,OversurrectionHProjSkyFireMax=5,OversurrectionHProjSkyFireDmg=2000,OversurrectionHProjSkyFireRadius=600.000000)
	
	VulcanProfile(6)=(bAffectedByHeat=False,DrillHeatRework=0.400000,DrillHeatUpRate=0.350000,DrillHeatDownRate=0.275000,RunningAimError=4.000000,WalkingAimError=2.250000,CrouchingAimError=1.500000)
	VulcanOversProfileA(6)=(enableOversurrection=True,OversurrectionLifeTime=25.000000)
	VulcanOversProfileB(6)=(OversurrectionProjSkyFireRate=7.500000,OversurrectionProjSkyFireOdds=0.900000,OversurrectionProjSkyFireMax=15,OversurrectionProjSkyFireDmg=500,OversurrectionProjSkyFireRadius=350.000000)
	VulcanOversProfileC(6)=(OversurrectionHProjSkyFireRate=2.500000,OversurrectionHProjSkyFireOdds=0.350000,OversurrectionHProjSkyFireMax=5,OversurrectionHProjSkyFireDmg=2000,OversurrectionHProjSkyFireRadius=600.000000)
	
	VulcanProfile(7)=(bAffectedByHeat=False,DrillHeatRework=0.400000,DrillHeatUpRate=0.350000,DrillHeatDownRate=0.275000,RunningAimError=4.000000,WalkingAimError=2.250000,CrouchingAimError=1.500000)
	VulcanOversProfileA(7)=(enableOversurrection=True,OversurrectionLifeTime=25.000000)
	VulcanOversProfileB(7)=(OversurrectionProjSkyFireRate=7.500000,OversurrectionProjSkyFireOdds=0.900000,OversurrectionProjSkyFireMax=15,OversurrectionProjSkyFireDmg=500,OversurrectionProjSkyFireRadius=350.000000)
	VulcanOversProfileC(7)=(OversurrectionHProjSkyFireRate=2.500000,OversurrectionHProjSkyFireOdds=0.350000,OversurrectionHProjSkyFireMax=5,OversurrectionHProjSkyFireDmg=2000,OversurrectionHProjSkyFireRadius=600.000000)
}