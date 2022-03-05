//////////////////////////////////////////////////////////////
//				Feralidragon (14-01-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatWreckReceptor expands IonSatWreckedPiece;

#exec MESH IMPORT MESH=IonSatWreckReceptor ANIVFILE=MODELS\IonSatWreckReceptor_a.3d DATAFILE=MODELS\IonSatWreckReceptor_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatWreckReceptor STRENGTH=0.25
#exec MESH ORIGIN MESH=IonSatWreckReceptor X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatWreckReceptor SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatWreckReceptor SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonSatWreckReceptor MESH=IonSatWreckReceptor
#exec MESHMAP SCALE MESHMAP=IonSatWreckReceptor X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=IonSatWreckReceptor NUM=1 TEXTURE=IonSatWrecked

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonSatWreckReceptor
}
