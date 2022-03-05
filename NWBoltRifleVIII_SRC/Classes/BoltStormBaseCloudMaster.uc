//////////////////////////////////////////////////////////////
//				Feralidragon (15-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltStormBaseCloudMaster expands NWBaseCloudMaster;

simulated function PostBeginPlay()
{
	LoopAnim('LoopRevolve', 0.05);
}

defaultproperties
{
	LifeSpan=16.000000
	RemoteRole=ROLE_None
}
