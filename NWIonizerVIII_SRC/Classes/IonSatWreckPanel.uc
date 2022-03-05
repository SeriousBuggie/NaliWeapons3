//////////////////////////////////////////////////////////////
//				Feralidragon (14-01-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatWreckPanel expands IonSatWreckedPiece;

#exec MESH IMPORT MESH=IonSatWreckPanel ANIVFILE=MODELS\IonSatWreckPanel_a.3d DATAFILE=MODELS\IonSatWreckPanel_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatWreckPanel STRENGTH=0.25
#exec MESH ORIGIN MESH=IonSatWreckPanel X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatWreckPanel SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatWreckPanel SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonSatWreckPanel MESH=IonSatWreckPanel
#exec MESHMAP SCALE MESHMAP=IonSatWreckPanel X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=IonSatWreckPanel NUM=1 TEXTURE=IonSatWrecked

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonSatWreckPanel
}
