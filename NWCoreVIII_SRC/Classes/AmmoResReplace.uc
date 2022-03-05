//////////////////////////////////////////////////////////////
//	Nali Weapons III ammo ressurection replace class
//				Feralidragon (25-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class AmmoResReplace expands WResReplace;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		LODBias = FMax(1.0, Class'NWInfo'.default.AmmoDistDetail * Class'NWInfo'.default.MaxLODBias/255);
}

defaultproperties
{

}
