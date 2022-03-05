//////////////////////////////////////////////////////////////
//	Nali Weapons III modifier sphere
//				Feralidragon (24-03-2010)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class ModifSphere expands NaliWEffects;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		LODBias = FMax(1.0, Class'NWInfo'.default.PickupsDistDetail * Class'NWInfo'.default.MaxLODBias/255);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=ModifSphere
	bNetTemporary=False
	Mass=0.000000
	CollisionHeight=0.000000
	CollisionRadius=0.000000
	Skin=None
	Style=STY_Translucent
	bMeshEnviroMap=True
	ScaleGlow=1.800000
	bUnlit=True
	Physics=PHYS_Rotating
}
