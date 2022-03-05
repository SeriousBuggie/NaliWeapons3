//////////////////////////////////////////////////////////////
//				Feralidragon (05-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybSentWreckBase expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybSentWreckBase ANIVFILE=MODELS\CybSentWreckBase_a.3d DATAFILE=MODELS\CybSentWreckBase_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybSentWreckBase STRENGTH=0.15
#exec MESH ORIGIN MESH=CybSentWreckBase X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybSentWreckBase SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybSentWreckBase SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybSentWreckBase MESH=CybSentWreckBase
#exec MESHMAP SCALE MESHMAP=CybSentWreckBase X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybSentWreckBase
}
