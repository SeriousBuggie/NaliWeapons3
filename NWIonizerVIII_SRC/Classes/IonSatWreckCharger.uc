//////////////////////////////////////////////////////////////
//				Feralidragon (14-01-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatWreckCharger expands IonSatWreckedPiece;

#exec MESH IMPORT MESH=IonSatWreckCharger ANIVFILE=MODELS\IonSatWreckCharger_a.3d DATAFILE=MODELS\IonSatWreckCharger_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatWreckCharger STRENGTH=0.25
#exec MESH ORIGIN MESH=IonSatWreckCharger X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatWreckCharger SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatWreckCharger SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonSatWreckCharger MESH=IonSatWreckCharger
#exec MESHMAP SCALE MESHMAP=IonSatWreckCharger X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=IonSatWreckCharger NUM=1 TEXTURE=IonSatWrecked

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonSatWreckCharger
}
