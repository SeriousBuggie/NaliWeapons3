//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2014)
//
// NW3 NUCLEAR LAUNCHER 1.00
//////////////////////////////////////////////////////////////

class NuclearLauncherClRepl expands NWClRepl;

struct NuclearLauncher_Client
{
	var float CrossSidesTransparency, CrossCenterTransparency;
};
var NuclearLauncher_Client NuclearLauncher_Settings;


replication
{
	reliable if (Role == ROLE_Authority && bNetOwner)
		NuclearLauncher_Settings;
}


function SetServerReplVars()
{
	NuclearLauncher_Settings.CrossSidesTransparency = Class'NuclearLauncher'.default.CrossSidesTransparency;
	NuclearLauncher_Settings.CrossCenterTransparency = Class'NuclearLauncher'.default.CrossCenterTransparency;
}


simulated function SetClientReplVars(PlayerPawn PP)
{
local NuclearLauncher nNuclearLauncher;
	
	Class'NuclearLauncher'.default.CrossSidesTransparency = NuclearLauncher_Settings.CrossSidesTransparency;
	Class'NuclearLauncher'.default.CrossCenterTransparency = NuclearLauncher_Settings.CrossCenterTransparency;
	foreach AllActors(Class'NuclearLauncher', nNuclearLauncher)
	{
		nNuclearLauncher.default.CrossSidesTransparency = NuclearLauncher_Settings.CrossSidesTransparency;
		nNuclearLauncher.CrossSidesTransparency = NuclearLauncher_Settings.CrossSidesTransparency;
		nNuclearLauncher.default.CrossCenterTransparency = NuclearLauncher_Settings.CrossCenterTransparency;
		nNuclearLauncher.CrossCenterTransparency = NuclearLauncher_Settings.CrossCenterTransparency;
	}
}


defaultproperties
{
}