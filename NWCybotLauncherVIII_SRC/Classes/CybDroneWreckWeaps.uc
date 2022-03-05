//////////////////////////////////////////////////////////////
//				Feralidragon (13-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDroneWreckWeaps expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybDroneWreckWeaps ANIVFILE=MODELS\CybDroneWreckWeaps_a.3d DATAFILE=MODELS\CybDroneWreckWeaps_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybDroneWreckWeaps STRENGTH=0.25
#exec MESH ORIGIN MESH=CybDroneWreckWeaps X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybDroneWreckWeaps SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybDroneWreckWeaps SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybDroneWreckWeaps MESH=CybDroneWreckWeaps
#exec MESHMAP SCALE MESHMAP=CybDroneWreckWeaps X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDroneWreckWeaps
}
