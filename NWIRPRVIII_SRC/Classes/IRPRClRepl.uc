//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2014)
//
// NW3 INFRA-RED PRECISION RIFLE 1.00
//////////////////////////////////////////////////////////////

class IRPRClRepl expands NWClRepl;

struct IRPR_Client
{
	var bool bFirstPersonShotFX;
};
var IRPR_Client IRPR_Settings;


replication
{
	reliable if (Role == ROLE_Authority && bNetOwner)
		IRPR_Settings;
}


function SetServerReplVars()
{
	IRPR_Settings.bFirstPersonShotFX = Class'IRPR'.default.bFirstPersonShotFX;
}


simulated function SetClientReplVars(PlayerPawn PP)
{
local IRPR nIRPR;
	
	Class'IRPR'.default.bFirstPersonShotFX = IRPR_Settings.bFirstPersonShotFX;
	foreach AllActors(Class'IRPR', nIRPR)
	{
		nIRPR.default.bFirstPersonShotFX = IRPR_Settings.bFirstPersonShotFX;
		nIRPR.bFirstPersonShotFX = IRPR_Settings.bFirstPersonShotFX;
	}
}


defaultproperties
{
}