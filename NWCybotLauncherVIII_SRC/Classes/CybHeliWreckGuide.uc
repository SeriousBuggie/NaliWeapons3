//////////////////////////////////////////////////////////////
//				Feralidragon (12-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybHeliWreckGuide expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybHeliWreckGuide ANIVFILE=MODELS\CybHeliWreckGuide_a.3d DATAFILE=MODELS\CybHeliWreckGuide_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybHeliWreckGuide STRENGTH=0.15
#exec MESH ORIGIN MESH=CybHeliWreckGuide X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybHeliWreckGuide SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybHeliWreckGuide SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybHeliWreckGuide MESH=CybHeliWreckGuide
#exec MESHMAP SCALE MESHMAP=CybHeliWreckGuide X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybHeliWreckGuide
}
