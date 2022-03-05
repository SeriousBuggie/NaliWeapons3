//////////////////////////////////////////////////////////////
//				Feralidragon (20-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerRocketExhaust expands NaliTrail;

#exec MESH IMPORT MESH=IonizerRocketExhaust ANIVFILE=MODELS\IonizerRocketExhaust_a.3d DATAFILE=MODELS\IonizerRocketExhaust_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonizerRocketExhaust STRENGTH=0.0
#exec MESH ORIGIN MESH=IonizerRocketExhaust X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=IonizerRocketExhaust SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerRocketExhaust SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonizerRocketExhaust MESH=IonizerRocketExhaust
#exec MESHMAP SCALE MESHMAP=IonizerRocketExhaust X=1.2 Y=1.2 Z=2.4

#exec OBJ LOAD FILE=Textures\IonRocketExhaust.utx PACKAGE=NWIonizerVIII_SRC.IonRocketExhaust
#exec MESHMAP SETTEXTURE MESHMAP=IonizerRocketExhaust NUM=1 TEXTURE=IonRocketExhaust01

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonizerRocketExhaust
	Style=STY_Translucent
	bUnlit=True
	DrawScale=1.000000
	ScaleGlow=1.500000
}
