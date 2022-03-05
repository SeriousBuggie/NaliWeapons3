//////////////////////////////////////////////////////////////
//				Feralidragon (05-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybSentWreckTurret expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybSentWreckTurret ANIVFILE=MODELS\CybSentWreckTurret_a.3d DATAFILE=MODELS\CybSentWreckTurret_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybSentWreckTurret STRENGTH=0.25
#exec MESH ORIGIN MESH=CybSentWreckTurret X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybSentWreckTurret SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybSentWreckTurret SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybSentWreckTurret MESH=CybSentWreckTurret
#exec MESHMAP SCALE MESHMAP=CybSentWreckTurret X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybSentWreckTurret
}
