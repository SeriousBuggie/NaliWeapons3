//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2014)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanClRepl expands NWClRepl;

struct Vulcan_Client
{
	var bool enableOverheatMsg;
};
var Vulcan_Client Vulcan_Settings;


replication
{
	reliable if (Role == ROLE_Authority && bNetOwner)
		Vulcan_Settings;
}


function SetServerReplVars()
{
	Vulcan_Settings.enableOverheatMsg = Class'Vulcan'.default.enableOverheatMsg;
}


simulated function SetClientReplVars(PlayerPawn PP)
{
local Vulcan nVulcan;
	
	Class'Vulcan'.default.enableOverheatMsg = Vulcan_Settings.enableOverheatMsg;
	foreach AllActors(Class'Vulcan', nVulcan)
	{
		nVulcan.default.enableOverheatMsg = Vulcan_Settings.enableOverheatMsg;
		nVulcan.enableOverheatMsg = Vulcan_Settings.enableOverheatMsg;
	}
}


defaultproperties
{
}