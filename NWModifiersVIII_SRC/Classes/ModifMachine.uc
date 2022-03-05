//////////////////////////////////////////////////////////////
//	Nali Weapons III Modifier decorative "Support"
//				Feralidragon (21-03-2010)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class ModifMachine expands NaliWEffects;

#exec MESH IMPORT MESH=ModifMachine ANIVFILE=MODELS\ModifMachine_a.3d DATAFILE=MODELS\ModifMachine_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=ModifMachine STRENGTH=0
#exec MESH ORIGIN MESH=ModifMachine X=0 Y=0 Z=0 YAW=64

#exec MESH SEQUENCE MESH=ModifMachine SEQ=All STARTFRAME=0 NUMFRAMES=7
#exec MESH SEQUENCE MESH=ModifMachine SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifMachine SEQ=Openned STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifMachine SEQ=Close STARTFRAME=1 NUMFRAMES=6 RATE=1.0

#exec MESHMAP NEW MESHMAP=ModifMachine MESH=ModifMachine
#exec MESHMAP SCALE MESHMAP=ModifMachine X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=ModifierSk FILE=Skins\ModifierSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=ModifMachine NUM=1 TEXTURE=ModifierSk

#exec TEXTURE IMPORT NAME=SilverMetal01 FILE=Skins\SilverMetal01.bmp GROUP=Skins LODSET=2

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		LODBias = FMax(1.0, Class'NWInfo'.default.PickupsDistDetail * Class'NWInfo'.default.MaxLODBias/255);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=ModifMachine
	bNetTemporary=False
	Mass=0.000000
	CollisionHeight=0.000000
	CollisionRadius=0.000000
	Skin=None
	Style=STY_Normal
	Texture=SilverMetal01
	Physics=PHYS_Rotating
	NetPriority=1.400000
}
