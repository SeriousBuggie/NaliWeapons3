//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2014)
//
// NW3 SUPER BOLT RIFLE 1.00
//////////////////////////////////////////////////////////////

class SuperBoltRifleClRepl expands NWClRepl;

struct SuperBoltRifle_Client
{
	var bool bFirstPersonShotFX;
};
var SuperBoltRifle_Client SuperBoltRifle_Settings;


replication
{
	reliable if (Role == ROLE_Authority && bNetOwner)
		SuperBoltRifle_Settings;
}


function SetServerReplVars()
{
	SuperBoltRifle_Settings.bFirstPersonShotFX = Class'SuperBoltRifle'.default.bFirstPersonShotFX;
}


simulated function SetClientReplVars(PlayerPawn PP)
{
local SuperBoltRifle nSuperBoltRifle;
	
	Class'SuperBoltRifle'.default.bFirstPersonShotFX = SuperBoltRifle_Settings.bFirstPersonShotFX;
	foreach AllActors(Class'SuperBoltRifle', nSuperBoltRifle)
	{
		nSuperBoltRifle.default.bFirstPersonShotFX = SuperBoltRifle_Settings.bFirstPersonShotFX;
		nSuperBoltRifle.bFirstPersonShotFX = SuperBoltRifle_Settings.bFirstPersonShotFX;
	}
}


defaultproperties
{
}