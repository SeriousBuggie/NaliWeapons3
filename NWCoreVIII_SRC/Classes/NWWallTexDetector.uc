//////////////////////////////////////////////////////////////
//	Nali Weapons III wall texture detector class
//				Feralidragon (01-07-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWWallTexDetector expands Decal;

simulated event PostBeginPlay();

simulated function AttachToSurface();

defaultproperties
{
	bNetTemporary=False
	bNetOptional=False
	RemoteRole=ROLE_SimulatedProxy
	Texture=ModulInvis
	bHighDetail=False
	MultiDecalLevel=1
}