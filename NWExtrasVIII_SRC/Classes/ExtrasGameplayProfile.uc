//////////////////////////////////////////////////////////////
//				Feralidragon (30-09-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class ExtrasGameplayProfile expands NWProfile config(NWProfilesCfg);

struct HealthStruct
{
	var() int MedHealthPoints, VialHealthPoints, SuperHealthPoints;
};
var() config HealthStruct HealthProfile[8];

struct ArmorStruct
{
	var() int BodyArmorPoints, ThighPadsPoints, ShieldBeltPoints;
	var() int BodyArmorAbsPerc, ThighPadsAbsPerc, ShieldBeltAbsPerc;
};
var() config ArmorStruct ArmorProfile[8];

struct SpecialStruct
{
	var() int Jumps, MaxJumps, UDamActiveTime, UDamMaxActiveTime, InvisActiveTime, InvisMaxActiveTime;
	var() float DamageMultiplier, JumpMultiplier;
};
var() config SpecialStruct SpecialProfile[8];



static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local NaliPickups NP;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'NWMedPickup'.default.HealthPoints = default.HealthProfile[i].MedHealthPoints;
	if (Lvl == None)
		Class'NWMedPickup'.static.StaticSaveConfig();
	
	Class'NWVial'.default.HealthPoints = default.HealthProfile[i].VialHealthPoints;
	if (Lvl == None)
		Class'NWVial'.static.StaticSaveConfig();
	
	Class'NWSuperHealth'.default.HealthPoints = default.HealthProfile[i].SuperHealthPoints;
	if (Lvl == None)
		Class'NWSuperHealth'.static.StaticSaveConfig();
	
	Class'NWThighPads'.default.ArmorPoints = default.ArmorProfile[i].ThighPadsPoints;
	Class'NWThighPads'.default.AbsorptionPercentage = default.ArmorProfile[i].ThighPadsAbsPerc;
	if (Lvl == None)
		Class'NWThighPads'.static.StaticSaveConfig();
	
	Class'NWArmor'.default.ArmorPoints = default.ArmorProfile[i].BodyArmorPoints;
	Class'NWArmor'.default.AbsorptionPercentage = default.ArmorProfile[i].BodyArmorAbsPerc;
	if (Lvl == None)
		Class'NWArmor'.static.StaticSaveConfig();
	
	Class'NWShieldBelt'.default.ArmorPoints = default.ArmorProfile[i].ShieldBeltPoints;
	Class'NWShieldBelt'.default.AbsorptionPercentage = default.ArmorProfile[i].ShieldBeltAbsPerc;
	if (Lvl == None)
		Class'NWShieldBelt'.static.StaticSaveConfig();
	
	Class'NWJumpBoots'.default.Jumps = default.SpecialProfile[i].Jumps;
	Class'NWJumpBoots'.default.MaxJumps = default.SpecialProfile[i].MaxJumps;
	Class'NWJumpBoots'.default.JumpMultiplier = default.SpecialProfile[i].JumpMultiplier;
	if (Lvl == None)
		Class'NWJumpBoots'.static.StaticSaveConfig();
	
	Class'NWUDamage'.default.ActiveTime = default.SpecialProfile[i].UDamActiveTime;
	Class'NWUDamage'.default.MaxActiveTime = default.SpecialProfile[i].UDamMaxActiveTime;
	Class'NWUDamage'.default.DamageMultiplier = default.SpecialProfile[i].DamageMultiplier;
	if (Lvl == None)
		Class'NWUDamage'.static.StaticSaveConfig();
	
	Class'NWInvisibility'.default.ActiveTime = default.SpecialProfile[i].InvisActiveTime;
	Class'NWInvisibility'.default.MaxActiveTime = default.SpecialProfile[i].InvisMaxActiveTime;
	if (Lvl == None)
		Class'NWInvisibility'.static.StaticSaveConfig();
		
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'NaliPickups', NP)
		{
			if (NWMedPickup(NP) != None)
			{
				NWMedPickup(NP).default.HealthPoints = Class'NWMedPickup'.default.HealthPoints;
				NWMedPickup(NP).HealthPoints = Class'NWMedPickup'.default.HealthPoints;
			}
			else if (NWVial(NP) != None)
			{
				NWVial(NP).default.HealthPoints = Class'NWVial'.default.HealthPoints;
				NWVial(NP).HealthPoints = Class'NWVial'.default.HealthPoints;
			}
			else if (NWSuperHealth(NP) != None)
			{
				NWSuperHealth(NP).default.HealthPoints = Class'NWSuperHealth'.default.HealthPoints;
				NWSuperHealth(NP).HealthPoints = Class'NWSuperHealth'.default.HealthPoints;
			}
			else if (NWThighPads(NP) != None)
			{
				NWThighPads(NP).default.ArmorPoints = Class'NWThighPads'.default.ArmorPoints;
				NWThighPads(NP).ArmorPoints = Class'NWThighPads'.default.ArmorPoints;
				NWThighPads(NP).default.AbsorptionPercentage = Class'NWThighPads'.default.AbsorptionPercentage;
				NWThighPads(NP).AbsorptionPercentage = Class'NWThighPads'.default.AbsorptionPercentage;
			}
			else if (NWArmor(NP) != None)
			{
				NWArmor(NP).default.ArmorPoints = Class'NWArmor'.default.ArmorPoints;
				NWArmor(NP).ArmorPoints = Class'NWArmor'.default.ArmorPoints;
				NWArmor(NP).default.AbsorptionPercentage = Class'NWArmor'.default.AbsorptionPercentage;
				NWArmor(NP).AbsorptionPercentage = Class'NWArmor'.default.AbsorptionPercentage;
			}
			else if (NWShieldBelt(NP) != None)
			{
				NWShieldBelt(NP).default.ArmorPoints = Class'NWShieldBelt'.default.ArmorPoints;
				NWShieldBelt(NP).ArmorPoints = Class'NWShieldBelt'.default.ArmorPoints;
				NWShieldBelt(NP).default.AbsorptionPercentage = Class'NWShieldBelt'.default.AbsorptionPercentage;
				NWShieldBelt(NP).AbsorptionPercentage = Class'NWShieldBelt'.default.AbsorptionPercentage;
			}
			else if (NWJumpBoots(NP) != None)
			{
				NWJumpBoots(NP).default.Jumps = Class'NWJumpBoots'.default.Jumps;
				NWJumpBoots(NP).Jumps = Class'NWJumpBoots'.default.Jumps;
				NWJumpBoots(NP).default.MaxJumps = Class'NWJumpBoots'.default.MaxJumps;
				NWJumpBoots(NP).MaxJumps = Class'NWJumpBoots'.default.MaxJumps;
				NWJumpBoots(NP).default.JumpMultiplier = Class'NWJumpBoots'.default.JumpMultiplier;
				NWJumpBoots(NP).JumpMultiplier = Class'NWJumpBoots'.default.JumpMultiplier;
			}
			else if (NWUDamage(NP) != None)
			{
				NWUDamage(NP).default.ActiveTime = Class'NWUDamage'.default.ActiveTime;
				NWUDamage(NP).ActiveTime = Class'NWUDamage'.default.ActiveTime;
				NWUDamage(NP).default.MaxActiveTime = Class'NWUDamage'.default.MaxActiveTime;
				NWUDamage(NP).MaxActiveTime = Class'NWUDamage'.default.MaxActiveTime;
				NWUDamage(NP).default.DamageMultiplier = Class'NWUDamage'.default.DamageMultiplier;
				NWUDamage(NP).DamageMultiplier = Class'NWUDamage'.default.DamageMultiplier;
			}
			else if (NWInvisibility(NP) != None)
			{
				NWInvisibility(NP).default.ActiveTime = Class'NWInvisibility'.default.ActiveTime;
				NWInvisibility(NP).ActiveTime = Class'NWInvisibility'.default.ActiveTime;
				NWInvisibility(NP).default.MaxActiveTime = Class'NWInvisibility'.default.MaxActiveTime;
				NWInvisibility(NP).MaxActiveTime = Class'NWInvisibility'.default.MaxActiveTime;
			}
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.HealthProfile[i].MedHealthPoints = Class'NWMedPickup'.default.HealthPoints;
	default.HealthProfile[i].VialHealthPoints = Class'NWVial'.default.HealthPoints;
	default.HealthProfile[i].SuperHealthPoints = Class'NWSuperHealth'.default.HealthPoints;
	
	default.ArmorProfile[i].ThighPadsPoints = Class'NWThighPads'.default.ArmorPoints;
	default.ArmorProfile[i].ThighPadsAbsPerc = Class'NWThighPads'.default.AbsorptionPercentage;
	default.ArmorProfile[i].BodyArmorPoints = Class'NWArmor'.default.ArmorPoints;
	default.ArmorProfile[i].BodyArmorAbsPerc = Class'NWArmor'.default.AbsorptionPercentage;
	default.ArmorProfile[i].ShieldBeltPoints = Class'NWShieldBelt'.default.ArmorPoints;
	default.ArmorProfile[i].ShieldBeltAbsPerc = Class'NWShieldBelt'.default.AbsorptionPercentage;
	
	default.SpecialProfile[i].Jumps = Class'NWJumpBoots'.default.Jumps;
	default.SpecialProfile[i].MaxJumps = Class'NWJumpBoots'.default.MaxJumps;
	default.SpecialProfile[i].UDamActiveTime = Class'NWUDamage'.default.ActiveTime;
	default.SpecialProfile[i].UDamMaxActiveTime = Class'NWUDamage'.default.MaxActiveTime;
	default.SpecialProfile[i].InvisActiveTime = Class'NWInvisibility'.default.ActiveTime;
	default.SpecialProfile[i].InvisMaxActiveTime = Class'NWInvisibility'.default.MaxActiveTime;
	default.SpecialProfile[i].DamageMultiplier = Class'NWUDamage'.default.DamageMultiplier;
	default.SpecialProfile[i].JumpMultiplier = Class'NWJumpBoots'.default.JumpMultiplier;
	
	StaticSaveConfig();
}


defaultproperties
{
	HealthProfile(0)=(MedHealthPoints=20,VialHealthPoints=5,SuperHealthPoints=100)
	HealthProfile(1)=(MedHealthPoints=20,VialHealthPoints=5,SuperHealthPoints=100)
	HealthProfile(2)=(MedHealthPoints=22,VialHealthPoints=6,SuperHealthPoints=125)
	HealthProfile(3)=(MedHealthPoints=30,VialHealthPoints=7,SuperHealthPoints=150)
	HealthProfile(4)=(MedHealthPoints=100,VialHealthPoints=50,SuperHealthPoints=500)
	HealthProfile(5)=(MedHealthPoints=22,VialHealthPoints=6,SuperHealthPoints=125)
	HealthProfile(6)=(MedHealthPoints=22,VialHealthPoints=6,SuperHealthPoints=125)
	HealthProfile(7)=(MedHealthPoints=22,VialHealthPoints=6,SuperHealthPoints=125)
	
	ArmorProfile(0)=(ThighPadsPoints=50,BodyArmorPoints=100,ShieldBeltPoints=150,BodyArmorAbsPerc=75,ThighPadsAbsPerc=50,ShieldBeltAbsPerc=100)
	ArmorProfile(1)=(ThighPadsPoints=50,BodyArmorPoints=100,ShieldBeltPoints=150,BodyArmorAbsPerc=75,ThighPadsAbsPerc=50,ShieldBeltAbsPerc=100)
	ArmorProfile(2)=(ThighPadsPoints=50,BodyArmorPoints=100,ShieldBeltPoints=150,BodyArmorAbsPerc=75,ThighPadsAbsPerc=50,ShieldBeltAbsPerc=100)
	ArmorProfile(3)=(ThighPadsPoints=50,BodyArmorPoints=100,ShieldBeltPoints=150,BodyArmorAbsPerc=75,ThighPadsAbsPerc=50,ShieldBeltAbsPerc=100)
	ArmorProfile(4)=(ThighPadsPoints=75,BodyArmorPoints=200,ShieldBeltPoints=250,BodyArmorAbsPerc=95,ThighPadsAbsPerc=75,ShieldBeltAbsPerc=100)
	ArmorProfile(5)=(ThighPadsPoints=50,BodyArmorPoints=100,ShieldBeltPoints=150,BodyArmorAbsPerc=75,ThighPadsAbsPerc=50,ShieldBeltAbsPerc=100)
	ArmorProfile(6)=(ThighPadsPoints=50,BodyArmorPoints=100,ShieldBeltPoints=150,BodyArmorAbsPerc=75,ThighPadsAbsPerc=50,ShieldBeltAbsPerc=100)
	ArmorProfile(7)=(ThighPadsPoints=50,BodyArmorPoints=100,ShieldBeltPoints=150,BodyArmorAbsPerc=75,ThighPadsAbsPerc=50,ShieldBeltAbsPerc=100)
	
	SpecialProfile(0)=(Jumps=3,MaxJumps=3,UDamActiveTime=30,UDamMaxActiveTime=30,InvisActiveTime=40,InvisMaxActiveTime=40,DamageMultiplier=2.000000,JumpMultiplier=2.500000)
	SpecialProfile(1)=(Jumps=3,MaxJumps=6,UDamActiveTime=30,UDamMaxActiveTime=60,InvisActiveTime=40,InvisMaxActiveTime=80,DamageMultiplier=3.000000,JumpMultiplier=3.000000)
	SpecialProfile(2)=(Jumps=3,MaxJumps=9,UDamActiveTime=30,UDamMaxActiveTime=90,InvisActiveTime=40,InvisMaxActiveTime=120,DamageMultiplier=3.000000,JumpMultiplier=3.000000)
	SpecialProfile(3)=(Jumps=4,MaxJumps=12,UDamActiveTime=40,UDamMaxActiveTime=120,InvisActiveTime=50,InvisMaxActiveTime=150,DamageMultiplier=3.000000,JumpMultiplier=3.000000)
	SpecialProfile(4)=(Jumps=5,MaxJumps=15,UDamActiveTime=50,UDamMaxActiveTime=150,InvisActiveTime=60,InvisMaxActiveTime=180,DamageMultiplier=5.000000,JumpMultiplier=5.000000)
	SpecialProfile(5)=(Jumps=3,MaxJumps=9,UDamActiveTime=30,UDamMaxActiveTime=90,InvisActiveTime=40,InvisMaxActiveTime=120,DamageMultiplier=3.000000,JumpMultiplier=3.000000)
	SpecialProfile(6)=(Jumps=3,MaxJumps=9,UDamActiveTime=30,UDamMaxActiveTime=90,InvisActiveTime=40,InvisMaxActiveTime=120,DamageMultiplier=3.000000,JumpMultiplier=3.000000)
	SpecialProfile(7)=(Jumps=3,MaxJumps=9,UDamActiveTime=30,UDamMaxActiveTime=90,InvisActiveTime=40,InvisMaxActiveTime=120,DamageMultiplier=3.000000,JumpMultiplier=3.000000)
}