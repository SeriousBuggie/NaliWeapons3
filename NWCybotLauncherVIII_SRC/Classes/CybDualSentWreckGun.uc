//////////////////////////////////////////////////////////////
//				Feralidragon (05-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDualSentWreckGun expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybDualSentWreckGun ANIVFILE=MODELS\CybDualSentWreckGun_a.3d DATAFILE=MODELS\CybDualSentWreckGun_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybDualSentWreckGun STRENGTH=0.2
#exec MESH ORIGIN MESH=CybDualSentWreckGun X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybDualSentWreckGun SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybDualSentWreckGun SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybDualSentWreckGun MESH=CybDualSentWreckGun
#exec MESHMAP SCALE MESHMAP=CybDualSentWreckGun X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDualSentWreckGun
}
