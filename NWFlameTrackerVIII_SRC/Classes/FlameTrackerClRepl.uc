//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2014)
//
// NW3 FLAME TRACKER 1.00
//////////////////////////////////////////////////////////////

class FlameTrackerClRepl expands NWClRepl;

struct FlameTracker_Client
{
	var bool enableOverheatMsg;
};
var FlameTracker_Client FlameTracker_Settings;


replication
{
	reliable if (Role == ROLE_Authority && bNetOwner)
		FlameTracker_Settings;
}


function SetServerReplVars()
{
	FlameTracker_Settings.enableOverheatMsg = Class'FlameTracker'.default.enableOverheatMsg;
}


simulated function SetClientReplVars(PlayerPawn PP)
{
local FlameTracker nFlameTracker;
	
	Class'FlameTracker'.default.enableOverheatMsg = FlameTracker_Settings.enableOverheatMsg;
	foreach AllActors(Class'FlameTracker', nFlameTracker)
	{
		nFlameTracker.default.enableOverheatMsg = FlameTracker_Settings.enableOverheatMsg;
		nFlameTracker.enableOverheatMsg = FlameTracker_Settings.enableOverheatMsg;
	}
}


defaultproperties
{
}