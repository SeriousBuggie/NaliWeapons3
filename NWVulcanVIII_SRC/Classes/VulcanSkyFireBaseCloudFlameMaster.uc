//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFireBaseCloudFlameMaster expands VulcanSkyFireBaseCloudMaster;

simulated function PostBeginPlay()
{
	LoopAnim('LoopRevolve', 2.0);
}

defaultproperties
{
	LifeSpan=2.000000
	RemoteRole=ROLE_None
}
