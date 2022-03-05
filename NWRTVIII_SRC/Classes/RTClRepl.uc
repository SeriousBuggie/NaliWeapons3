//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2014)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTClRepl expands NWClRepl;

struct RT_Client
{
	var bool enableTeleportFXSmartPerformance;
};
var RT_Client RT_Settings;


replication
{
	reliable if (Role == ROLE_Authority && bNetOwner)
		RT_Settings;
}


function SetServerReplVars()
{
	RT_Settings.enableTeleportFXSmartPerformance = Class'RT'.default.enableTeleportFXSmartPerformance;
}


simulated function SetClientReplVars(PlayerPawn PP)
{
local RT nRT;
	
	Class'RT'.default.enableTeleportFXSmartPerformance = RT_Settings.enableTeleportFXSmartPerformance;
	foreach AllActors(Class'RT', nRT)
	{
		nRT.default.enableTeleportFXSmartPerformance = RT_Settings.enableTeleportFXSmartPerformance;
		nRT.enableTeleportFXSmartPerformance = RT_Settings.enableTeleportFXSmartPerformance;
	}
}


defaultproperties
{
}