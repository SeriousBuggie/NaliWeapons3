//////////////////////////////////////////////////////////////
//				Feralidragon (12-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybHeliWreckBody expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybHeliWreckBody ANIVFILE=MODELS\CybHeliWreckBody_a.3d DATAFILE=MODELS\CybHeliWreckBody_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybHeliWreckBody STRENGTH=0.25
#exec MESH ORIGIN MESH=CybHeliWreckBody X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybHeliWreckBody SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybHeliWreckBody SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybHeliWreckBody MESH=CybHeliWreckBody
#exec MESHMAP SCALE MESHMAP=CybHeliWreckBody X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybHeliWreckBody
}
