//////////////////////////////////////////////////////////////
//				Feralidragon (13-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDroneWreckUpperShell expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybDroneWreckUpperShell ANIVFILE=MODELS\CybDroneWreckUpperShell_a.3d DATAFILE=MODELS\CybDroneWreckUpperShell_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybDroneWreckUpperShell STRENGTH=0.25
#exec MESH ORIGIN MESH=CybDroneWreckUpperShell X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybDroneWreckUpperShell SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybDroneWreckUpperShell SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybDroneWreckUpperShell MESH=CybDroneWreckUpperShell
#exec MESHMAP SCALE MESHMAP=CybDroneWreckUpperShell X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDroneWreckUpperShell
}
