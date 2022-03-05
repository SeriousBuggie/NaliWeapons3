//////////////////////////////////////////////////////////////
//				Feralidragon (12-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybHeliWreckBlades expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybHeliWreckBlades ANIVFILE=MODELS\CybHeliWreckBlades_a.3d DATAFILE=MODELS\CybHeliWreckBlades_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybHeliWreckBlades STRENGTH=0.15
#exec MESH ORIGIN MESH=CybHeliWreckBlades X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybHeliWreckBlades SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybHeliWreckBlades SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybHeliWreckBlades MESH=CybHeliWreckBlades
#exec MESHMAP SCALE MESHMAP=CybHeliWreckBlades X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybHeliWreckBlades
}
