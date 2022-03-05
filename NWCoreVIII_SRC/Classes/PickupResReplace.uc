//////////////////////////////////////////////////////////////
//	Nali Weapons III pickup ressurection replace class
//				Feralidragon (15-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class PickupResReplace expands WResReplace;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		LODBias = FMax(1.0, Class'NWInfo'.default.PickupsDistDetail * Class'NWInfo'.default.MaxLODBias/255);
}

defaultproperties
{
}
