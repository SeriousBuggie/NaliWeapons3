//////////////////////////////////////////////////////////////
//				Feralidragon (14-01-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatWreckMain expands IonSatWreckedPiece;

#exec MESH IMPORT MESH=IonSatWreckMain ANIVFILE=MODELS\IonSatWreckMain_a.3d DATAFILE=MODELS\IonSatWreckMain_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatWreckMain STRENGTH=0.25
#exec MESH ORIGIN MESH=IonSatWreckMain X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatWreckMain SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatWreckMain SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonSatWreckMain MESH=IonSatWreckMain
#exec MESHMAP SCALE MESHMAP=IonSatWreckMain X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=IonSatWreckMain NUM=1 TEXTURE=IonSatWrecked

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonSatWreckMain
}
