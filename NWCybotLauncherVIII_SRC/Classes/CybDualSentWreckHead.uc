//////////////////////////////////////////////////////////////
//				Feralidragon (05-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDualSentWreckHead expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybDualSentWreckHead ANIVFILE=MODELS\CybDualSentWreckHead_a.3d DATAFILE=MODELS\CybDualSentWreckHead_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybDualSentWreckHead STRENGTH=0.2
#exec MESH ORIGIN MESH=CybDualSentWreckHead X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybDualSentWreckHead SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybDualSentWreckHead SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybDualSentWreckHead MESH=CybDualSentWreckHead
#exec MESHMAP SCALE MESHMAP=CybDualSentWreckHead X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDualSentWreckHead
}
