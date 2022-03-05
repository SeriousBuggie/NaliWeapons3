//////////////////////////////////////////////////////////////
//				Feralidragon (27-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarBirthCloudMaster expands NWBaseCloudMaster;

simulated function PostBeginPlay()
{
	LoopAnim('LoopRevolve', 0.05);
}

defaultproperties
{
	LifeSpan=38.000000
	RemoteRole=ROLE_None
}
