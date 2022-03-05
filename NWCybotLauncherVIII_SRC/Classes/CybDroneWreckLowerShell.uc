//////////////////////////////////////////////////////////////
//				Feralidragon (13-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDroneWreckLowerShell expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybDroneWreckLowerShell ANIVFILE=MODELS\CybDroneWreckLowerShell_a.3d DATAFILE=MODELS\CybDroneWreckLowerShell_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybDroneWreckLowerShell STRENGTH=0.25
#exec MESH ORIGIN MESH=CybDroneWreckLowerShell X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybDroneWreckLowerShell SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybDroneWreckLowerShell SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybDroneWreckLowerShell MESH=CybDroneWreckLowerShell
#exec MESHMAP SCALE MESHMAP=CybDroneWreckLowerShell X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDroneWreckLowerShell
}
