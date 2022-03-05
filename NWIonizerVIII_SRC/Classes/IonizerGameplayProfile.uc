//////////////////////////////////////////////////////////////
//				Feralidragon (25-09-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerGameplayProfile expands NWProfile config(NWProfilesCfg);

struct IonizerStructA
{
	var() bool enableSatLights, SatelliteIsInvincible, SatelliteAIAwareness;
	var() int SatelliteArmor, SatelliteLaunchSeconds, RocketTakeoffIgnitionDamage;
};
var() config IonizerStructA IonizerProfileA[8];

struct IonizerStructB
{
	var() float PaintTime, MaxAttackDistance, ZoomScanRadius, MinSatelliteHeight, MaxSatelliteHeight;
	var() float MaxSatelliteDeployDist, LauncherLifespan;
};
var() config IonizerStructB IonizerProfileB[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local Ionizer Ion;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'Ionizer'.default.enableSatLights = default.IonizerProfileA[i].enableSatLights;
	Class'Ionizer'.default.SatelliteIsInvincible = default.IonizerProfileA[i].SatelliteIsInvincible;
	Class'Ionizer'.default.SatelliteAIAwareness = default.IonizerProfileA[i].SatelliteAIAwareness;
	Class'Ionizer'.default.SatelliteArmor = default.IonizerProfileA[i].SatelliteArmor;
	Class'Ionizer'.default.SatelliteLaunchSeconds = default.IonizerProfileA[i].SatelliteLaunchSeconds;
	Class'Ionizer'.default.RocketTakeoffIgnitionDamage = default.IonizerProfileA[i].RocketTakeoffIgnitionDamage;
	
	Class'Ionizer'.default.PaintTime = default.IonizerProfileB[i].PaintTime;
	Class'Ionizer'.default.MaxAttackDistance = default.IonizerProfileB[i].MaxAttackDistance;
	Class'Ionizer'.default.ZoomScanRadius = default.IonizerProfileB[i].ZoomScanRadius;
	Class'Ionizer'.default.MinSatelliteHeight = default.IonizerProfileB[i].MinSatelliteHeight;
	Class'Ionizer'.default.MaxSatelliteHeight = default.IonizerProfileB[i].MaxSatelliteHeight;
	Class'Ionizer'.default.MaxSatelliteDeployDist = default.IonizerProfileB[i].MaxSatelliteDeployDist;
	Class'Ionizer'.default.LauncherLifespan = default.IonizerProfileB[i].LauncherLifespan;
	
	if (Lvl == None)
		Class'Ionizer'.static.StaticSaveConfig();
		
		
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'Ionizer', Ion)
		{
			Ion.default.enableSatLights = Class'Ionizer'.default.enableSatLights;
			Ion.enableSatLights = Class'Ionizer'.default.enableSatLights;
			Ion.default.SatelliteIsInvincible = Class'Ionizer'.default.SatelliteIsInvincible;
			Ion.SatelliteIsInvincible = Class'Ionizer'.default.SatelliteIsInvincible;
			Ion.default.SatelliteAIAwareness = Class'Ionizer'.default.SatelliteAIAwareness;
			Ion.SatelliteAIAwareness = Class'Ionizer'.default.SatelliteAIAwareness;
			Ion.default.SatelliteArmor = Class'Ionizer'.default.SatelliteArmor;
			Ion.SatelliteArmor = Class'Ionizer'.default.SatelliteArmor;
			Ion.default.SatelliteLaunchSeconds = Class'Ionizer'.default.SatelliteLaunchSeconds;
			Ion.SatelliteLaunchSeconds = Class'Ionizer'.default.SatelliteLaunchSeconds;
			Ion.default.RocketTakeoffIgnitionDamage = Class'Ionizer'.default.RocketTakeoffIgnitionDamage;
			Ion.RocketTakeoffIgnitionDamage = Class'Ionizer'.default.RocketTakeoffIgnitionDamage;

			Ion.default.PaintTime = Class'Ionizer'.default.PaintTime;
			Ion.PaintTime = Class'Ionizer'.default.PaintTime;
			Ion.default.MaxAttackDistance = Class'Ionizer'.default.MaxAttackDistance;
			Ion.MaxAttackDistance = Class'Ionizer'.default.MaxAttackDistance;
			Ion.default.ZoomScanRadius = Class'Ionizer'.default.ZoomScanRadius;
			Ion.ZoomScanRadius = Class'Ionizer'.default.ZoomScanRadius;
			Ion.default.MinSatelliteHeight = Class'Ionizer'.default.MinSatelliteHeight;
			Ion.MinSatelliteHeight = Class'Ionizer'.default.MinSatelliteHeight;
			Ion.default.MaxSatelliteHeight = Class'Ionizer'.default.MaxSatelliteHeight;
			Ion.MaxSatelliteHeight = Class'Ionizer'.default.MaxSatelliteHeight;
			Ion.default.MaxSatelliteDeployDist = Class'Ionizer'.default.MaxSatelliteDeployDist;
			Ion.MaxSatelliteDeployDist = Class'Ionizer'.default.MaxSatelliteDeployDist;
			Ion.default.LauncherLifespan = Class'Ionizer'.default.LauncherLifespan;
			Ion.LauncherLifespan = Class'Ionizer'.default.LauncherLifespan;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.IonizerProfileA[i].enableSatLights = Class'Ionizer'.default.enableSatLights;
	default.IonizerProfileA[i].SatelliteIsInvincible = Class'Ionizer'.default.SatelliteIsInvincible;
	default.IonizerProfileA[i].SatelliteAIAwareness = Class'Ionizer'.default.SatelliteAIAwareness;
	default.IonizerProfileA[i].SatelliteArmor = Class'Ionizer'.default.SatelliteArmor;
	default.IonizerProfileA[i].SatelliteLaunchSeconds = Class'Ionizer'.default.SatelliteLaunchSeconds;
	default.IonizerProfileA[i].RocketTakeoffIgnitionDamage = Class'Ionizer'.default.RocketTakeoffIgnitionDamage;
	
	default.IonizerProfileB[i].PaintTime = Class'Ionizer'.default.PaintTime;
	default.IonizerProfileB[i].MaxAttackDistance = Class'Ionizer'.default.MaxAttackDistance;
	default.IonizerProfileB[i].ZoomScanRadius = Class'Ionizer'.default.ZoomScanRadius;
	default.IonizerProfileB[i].MinSatelliteHeight = Class'Ionizer'.default.MinSatelliteHeight;
	default.IonizerProfileB[i].MaxSatelliteHeight = Class'Ionizer'.default.MaxSatelliteHeight;
	default.IonizerProfileB[i].MaxSatelliteDeployDist = Class'Ionizer'.default.MaxSatelliteDeployDist;
	default.IonizerProfileB[i].LauncherLifespan = Class'Ionizer'.default.LauncherLifespan;
	
	StaticSaveConfig();
}


defaultproperties
{
	IonizerProfileA(0)=(enableSatLights=True,SatelliteIsInvincible=False,SatelliteAIAwareness=True,SatelliteArmor=250,SatelliteLaunchSeconds=6,RocketTakeoffIgnitionDamage=300)
	IonizerProfileB(0)=(PaintTime=1.500000,MaxAttackDistance=50000.000000,ZoomScanRadius=25000.000000,MinSatelliteHeight=3000.000000)
	IonizerProfileB(0)=(MaxSatelliteHeight=40000.000000,MaxSatelliteDeployDist=768.000000,LauncherLifespan=2.000000)

	IonizerProfileA(1)=(enableSatLights=True,SatelliteIsInvincible=False,SatelliteAIAwareness=True,SatelliteArmor=500,SatelliteLaunchSeconds=5,RocketTakeoffIgnitionDamage=100)
	IonizerProfileB(1)=(PaintTime=1.000000,MaxAttackDistance=50000.000000,ZoomScanRadius=25000.000000,MinSatelliteHeight=3000.000000)
	IonizerProfileB(1)=(MaxSatelliteHeight=40000.000000,MaxSatelliteDeployDist=1024.000000,LauncherLifespan=3.000000)

	IonizerProfileA(2)=(enableSatLights=True,SatelliteIsInvincible=False,SatelliteAIAwareness=True,SatelliteArmor=850,SatelliteLaunchSeconds=5,RocketTakeoffIgnitionDamage=0)
	IonizerProfileB(2)=(PaintTime=1.000000,MaxAttackDistance=50000.000000,ZoomScanRadius=25000.000000,MinSatelliteHeight=3000.000000)
	IonizerProfileB(2)=(MaxSatelliteHeight=40000.000000,MaxSatelliteDeployDist=1024.000000,LauncherLifespan=5.000000)
	
	IonizerProfileA(3)=(enableSatLights=True,SatelliteIsInvincible=False,SatelliteAIAwareness=True,SatelliteArmor=1000,SatelliteLaunchSeconds=5,RocketTakeoffIgnitionDamage=200)
	IonizerProfileB(3)=(PaintTime=1.500000,MaxAttackDistance=50000.000000,ZoomScanRadius=25000.000000,MinSatelliteHeight=3000.000000)
	IonizerProfileB(3)=(MaxSatelliteHeight=40000.000000,MaxSatelliteDeployDist=1024.000000,LauncherLifespan=3.000000)
	
	IonizerProfileA(4)=(enableSatLights=True,SatelliteIsInvincible=True,SatelliteAIAwareness=False,SatelliteArmor=5000,SatelliteLaunchSeconds=7,RocketTakeoffIgnitionDamage=0)
	IonizerProfileB(4)=(PaintTime=1.000000,MaxAttackDistance=50000.000000,ZoomScanRadius=25000.000000,MinSatelliteHeight=3000.000000)
	IonizerProfileB(4)=(MaxSatelliteHeight=40000.000000,MaxSatelliteDeployDist=1500.000000,LauncherLifespan=2.500000)
	
	IonizerProfileA(5)=(enableSatLights=True,SatelliteIsInvincible=False,SatelliteAIAwareness=True,SatelliteArmor=850,SatelliteLaunchSeconds=5,RocketTakeoffIgnitionDamage=0)
	IonizerProfileB(5)=(PaintTime=1.000000,MaxAttackDistance=50000.000000,ZoomScanRadius=25000.000000,MinSatelliteHeight=3000.000000)
	IonizerProfileB(5)=(MaxSatelliteHeight=40000.000000,MaxSatelliteDeployDist=1024.000000,LauncherLifespan=5.000000)
	
	IonizerProfileA(6)=(enableSatLights=True,SatelliteIsInvincible=False,SatelliteAIAwareness=True,SatelliteArmor=850,SatelliteLaunchSeconds=5,RocketTakeoffIgnitionDamage=0)
	IonizerProfileB(6)=(PaintTime=1.000000,MaxAttackDistance=50000.000000,ZoomScanRadius=25000.000000,MinSatelliteHeight=3000.000000)
	IonizerProfileB(6)=(MaxSatelliteHeight=40000.000000,MaxSatelliteDeployDist=1024.000000,LauncherLifespan=5.000000)
	
	IonizerProfileA(7)=(enableSatLights=True,SatelliteIsInvincible=False,SatelliteAIAwareness=True,SatelliteArmor=850,SatelliteLaunchSeconds=5,RocketTakeoffIgnitionDamage=0)
	IonizerProfileB(7)=(PaintTime=1.000000,MaxAttackDistance=50000.000000,ZoomScanRadius=25000.000000,MinSatelliteHeight=3000.000000)
	IonizerProfileB(7)=(MaxSatelliteHeight=40000.000000,MaxSatelliteDeployDist=1024.000000,LauncherLifespan=5.000000)
}