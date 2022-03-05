//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2014)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WREClRepl expands NWClRepl;

struct WRE_Client
{
	var float FireMuzzleFlashScale;
};
var WRE_Client WRE_Settings;


replication
{
	reliable if (Role == ROLE_Authority && bNetOwner)
		WRE_Settings;
}


function SetServerReplVars()
{
	WRE_Settings.FireMuzzleFlashScale = Class'WRE'.default.FireMuzzleFlashScale;
}


simulated function SetClientReplVars(PlayerPawn PP)
{
local WRE nWRE;
	
	Class'WRE'.default.FireMuzzleFlashScale = WRE_Settings.FireMuzzleFlashScale;
	foreach AllActors(Class'WRE', nWRE)
	{
		nWRE.default.FireMuzzleFlashScale = WRE_Settings.FireMuzzleFlashScale;
		nWRE.FireMuzzleFlashScale = WRE_Settings.FireMuzzleFlashScale;
	}
}


defaultproperties
{
}