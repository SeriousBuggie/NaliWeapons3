//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFireBaseCloudMaster expands NWBaseCloudMaster;

simulated function PostBeginPlay()
{
	LoopAnim('LoopRevolve', 0.05);
}

defaultproperties
{
	LifeSpan=16.000000
	RemoteRole=ROLE_None
}
