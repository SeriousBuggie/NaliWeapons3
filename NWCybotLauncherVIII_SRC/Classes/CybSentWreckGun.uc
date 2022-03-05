//////////////////////////////////////////////////////////////
//				Feralidragon (05-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybSentWreckGun expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybSentWreckGun ANIVFILE=MODELS\CybSentWreckGun_a.3d DATAFILE=MODELS\CybSentWreckGun_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybSentWreckGun STRENGTH=0.2
#exec MESH ORIGIN MESH=CybSentWreckGun X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybSentWreckGun SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybSentWreckGun SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybSentWreckGun MESH=CybSentWreckGun
#exec MESHMAP SCALE MESHMAP=CybSentWreckGun X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybSentWreckGun
}
