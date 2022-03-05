//////////////////////////////////////////////////////////////
//				Feralidragon (26-09-2012)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProtosGameplayProfile expands NWProfile config(NWProfilesCfg);

struct UltimaProtosStruct
{
	var() int LightningsDamage, PassthroughDamage;
};
var() config UltimaProtosStruct UltimaProtosProfile[8];


struct UltimaProtosOversStructA
{
	var() bool enableOversurrection, OversurrectionGameFinisher;
	var() int OversurrectionSolarBirthCoreDmg, OversurrectionSolarMatureCoreDmg;
};
var() config UltimaProtosOversStructA UltimaProtosOversProfileA[8];


struct UltimaProtosOversStructB
{
	var() int OversurrectionSolarSystemCoreDmg, OversurrectionSolarRedGiantCoreDmg, OversurrectionSolarWhiteDwarfCoreDmg;
};
var() config UltimaProtosOversStructB UltimaProtosOversProfileB[8];


struct UltimaProtosOversStructC
{
	var() int OversurrectionSolarMatureRadialMaxDmg, OversurrectionSolarSystemRadialMaxDmg;
	var() int OversurrectionSolarRedGiantRadialMaxDmg, OversurrectionSolarSuperNovaDmg;
};
var() config UltimaProtosOversStructC UltimaProtosOversProfileC[8];


struct UltimaProtosOversStructD
{
	var() float OversurrectionSolarMatureRadialDmgRadius, OversurrectionSolarSystemRadialDmgRadius, OversurrectionSolarRedGiantRadialDmgRadius;
};
var() config UltimaProtosOversStructD UltimaProtosOversProfileD[8];


struct UltimaProtosOversStructE
{
	var() float OversurrectionSolarCoreDmgRate, OversurrectionSolarRadialDmgRate, OversurrectionSolarSuperNovaDmgRate;
};
var() config UltimaProtosOversStructE UltimaProtosOversProfileE[8];



static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local UltimaProtos UP;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'UltimaProtos'.default.LightningsDamage = default.UltimaProtosProfile[i].LightningsDamage;
	Class'UltimaProtos'.default.PassthroughDamage = default.UltimaProtosProfile[i].PassthroughDamage;
	
	Class'UltimaProtos'.default.enableOversurrection = default.UltimaProtosOversProfileA[i].enableOversurrection;
	Class'UltimaProtos'.default.OversurrectionGameFinisher = default.UltimaProtosOversProfileA[i].OversurrectionGameFinisher;
	Class'UltimaProtos'.default.OversurrectionSolarBirthCoreDmg = default.UltimaProtosOversProfileA[i].OversurrectionSolarBirthCoreDmg;
	Class'UltimaProtos'.default.OversurrectionSolarMatureCoreDmg = default.UltimaProtosOversProfileA[i].OversurrectionSolarMatureCoreDmg;
	
	Class'UltimaProtos'.default.OversurrectionSolarSystemCoreDmg = default.UltimaProtosOversProfileB[i].OversurrectionSolarSystemCoreDmg;
	Class'UltimaProtos'.default.OversurrectionSolarRedGiantCoreDmg = default.UltimaProtosOversProfileB[i].OversurrectionSolarRedGiantCoreDmg;
	Class'UltimaProtos'.default.OversurrectionSolarWhiteDwarfCoreDmg = default.UltimaProtosOversProfileB[i].OversurrectionSolarWhiteDwarfCoreDmg;
	
	Class'UltimaProtos'.default.OversurrectionSolarMatureRadialMaxDmg = default.UltimaProtosOversProfileC[i].OversurrectionSolarMatureRadialMaxDmg;
	Class'UltimaProtos'.default.OversurrectionSolarSystemRadialMaxDmg = default.UltimaProtosOversProfileC[i].OversurrectionSolarSystemRadialMaxDmg;
	Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialMaxDmg = default.UltimaProtosOversProfileC[i].OversurrectionSolarRedGiantRadialMaxDmg;
	Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmg = default.UltimaProtosOversProfileC[i].OversurrectionSolarSuperNovaDmg;
	
	Class'UltimaProtos'.default.OversurrectionSolarMatureRadialDmgRadius = default.UltimaProtosOversProfileD[i].OversurrectionSolarMatureRadialDmgRadius;
	Class'UltimaProtos'.default.OversurrectionSolarSystemRadialDmgRadius = default.UltimaProtosOversProfileD[i].OversurrectionSolarSystemRadialDmgRadius;
	Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialDmgRadius = default.UltimaProtosOversProfileD[i].OversurrectionSolarRedGiantRadialDmgRadius;
	
	Class'UltimaProtos'.default.OversurrectionSolarCoreDmgRate = default.UltimaProtosOversProfileE[i].OversurrectionSolarCoreDmgRate;
	Class'UltimaProtos'.default.OversurrectionSolarRadialDmgRate = default.UltimaProtosOversProfileE[i].OversurrectionSolarRadialDmgRate;
	Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmgRate = default.UltimaProtosOversProfileE[i].OversurrectionSolarSuperNovaDmgRate;
	
	if (Lvl == None)
		Class'UltimaProtos'.static.StaticSaveConfig();
		
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'UltimaProtos', UP)
		{
			UP.default.LightningsDamage = Class'UltimaProtos'.default.LightningsDamage;
			UP.LightningsDamage = Class'UltimaProtos'.default.LightningsDamage;
			UP.default.PassthroughDamage = Class'UltimaProtos'.default.PassthroughDamage;
			UP.PassthroughDamage = Class'UltimaProtos'.default.PassthroughDamage;
			
			UP.default.enableOversurrection = Class'UltimaProtos'.default.enableOversurrection;
			UP.enableOversurrection = Class'UltimaProtos'.default.enableOversurrection;
			UP.default.OversurrectionGameFinisher = Class'UltimaProtos'.default.OversurrectionGameFinisher;
			UP.OversurrectionGameFinisher = Class'UltimaProtos'.default.OversurrectionGameFinisher;
			UP.default.OversurrectionSolarBirthCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarBirthCoreDmg;
			UP.OversurrectionSolarBirthCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarBirthCoreDmg;
			UP.default.OversurrectionSolarMatureCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarMatureCoreDmg;
			UP.OversurrectionSolarMatureCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarMatureCoreDmg;
			UP.default.OversurrectionSolarSystemCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarSystemCoreDmg;
			UP.OversurrectionSolarSystemCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarSystemCoreDmg;
			UP.default.OversurrectionSolarRedGiantCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarRedGiantCoreDmg;
			UP.OversurrectionSolarRedGiantCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarRedGiantCoreDmg;
			UP.default.OversurrectionSolarWhiteDwarfCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarWhiteDwarfCoreDmg;
			UP.OversurrectionSolarWhiteDwarfCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarWhiteDwarfCoreDmg;
			UP.default.OversurrectionSolarMatureRadialMaxDmg = Class'UltimaProtos'.default.OversurrectionSolarMatureRadialMaxDmg;
			UP.OversurrectionSolarMatureRadialMaxDmg = Class'UltimaProtos'.default.OversurrectionSolarMatureRadialMaxDmg;
			UP.default.OversurrectionSolarSystemRadialMaxDmg = Class'UltimaProtos'.default.OversurrectionSolarSystemRadialMaxDmg;
			UP.OversurrectionSolarSystemRadialMaxDmg = Class'UltimaProtos'.default.OversurrectionSolarSystemRadialMaxDmg;
			UP.default.OversurrectionSolarRedGiantRadialMaxDmg = Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialMaxDmg;
			UP.OversurrectionSolarRedGiantRadialMaxDmg = Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialMaxDmg;
			UP.default.OversurrectionSolarSuperNovaDmg = Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmg;
			UP.OversurrectionSolarSuperNovaDmg = Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmg;
			UP.default.OversurrectionSolarMatureRadialDmgRadius = Class'UltimaProtos'.default.OversurrectionSolarMatureRadialDmgRadius;
			UP.OversurrectionSolarMatureRadialDmgRadius = Class'UltimaProtos'.default.OversurrectionSolarMatureRadialDmgRadius;
			UP.default.OversurrectionSolarSystemRadialDmgRadius = Class'UltimaProtos'.default.OversurrectionSolarSystemRadialDmgRadius;
			UP.OversurrectionSolarSystemRadialDmgRadius = Class'UltimaProtos'.default.OversurrectionSolarSystemRadialDmgRadius;
			UP.default.OversurrectionSolarRedGiantRadialDmgRadius = Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialDmgRadius;
			UP.OversurrectionSolarRedGiantRadialDmgRadius = Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialDmgRadius;
			UP.default.OversurrectionSolarCoreDmgRate = Class'UltimaProtos'.default.OversurrectionSolarCoreDmgRate;
			UP.OversurrectionSolarCoreDmgRate = Class'UltimaProtos'.default.OversurrectionSolarCoreDmgRate;
			UP.default.OversurrectionSolarRadialDmgRate = Class'UltimaProtos'.default.OversurrectionSolarRadialDmgRate;
			UP.OversurrectionSolarRadialDmgRate = Class'UltimaProtos'.default.OversurrectionSolarRadialDmgRate;
			UP.default.OversurrectionSolarSuperNovaDmgRate = Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmgRate;
			UP.OversurrectionSolarSuperNovaDmgRate = Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmgRate;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.UltimaProtosProfile[i].LightningsDamage = Class'UltimaProtos'.default.LightningsDamage;
	default.UltimaProtosProfile[i].PassthroughDamage = Class'UltimaProtos'.default.PassthroughDamage;
	
	default.UltimaProtosOversProfileA[i].enableOversurrection = Class'UltimaProtos'.default.enableOversurrection;
	default.UltimaProtosOversProfileA[i].OversurrectionGameFinisher = Class'UltimaProtos'.default.OversurrectionGameFinisher;
	default.UltimaProtosOversProfileA[i].OversurrectionSolarBirthCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarBirthCoreDmg;
	default.UltimaProtosOversProfileA[i].OversurrectionSolarMatureCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarMatureCoreDmg;
	
	default.UltimaProtosOversProfileB[i].OversurrectionSolarSystemCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarSystemCoreDmg;
	default.UltimaProtosOversProfileB[i].OversurrectionSolarRedGiantCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarRedGiantCoreDmg;
	default.UltimaProtosOversProfileB[i].OversurrectionSolarWhiteDwarfCoreDmg = Class'UltimaProtos'.default.OversurrectionSolarWhiteDwarfCoreDmg;
	
	default.UltimaProtosOversProfileC[i].OversurrectionSolarMatureRadialMaxDmg = Class'UltimaProtos'.default.OversurrectionSolarMatureRadialMaxDmg;
	default.UltimaProtosOversProfileC[i].OversurrectionSolarSystemRadialMaxDmg = Class'UltimaProtos'.default.OversurrectionSolarSystemRadialMaxDmg;
	default.UltimaProtosOversProfileC[i].OversurrectionSolarRedGiantRadialMaxDmg = Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialMaxDmg;
	default.UltimaProtosOversProfileC[i].OversurrectionSolarSuperNovaDmg = Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmg;
	
	default.UltimaProtosOversProfileD[i].OversurrectionSolarMatureRadialDmgRadius = Class'UltimaProtos'.default.OversurrectionSolarMatureRadialDmgRadius;
	default.UltimaProtosOversProfileD[i].OversurrectionSolarSystemRadialDmgRadius = Class'UltimaProtos'.default.OversurrectionSolarSystemRadialDmgRadius;
	default.UltimaProtosOversProfileD[i].OversurrectionSolarRedGiantRadialDmgRadius = Class'UltimaProtos'.default.OversurrectionSolarRedGiantRadialDmgRadius;
	
	default.UltimaProtosOversProfileE[i].OversurrectionSolarCoreDmgRate = Class'UltimaProtos'.default.OversurrectionSolarCoreDmgRate;
	default.UltimaProtosOversProfileE[i].OversurrectionSolarRadialDmgRate = Class'UltimaProtos'.default.OversurrectionSolarRadialDmgRate;
	default.UltimaProtosOversProfileE[i].OversurrectionSolarSuperNovaDmgRate = Class'UltimaProtos'.default.OversurrectionSolarSuperNovaDmgRate;	
	
	StaticSaveConfig();
}


defaultproperties
{
	UltimaProtosProfile(0)=(LightningsDamage=100,PassthroughDamage=0)
	UltimaProtosOversProfileA(0)=(enableOversurrection=True,OversurrectionGameFinisher=False,OversurrectionSolarBirthCoreDmg=5000,OversurrectionSolarMatureCoreDmg=5000)
	UltimaProtosOversProfileB(0)=(OversurrectionSolarSystemCoreDmg=25000,OversurrectionSolarRedGiantCoreDmg=50000,OversurrectionSolarWhiteDwarfCoreDmg=32500)
	UltimaProtosOversProfileC(0)=(OversurrectionSolarMatureRadialMaxDmg=20,OversurrectionSolarSystemRadialMaxDmg=50,OversurrectionSolarRedGiantRadialMaxDmg=100,OversurrectionSolarSuperNovaDmg=50000)
	UltimaProtosOversProfileD(0)=(OversurrectionSolarMatureRadialDmgRadius=2000.000000,OversurrectionSolarSystemRadialDmgRadius=4000.000000,OversurrectionSolarRedGiantRadialDmgRadius=8000.000000)
	UltimaProtosOversProfileE(0)=(OversurrectionSolarCoreDmgRate=1.250000,OversurrectionSolarRadialDmgRate=1.250000,OversurrectionSolarSuperNovaDmgRate=2.500000)
	
	UltimaProtosProfile(1)=(LightningsDamage=500,PassthroughDamage=100)
	UltimaProtosOversProfileA(1)=(enableOversurrection=True,OversurrectionGameFinisher=False,OversurrectionSolarBirthCoreDmg=15000,OversurrectionSolarMatureCoreDmg=50000)
	UltimaProtosOversProfileB(1)=(OversurrectionSolarSystemCoreDmg=250000,OversurrectionSolarRedGiantCoreDmg=500000,OversurrectionSolarWhiteDwarfCoreDmg=325000)
	UltimaProtosOversProfileC(1)=(OversurrectionSolarMatureRadialMaxDmg=200,OversurrectionSolarSystemRadialMaxDmg=500,OversurrectionSolarRedGiantRadialMaxDmg=1000,OversurrectionSolarSuperNovaDmg=500000)
	UltimaProtosOversProfileD(1)=(OversurrectionSolarMatureRadialDmgRadius=4000.000000,OversurrectionSolarSystemRadialDmgRadius=8000.000000,OversurrectionSolarRedGiantRadialDmgRadius=17500.000000)
	UltimaProtosOversProfileE(1)=(OversurrectionSolarCoreDmgRate=2.500000,OversurrectionSolarRadialDmgRate=2.500000,OversurrectionSolarSuperNovaDmgRate=5.000000)
	
	UltimaProtosProfile(2)=(LightningsDamage=1000,PassthroughDamage=1000)
	UltimaProtosOversProfileA(2)=(enableOversurrection=True,OversurrectionGameFinisher=True,OversurrectionSolarBirthCoreDmg=30000,OversurrectionSolarMatureCoreDmg=100000)
	UltimaProtosOversProfileB(2)=(OversurrectionSolarSystemCoreDmg=500000,OversurrectionSolarRedGiantCoreDmg=1000000,OversurrectionSolarWhiteDwarfCoreDmg=750000)
	UltimaProtosOversProfileC(2)=(OversurrectionSolarMatureRadialMaxDmg=400,OversurrectionSolarSystemRadialMaxDmg=1000,OversurrectionSolarRedGiantRadialMaxDmg=2000,OversurrectionSolarSuperNovaDmg=9000000)
	UltimaProtosOversProfileD(2)=(OversurrectionSolarMatureRadialDmgRadius=8000.000000,OversurrectionSolarSystemRadialDmgRadius=16000.000000,OversurrectionSolarRedGiantRadialDmgRadius=35000.000000)
	UltimaProtosOversProfileE(2)=(OversurrectionSolarCoreDmgRate=5.000000,OversurrectionSolarRadialDmgRate=5.000000,OversurrectionSolarSuperNovaDmgRate=10.000000)
	
	UltimaProtosProfile(3)=(LightningsDamage=700,PassthroughDamage=1000)
	UltimaProtosOversProfileA(3)=(enableOversurrection=True,OversurrectionGameFinisher=True,OversurrectionSolarBirthCoreDmg=50000,OversurrectionSolarMatureCoreDmg=800000)
	UltimaProtosOversProfileB(3)=(OversurrectionSolarSystemCoreDmg=800000,OversurrectionSolarRedGiantCoreDmg=2000000,OversurrectionSolarWhiteDwarfCoreDmg=750000)
	UltimaProtosOversProfileC(3)=(OversurrectionSolarMatureRadialMaxDmg=600,OversurrectionSolarSystemRadialMaxDmg=1500,OversurrectionSolarRedGiantRadialMaxDmg=4000,OversurrectionSolarSuperNovaDmg=9000000)
	UltimaProtosOversProfileD(3)=(OversurrectionSolarMatureRadialDmgRadius=8000.000000,OversurrectionSolarSystemRadialDmgRadius=16000.000000,OversurrectionSolarRedGiantRadialDmgRadius=35000.000000)
	UltimaProtosOversProfileE(3)=(OversurrectionSolarCoreDmgRate=5.000000,OversurrectionSolarRadialDmgRate=5.000000,OversurrectionSolarSuperNovaDmgRate=10.000000)
	
	UltimaProtosProfile(4)=(LightningsDamage=8000,PassthroughDamage=10000)
	UltimaProtosOversProfileA(4)=(enableOversurrection=True,OversurrectionGameFinisher=True,OversurrectionSolarBirthCoreDmg=100000,OversurrectionSolarMatureCoreDmg=1000000)
	UltimaProtosOversProfileB(4)=(OversurrectionSolarSystemCoreDmg=5000000,OversurrectionSolarRedGiantCoreDmg=100000000,OversurrectionSolarWhiteDwarfCoreDmg=75000000)
	UltimaProtosOversProfileC(4)=(OversurrectionSolarMatureRadialMaxDmg=4000,OversurrectionSolarSystemRadialMaxDmg=10000,OversurrectionSolarRedGiantRadialMaxDmg=20000,OversurrectionSolarSuperNovaDmg=90000000)
	UltimaProtosOversProfileD(4)=(OversurrectionSolarMatureRadialDmgRadius=12000.000000,OversurrectionSolarSystemRadialDmgRadius=24000.000000,OversurrectionSolarRedGiantRadialDmgRadius=42000.000000)
	UltimaProtosOversProfileE(4)=(OversurrectionSolarCoreDmgRate=5.000000,OversurrectionSolarRadialDmgRate=5.000000,OversurrectionSolarSuperNovaDmgRate=10.000000)
	
	UltimaProtosProfile(5)=(LightningsDamage=1000,PassthroughDamage=1000)
	UltimaProtosOversProfileA(5)=(enableOversurrection=True,OversurrectionGameFinisher=True,OversurrectionSolarBirthCoreDmg=30000,OversurrectionSolarMatureCoreDmg=100000)
	UltimaProtosOversProfileB(5)=(OversurrectionSolarSystemCoreDmg=500000,OversurrectionSolarRedGiantCoreDmg=1000000,OversurrectionSolarWhiteDwarfCoreDmg=750000)
	UltimaProtosOversProfileC(5)=(OversurrectionSolarMatureRadialMaxDmg=400,OversurrectionSolarSystemRadialMaxDmg=1000,OversurrectionSolarRedGiantRadialMaxDmg=2000,OversurrectionSolarSuperNovaDmg=9000000)
	UltimaProtosOversProfileD(5)=(OversurrectionSolarMatureRadialDmgRadius=8000.000000,OversurrectionSolarSystemRadialDmgRadius=16000.000000,OversurrectionSolarRedGiantRadialDmgRadius=35000.000000)
	UltimaProtosOversProfileE(5)=(OversurrectionSolarCoreDmgRate=5.000000,OversurrectionSolarRadialDmgRate=5.000000,OversurrectionSolarSuperNovaDmgRate=10.000000)
	
	UltimaProtosProfile(6)=(LightningsDamage=1000,PassthroughDamage=1000)
	UltimaProtosOversProfileA(6)=(enableOversurrection=True,OversurrectionGameFinisher=True,OversurrectionSolarBirthCoreDmg=30000,OversurrectionSolarMatureCoreDmg=100000)
	UltimaProtosOversProfileB(6)=(OversurrectionSolarSystemCoreDmg=500000,OversurrectionSolarRedGiantCoreDmg=1000000,OversurrectionSolarWhiteDwarfCoreDmg=750000)
	UltimaProtosOversProfileC(6)=(OversurrectionSolarMatureRadialMaxDmg=400,OversurrectionSolarSystemRadialMaxDmg=1000,OversurrectionSolarRedGiantRadialMaxDmg=2000,OversurrectionSolarSuperNovaDmg=9000000)
	UltimaProtosOversProfileD(6)=(OversurrectionSolarMatureRadialDmgRadius=8000.000000,OversurrectionSolarSystemRadialDmgRadius=16000.000000,OversurrectionSolarRedGiantRadialDmgRadius=35000.000000)
	UltimaProtosOversProfileE(6)=(OversurrectionSolarCoreDmgRate=5.000000,OversurrectionSolarRadialDmgRate=5.000000,OversurrectionSolarSuperNovaDmgRate=10.000000)
	
	UltimaProtosProfile(7)=(LightningsDamage=1000,PassthroughDamage=1000)
	UltimaProtosOversProfileA(7)=(enableOversurrection=True,OversurrectionGameFinisher=True,OversurrectionSolarBirthCoreDmg=30000,OversurrectionSolarMatureCoreDmg=100000)
	UltimaProtosOversProfileB(7)=(OversurrectionSolarSystemCoreDmg=500000,OversurrectionSolarRedGiantCoreDmg=1000000,OversurrectionSolarWhiteDwarfCoreDmg=750000)
	UltimaProtosOversProfileC(7)=(OversurrectionSolarMatureRadialMaxDmg=400,OversurrectionSolarSystemRadialMaxDmg=1000,OversurrectionSolarRedGiantRadialMaxDmg=2000,OversurrectionSolarSuperNovaDmg=9000000)
	UltimaProtosOversProfileD(7)=(OversurrectionSolarMatureRadialDmgRadius=8000.000000,OversurrectionSolarSystemRadialDmgRadius=16000.000000,OversurrectionSolarRedGiantRadialDmgRadius=35000.000000)
	UltimaProtosOversProfileE(7)=(OversurrectionSolarCoreDmgRate=5.000000,OversurrectionSolarRadialDmgRate=5.000000,OversurrectionSolarSuperNovaDmgRate=10.000000)
}