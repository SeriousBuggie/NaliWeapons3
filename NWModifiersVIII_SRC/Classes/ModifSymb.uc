//////////////////////////////////////////////////////////////
//	Nali Weapons III modifier symbol center
//				Feralidragon (24-03-2010)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class ModifSymb expands NaliWEffects;

#exec MESH IMPORT MESH=ModifSymb ANIVFILE=MODELS\ModifSymb_a.3d DATAFILE=MODELS\ModifSymb_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=ModifSymb STRENGTH=0
#exec MESH ORIGIN MESH=ModifSymb X=0 Y=0 Z=0 YAW=64

#exec MESH SEQUENCE MESH=ModifSymb SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifSymb SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=ModifSymb MESH=ModifSymb
#exec MESHMAP SCALE MESHMAP=ModifSymb X=0.05 Y=0.05 Z=0.1

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		LODBias = FMax(1.0, Class'NWInfo'.default.PickupsDistDetail * Class'NWInfo'.default.MaxLODBias/255);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=ModifSymb
	bNetTemporary=False
	Mass=0.000000
	CollisionHeight=0.000000
	CollisionRadius=0.000000
	Skin=None
	Style=STY_Translucent
	ScaleGlow=1.350000
	bUnlit=True
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	DrawScale=1.250000
}
