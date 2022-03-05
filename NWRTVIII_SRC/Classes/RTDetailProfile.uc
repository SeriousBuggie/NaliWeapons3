//////////////////////////////////////////////////////////////
//				Feralidragon (23-09-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTDetailProfile expands NWProfile config(NWProfilesCfg);

struct RTDetail
{
	var() bool enableTeleportFXSmartPerformance;
};
var() config RTDetail RTDetailProfile[8];


static function ProcessProfileChange(byte i, optional LevelInfo Lvl)
{
local RT RzT;

	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	Class'RT'.default.enableTeleportFXSmartPerformance = default.RTDetailProfile[i].enableTeleportFXSmartPerformance;
	
	if (Lvl == None)
		Class'RT'.static.StaticSaveConfig();
		
	
	//Load for level
	if (Lvl != None)
	{
		ForEach Lvl.AllActors(Class'RT', RzT)
		{
			RzT.default.enableTeleportFXSmartPerformance = Class'RT'.default.enableTeleportFXSmartPerformance;
			RzT.enableTeleportFXSmartPerformance = Class'RT'.default.enableTeleportFXSmartPerformance;
		}
	}
}


static function ProcessProfileSave(byte i)
{
	if (i >= ArrayCount(default.ProfileNames))
		return;
	
	default.RTDetailProfile[i].enableTeleportFXSmartPerformance = Class'RT'.default.enableTeleportFXSmartPerformance;
	
	StaticSaveConfig();
}


defaultproperties
{
	RTDetailProfile(0)=(enableTeleportFXSmartPerformance=True)
	RTDetailProfile(1)=(enableTeleportFXSmartPerformance=True)
	RTDetailProfile(2)=(enableTeleportFXSmartPerformance=True)
	RTDetailProfile(3)=(enableTeleportFXSmartPerformance=True)
	RTDetailProfile(4)=(enableTeleportFXSmartPerformance=True)
	RTDetailProfile(5)=(enableTeleportFXSmartPerformance=False)
	RTDetailProfile(6)=(enableTeleportFXSmartPerformance=False)
	RTDetailProfile(7)=(enableTeleportFXSmartPerformance=True)
}