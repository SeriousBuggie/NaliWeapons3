//////////////////////////////////////////////////////////////
//				Feralidragon (16-09-2012)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerGameplayProfile expands NWProfile config(NWProfilesCfg);

struct FreezerStruct
{
	var() bool bSinkIceBase, bStaticIceBase;
	var() int IceBaseStrength;
};
var() config FreezerStruct FreezerProfile[8];

struct FreezerOversStructA
{
	var() bool enableOversurrection;
	var() float OversurrectionLifeTime;
};
var() config FreezerOversStructA FreezerOversProfileA[8];

struct FreezerOversStructB
{
	var() float OversurrectionCrystRate, OversurrectionCrystMinDist, OversurrectionCrystMaxDist;
	var() int OversurrectionCrystMaxAmount;
};
var() config FreezerOversStructB FreezerOversProfileB[8];

struct FreezerOversStructC
{
	var() float OversurrectionIceSpreadLifeTime, OversurrectionFreezingDmgRate, OversurrectionFreezingDmgRadius;
	var() int OversurrectionFreezingDmg;
};
var() config FreezerOversStructC FreezerOversProfileC[8];

struct FreezerOversStructD
{
	var() float OversurrectionImpaleOdds, OversurrectionImpaleMaxHeight;
	var() int OversurrectionImpaleDmg;
};
var() config FreezerOversStructD FreezerOversProfileD[8];

struct FreezerOversStructE
{
	var() float OversurrectionRIImpaleOdds, OversurrectionRIImpaleRate, OversurrectionRIImpaleMinHeight, OversurrectionRIImpaleMaxHeight;
	var() int OversurrectionRIImpaleMinAmount, OversurrectionRIImpaleMaxAmount;
};
var() config FreezerOversStructE FreezerOversProfileE[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local Freezer Fzr;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'Freezer'.default.bSinkIceBase = default.FreezerProfile[i].bSinkIceBase;
	Class'Freezer'.default.bStaticIceBase = default.FreezerProfile[i].bStaticIceBase;
	Class'Freezer'.default.IceBaseStrength = default.FreezerProfile[i].IceBaseStrength;
	
	Class'Freezer'.default.enableOversurrection = default.FreezerOversProfileA[i].enableOversurrection;
	Class'Freezer'.default.OversurrectionLifeTime = default.FreezerOversProfileA[i].OversurrectionLifeTime;
	
	Class'Freezer'.default.OversurrectionCrystRate = default.FreezerOversProfileB[i].OversurrectionCrystRate;
	Class'Freezer'.default.OversurrectionCrystMinDist = default.FreezerOversProfileB[i].OversurrectionCrystMinDist;
	Class'Freezer'.default.OversurrectionCrystMaxDist = default.FreezerOversProfileB[i].OversurrectionCrystMaxDist;
	Class'Freezer'.default.OversurrectionCrystMaxAmount = default.FreezerOversProfileB[i].OversurrectionCrystMaxAmount;
	
	Class'Freezer'.default.OversurrectionIceSpreadLifeTime = default.FreezerOversProfileC[i].OversurrectionIceSpreadLifeTime;
	Class'Freezer'.default.OversurrectionFreezingDmgRate = default.FreezerOversProfileC[i].OversurrectionFreezingDmgRate;
	Class'Freezer'.default.OversurrectionFreezingDmgRadius = default.FreezerOversProfileC[i].OversurrectionFreezingDmgRadius;
	Class'Freezer'.default.OversurrectionFreezingDmg = default.FreezerOversProfileC[i].OversurrectionFreezingDmg;
	
	Class'Freezer'.default.OversurrectionImpaleOdds = default.FreezerOversProfileD[i].OversurrectionImpaleOdds;
	Class'Freezer'.default.OversurrectionImpaleMaxHeight = default.FreezerOversProfileD[i].OversurrectionImpaleMaxHeight;
	Class'Freezer'.default.OversurrectionImpaleDmg = default.FreezerOversProfileD[i].OversurrectionImpaleDmg;
	
	Class'Freezer'.default.OversurrectionRIImpaleOdds = default.FreezerOversProfileE[i].OversurrectionRIImpaleOdds;
	Class'Freezer'.default.OversurrectionRIImpaleRate = default.FreezerOversProfileE[i].OversurrectionRIImpaleRate;
	Class'Freezer'.default.OversurrectionRIImpaleMinHeight = default.FreezerOversProfileE[i].OversurrectionRIImpaleMinHeight;
	Class'Freezer'.default.OversurrectionRIImpaleMaxHeight = default.FreezerOversProfileE[i].OversurrectionRIImpaleMaxHeight;
	Class'Freezer'.default.OversurrectionRIImpaleMinAmount = default.FreezerOversProfileE[i].OversurrectionRIImpaleMinAmount;
	Class'Freezer'.default.OversurrectionRIImpaleMaxAmount = default.FreezerOversProfileE[i].OversurrectionRIImpaleMaxAmount;
	
	if (Lvl == None)
		Class'Freezer'.static.StaticSaveConfig();
	
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'Freezer', Fzr)
		{
			Fzr.default.bSinkIceBase = Class'Freezer'.default.bSinkIceBase;
			Fzr.bSinkIceBase = Class'Freezer'.default.bSinkIceBase;
			Fzr.default.bStaticIceBase = Class'Freezer'.default.bStaticIceBase;
			Fzr.bStaticIceBase = Class'Freezer'.default.bStaticIceBase;
			Fzr.default.IceBaseStrength = Class'Freezer'.default.IceBaseStrength;
			Fzr.IceBaseStrength = Class'Freezer'.default.IceBaseStrength;
			
			
			Fzr.default.enableOversurrection = Class'Freezer'.default.enableOversurrection;
			Fzr.enableOversurrection = Class'Freezer'.default.enableOversurrection;
			Fzr.default.OversurrectionLifeTime = Class'Freezer'.default.OversurrectionLifeTime;
			Fzr.OversurrectionLifeTime = Class'Freezer'.default.OversurrectionLifeTime;
			Fzr.default.OversurrectionCrystRate = Class'Freezer'.default.OversurrectionCrystRate;
			Fzr.OversurrectionCrystRate = Class'Freezer'.default.OversurrectionCrystRate;
			Fzr.default.OversurrectionCrystMinDist = Class'Freezer'.default.OversurrectionCrystMinDist;
			Fzr.OversurrectionCrystMinDist = Class'Freezer'.default.OversurrectionCrystMinDist;
			Fzr.default.OversurrectionCrystMaxDist = Class'Freezer'.default.OversurrectionCrystMaxDist;
			Fzr.OversurrectionCrystMaxDist = Class'Freezer'.default.OversurrectionCrystMaxDist;
			Fzr.default.OversurrectionCrystMaxAmount = Class'Freezer'.default.OversurrectionCrystMaxAmount;
			Fzr.OversurrectionCrystMaxAmount = Class'Freezer'.default.OversurrectionCrystMaxAmount;
			Fzr.default.OversurrectionIceSpreadLifeTime = Class'Freezer'.default.OversurrectionIceSpreadLifeTime;
			Fzr.OversurrectionIceSpreadLifeTime = Class'Freezer'.default.OversurrectionIceSpreadLifeTime;
			Fzr.default.OversurrectionFreezingDmgRate = Class'Freezer'.default.OversurrectionFreezingDmgRate;
			Fzr.OversurrectionFreezingDmgRate = Class'Freezer'.default.OversurrectionFreezingDmgRate;
			Fzr.default.OversurrectionFreezingDmgRadius = Class'Freezer'.default.OversurrectionFreezingDmgRadius;
			Fzr.OversurrectionFreezingDmgRadius = Class'Freezer'.default.OversurrectionFreezingDmgRadius;
			Fzr.default.OversurrectionFreezingDmg = Class'Freezer'.default.OversurrectionFreezingDmg;
			Fzr.OversurrectionFreezingDmg = Class'Freezer'.default.OversurrectionFreezingDmg;
			Fzr.default.OversurrectionImpaleOdds = Class'Freezer'.default.OversurrectionImpaleOdds;
			Fzr.OversurrectionImpaleOdds = Class'Freezer'.default.OversurrectionImpaleOdds;
			Fzr.default.OversurrectionImpaleMaxHeight = Class'Freezer'.default.OversurrectionImpaleMaxHeight;
			Fzr.OversurrectionImpaleMaxHeight = Class'Freezer'.default.OversurrectionImpaleMaxHeight;
			Fzr.default.OversurrectionImpaleDmg = Class'Freezer'.default.OversurrectionImpaleDmg;
			Fzr.OversurrectionImpaleDmg = Class'Freezer'.default.OversurrectionImpaleDmg;
			Fzr.default.OversurrectionRIImpaleOdds = Class'Freezer'.default.OversurrectionRIImpaleOdds;
			Fzr.OversurrectionRIImpaleOdds = Class'Freezer'.default.OversurrectionRIImpaleOdds;
			Fzr.default.OversurrectionRIImpaleRate = Class'Freezer'.default.OversurrectionRIImpaleRate;
			Fzr.OversurrectionRIImpaleRate = Class'Freezer'.default.OversurrectionRIImpaleRate;
			Fzr.default.OversurrectionRIImpaleMinHeight = Class'Freezer'.default.OversurrectionRIImpaleMinHeight;
			Fzr.OversurrectionRIImpaleMinHeight = Class'Freezer'.default.OversurrectionRIImpaleMinHeight;
			Fzr.default.OversurrectionRIImpaleMaxHeight = Class'Freezer'.default.OversurrectionRIImpaleMaxHeight;
			Fzr.OversurrectionRIImpaleMaxHeight = Class'Freezer'.default.OversurrectionRIImpaleMaxHeight;
			Fzr.default.OversurrectionRIImpaleMinAmount = Class'Freezer'.default.OversurrectionRIImpaleMinAmount;
			Fzr.OversurrectionRIImpaleMinAmount = Class'Freezer'.default.OversurrectionRIImpaleMinAmount;
			Fzr.default.OversurrectionRIImpaleMaxAmount = Class'Freezer'.default.OversurrectionRIImpaleMaxAmount;
			Fzr.OversurrectionRIImpaleMaxAmount = Class'Freezer'.default.OversurrectionRIImpaleMaxAmount;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.FreezerProfile[i].bSinkIceBase = Class'Freezer'.default.bSinkIceBase;
	default.FreezerProfile[i].bStaticIceBase = Class'Freezer'.default.bStaticIceBase;
	default.FreezerProfile[i].IceBaseStrength = Class'Freezer'.default.IceBaseStrength;
	
	default.FreezerOversProfileA[i].enableOversurrection = Class'Freezer'.default.enableOversurrection;
	default.FreezerOversProfileA[i].OversurrectionLifeTime = Class'Freezer'.default.OversurrectionLifeTime;
	
	default.FreezerOversProfileB[i].OversurrectionCrystRate = Class'Freezer'.default.OversurrectionCrystRate;
	default.FreezerOversProfileB[i].OversurrectionCrystMinDist = Class'Freezer'.default.OversurrectionCrystMinDist;
	default.FreezerOversProfileB[i].OversurrectionCrystMaxDist = Class'Freezer'.default.OversurrectionCrystMaxDist;
	default.FreezerOversProfileB[i].OversurrectionCrystMaxAmount = Class'Freezer'.default.OversurrectionCrystMaxAmount;
	
	default.FreezerOversProfileC[i].OversurrectionIceSpreadLifeTime = Class'Freezer'.default.OversurrectionIceSpreadLifeTime;
	default.FreezerOversProfileC[i].OversurrectionFreezingDmgRate = Class'Freezer'.default.OversurrectionFreezingDmgRate;
	default.FreezerOversProfileC[i].OversurrectionFreezingDmgRadius = Class'Freezer'.default.OversurrectionFreezingDmgRadius;
	default.FreezerOversProfileC[i].OversurrectionFreezingDmg = Class'Freezer'.default.OversurrectionFreezingDmg;
	
	default.FreezerOversProfileD[i].OversurrectionImpaleOdds = Class'Freezer'.default.OversurrectionImpaleOdds;
	default.FreezerOversProfileD[i].OversurrectionImpaleMaxHeight = Class'Freezer'.default.OversurrectionImpaleMaxHeight;
	default.FreezerOversProfileD[i].OversurrectionImpaleDmg = Class'Freezer'.default.OversurrectionImpaleDmg;
	
	default.FreezerOversProfileE[i].OversurrectionRIImpaleOdds = Class'Freezer'.default.OversurrectionRIImpaleOdds;
	default.FreezerOversProfileE[i].OversurrectionRIImpaleRate = Class'Freezer'.default.OversurrectionRIImpaleRate;
	default.FreezerOversProfileE[i].OversurrectionRIImpaleMinHeight = Class'Freezer'.default.OversurrectionRIImpaleMinHeight;
	default.FreezerOversProfileE[i].OversurrectionRIImpaleMaxHeight = Class'Freezer'.default.OversurrectionRIImpaleMaxHeight;
	default.FreezerOversProfileE[i].OversurrectionRIImpaleMinAmount = Class'Freezer'.default.OversurrectionRIImpaleMinAmount;
	default.FreezerOversProfileE[i].OversurrectionRIImpaleMaxAmount = Class'Freezer'.default.OversurrectionRIImpaleMaxAmount;
	
	StaticSaveConfig();
}


defaultproperties
{
	FreezerProfile(0)=(bSinkIceBase=False,bStaticIceBase=False,IceBaseStrength=10)
	FreezerOversProfileA(0)=(enableOversurrection=True,OversurrectionLifeTime=7.500000)
	FreezerOversProfileB(0)=(OversurrectionCrystRate=0.750000,OversurrectionCrystMinDist=400.000000,OversurrectionCrystMaxDist=1000.000000,OversurrectionCrystMaxAmount=3)
	FreezerOversProfileC(0)=(OversurrectionIceSpreadLifeTime=7.000000,OversurrectionFreezingDmg=400,OversurrectionFreezingDmgRate=1.000000,OversurrectionFreezingDmgRadius=500.000000)
	FreezerOversProfileD(0)=(OversurrectionImpaleOdds=0.150000,OversurrectionImpaleMaxHeight=1000.000000,OversurrectionImpaleDmg=300)
	FreezerOversProfileE(0)=(OversurrectionRIImpaleOdds=0.050000,OversurrectionRIImpaleRate=0.350000,OversurrectionRIImpaleMinHeight=100.000000)
	FreezerOversProfileE(0)=(OversurrectionRIImpaleMaxHeight=1000.000000,OversurrectionRIImpaleMinAmount=1,OversurrectionRIImpaleMaxAmount=3)
	
	FreezerProfile(1)=(bSinkIceBase=False,bStaticIceBase=False,IceBaseStrength=20)
	FreezerOversProfileA(1)=(enableOversurrection=True,OversurrectionLifeTime=12.000000)
	FreezerOversProfileB(1)=(OversurrectionCrystRate=1.000000,OversurrectionCrystMinDist=600.000000,OversurrectionCrystMaxDist=1500.000000,OversurrectionCrystMaxAmount=4)
	FreezerOversProfileC(1)=(OversurrectionIceSpreadLifeTime=12.000000,OversurrectionFreezingDmg=1000,OversurrectionFreezingDmgRate=2.000000,OversurrectionFreezingDmgRadius=800.000000)
	FreezerOversProfileD(1)=(OversurrectionImpaleOdds=0.300000,OversurrectionImpaleMaxHeight=1500.000000,OversurrectionImpaleDmg=1000)
	FreezerOversProfileE(1)=(OversurrectionRIImpaleOdds=0.100000,OversurrectionRIImpaleRate=0.500000,OversurrectionRIImpaleMinHeight=200.000000)
	FreezerOversProfileE(1)=(OversurrectionRIImpaleMaxHeight=1500.000000,OversurrectionRIImpaleMinAmount=1,OversurrectionRIImpaleMaxAmount=4)
	
	FreezerProfile(2)=(bSinkIceBase=False,bStaticIceBase=False,IceBaseStrength=30)
	FreezerOversProfileA(2)=(enableOversurrection=True,OversurrectionLifeTime=15.000000)
	FreezerOversProfileB(2)=(OversurrectionCrystRate=1.250000,OversurrectionCrystMinDist=600.000000,OversurrectionCrystMaxDist=2000.000000,OversurrectionCrystMaxAmount=4)
	FreezerOversProfileC(2)=(OversurrectionIceSpreadLifeTime=15.000000,OversurrectionFreezingDmg=1000,OversurrectionFreezingDmgRate=2.000000,OversurrectionFreezingDmgRadius=1000.000000)
	FreezerOversProfileD(2)=(OversurrectionImpaleOdds=0.350000,OversurrectionImpaleMaxHeight=1750.000000,OversurrectionImpaleDmg=2000)
	FreezerOversProfileE(2)=(OversurrectionRIImpaleOdds=0.100000,OversurrectionRIImpaleRate=0.500000,OversurrectionRIImpaleMinHeight=250.000000)
	FreezerOversProfileE(2)=(OversurrectionRIImpaleMaxHeight=1750.000000,OversurrectionRIImpaleMinAmount=1,OversurrectionRIImpaleMaxAmount=4)
	
	FreezerProfile(3)=(bSinkIceBase=False,bStaticIceBase=False,IceBaseStrength=30)
	FreezerOversProfileA(3)=(enableOversurrection=True,OversurrectionLifeTime=20.000000)
	FreezerOversProfileB(3)=(OversurrectionCrystRate=1.250000,OversurrectionCrystMinDist=600.000000,OversurrectionCrystMaxDist=2500.000000,OversurrectionCrystMaxAmount=5)
	FreezerOversProfileC(3)=(OversurrectionIceSpreadLifeTime=20.000000,OversurrectionFreezingDmg=1500,OversurrectionFreezingDmgRate=2.500000,OversurrectionFreezingDmgRadius=1500.000000)
	FreezerOversProfileD(3)=(OversurrectionImpaleOdds=0.450000,OversurrectionImpaleMaxHeight=2000.000000,OversurrectionImpaleDmg=3000)
	FreezerOversProfileE(3)=(OversurrectionRIImpaleOdds=0.150000,OversurrectionRIImpaleRate=0.500000,OversurrectionRIImpaleMinHeight=450.000000)
	FreezerOversProfileE(3)=(OversurrectionRIImpaleMaxHeight=2000.000000,OversurrectionRIImpaleMinAmount=2,OversurrectionRIImpaleMaxAmount=5)
	
	FreezerProfile(4)=(bSinkIceBase=False,bStaticIceBase=False,IceBaseStrength=500)
	FreezerOversProfileA(4)=(enableOversurrection=True,OversurrectionLifeTime=28.000000)
	FreezerOversProfileB(4)=(OversurrectionCrystRate=1.250000,OversurrectionCrystMinDist=1000.000000,OversurrectionCrystMaxDist=3000.000000,OversurrectionCrystMaxAmount=6)
	FreezerOversProfileC(4)=(OversurrectionIceSpreadLifeTime=22.000000,OversurrectionFreezingDmg=2500,OversurrectionFreezingDmgRate=3.500000,OversurrectionFreezingDmgRadius=2500.000000)
	FreezerOversProfileD(4)=(OversurrectionImpaleOdds=0.650000,OversurrectionImpaleMaxHeight=2500.000000,OversurrectionImpaleDmg=4500)
	FreezerOversProfileE(4)=(OversurrectionRIImpaleOdds=0.250000,OversurrectionRIImpaleRate=0.600000,OversurrectionRIImpaleMinHeight=600.000000)
	FreezerOversProfileE(4)=(OversurrectionRIImpaleMaxHeight=2500.000000,OversurrectionRIImpaleMinAmount=2,OversurrectionRIImpaleMaxAmount=6)
	
	FreezerProfile(5)=(bSinkIceBase=False,bStaticIceBase=False,IceBaseStrength=30)
	FreezerOversProfileA(5)=(enableOversurrection=True,OversurrectionLifeTime=15.000000)
	FreezerOversProfileB(5)=(OversurrectionCrystRate=1.250000,OversurrectionCrystMinDist=600.000000,OversurrectionCrystMaxDist=2000.000000,OversurrectionCrystMaxAmount=4)
	FreezerOversProfileC(5)=(OversurrectionIceSpreadLifeTime=15.000000,OversurrectionFreezingDmg=1000,OversurrectionFreezingDmgRate=2.000000,OversurrectionFreezingDmgRadius=1000.000000)
	FreezerOversProfileD(5)=(OversurrectionImpaleOdds=0.350000,OversurrectionImpaleMaxHeight=1750.000000,OversurrectionImpaleDmg=2000)
	FreezerOversProfileE(5)=(OversurrectionRIImpaleOdds=0.100000,OversurrectionRIImpaleRate=0.500000,OversurrectionRIImpaleMinHeight=250.000000)
	FreezerOversProfileE(5)=(OversurrectionRIImpaleMaxHeight=1750.000000,OversurrectionRIImpaleMinAmount=1,OversurrectionRIImpaleMaxAmount=4)
	
	FreezerProfile(6)=(bSinkIceBase=False,bStaticIceBase=False,IceBaseStrength=30)
	FreezerOversProfileA(6)=(enableOversurrection=True,OversurrectionLifeTime=15.000000)
	FreezerOversProfileB(6)=(OversurrectionCrystRate=1.250000,OversurrectionCrystMinDist=600.000000,OversurrectionCrystMaxDist=2000.000000,OversurrectionCrystMaxAmount=4)
	FreezerOversProfileC(6)=(OversurrectionIceSpreadLifeTime=15.000000,OversurrectionFreezingDmg=1000,OversurrectionFreezingDmgRate=2.000000,OversurrectionFreezingDmgRadius=1000.000000)
	FreezerOversProfileD(6)=(OversurrectionImpaleOdds=0.350000,OversurrectionImpaleMaxHeight=1750.000000,OversurrectionImpaleDmg=2000)
	FreezerOversProfileE(6)=(OversurrectionRIImpaleOdds=0.100000,OversurrectionRIImpaleRate=0.500000,OversurrectionRIImpaleMinHeight=250.000000)
	FreezerOversProfileE(6)=(OversurrectionRIImpaleMaxHeight=1750.000000,OversurrectionRIImpaleMinAmount=1,OversurrectionRIImpaleMaxAmount=4)
	
	FreezerProfile(7)=(bSinkIceBase=False,bStaticIceBase=False,IceBaseStrength=30)
	FreezerOversProfileA(7)=(enableOversurrection=True,OversurrectionLifeTime=15.000000)
	FreezerOversProfileB(7)=(OversurrectionCrystRate=1.250000,OversurrectionCrystMinDist=600.000000,OversurrectionCrystMaxDist=2000.000000,OversurrectionCrystMaxAmount=4)
	FreezerOversProfileC(7)=(OversurrectionIceSpreadLifeTime=15.000000,OversurrectionFreezingDmg=1000,OversurrectionFreezingDmgRate=2.000000,OversurrectionFreezingDmgRadius=1000.000000)
	FreezerOversProfileD(7)=(OversurrectionImpaleOdds=0.350000,OversurrectionImpaleMaxHeight=1750.000000,OversurrectionImpaleDmg=2000)
	FreezerOversProfileE(7)=(OversurrectionRIImpaleOdds=0.100000,OversurrectionRIImpaleRate=0.500000,OversurrectionRIImpaleMinHeight=250.000000)
	FreezerOversProfileE(7)=(OversurrectionRIImpaleMaxHeight=1750.000000,OversurrectionRIImpaleMinAmount=1,OversurrectionRIImpaleMaxAmount=4)
}