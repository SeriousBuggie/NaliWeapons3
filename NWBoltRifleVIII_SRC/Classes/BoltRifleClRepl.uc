//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2014)
//
// NW3 BOLT RIFLE 1.00
//////////////////////////////////////////////////////////////

class BoltRifleClRepl expands NWClRepl;

struct BoltRifle_Client
{
	var bool bFirstPersonShotFX;
};
var BoltRifle_Client BoltRifle_Settings;


replication
{
	reliable if (Role == ROLE_Authority && bNetOwner)
		BoltRifle_Settings;
}


function SetServerReplVars()
{
	BoltRifle_Settings.bFirstPersonShotFX = Class'BoltRifle'.default.bFirstPersonShotFX;
}


simulated function SetClientReplVars(PlayerPawn PP)
{
local BoltRifle nBoltRifle;
	
	Class'BoltRifle'.default.bFirstPersonShotFX = BoltRifle_Settings.bFirstPersonShotFX;
	foreach AllActors(Class'BoltRifle', nBoltRifle)
	{
		nBoltRifle.default.bFirstPersonShotFX = BoltRifle_Settings.bFirstPersonShotFX;
		nBoltRifle.bFirstPersonShotFX = BoltRifle_Settings.bFirstPersonShotFX;
	}
}


defaultproperties
{
}