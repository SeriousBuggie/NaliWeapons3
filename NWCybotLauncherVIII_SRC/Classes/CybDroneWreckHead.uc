//////////////////////////////////////////////////////////////
//				Feralidragon (13-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDroneWreckHead expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybDroneWreckHead ANIVFILE=MODELS\CybDroneWreckHead_a.3d DATAFILE=MODELS\CybDroneWreckHead_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybDroneWreckHead STRENGTH=0.15
#exec MESH ORIGIN MESH=CybDroneWreckHead X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybDroneWreckHead SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybDroneWreckHead SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybDroneWreckHead MESH=CybDroneWreckHead
#exec MESHMAP SCALE MESHMAP=CybDroneWreckHead X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDroneWreckHead
}
