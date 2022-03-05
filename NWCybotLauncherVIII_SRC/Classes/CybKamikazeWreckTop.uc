//////////////////////////////////////////////////////////////
//				Feralidragon (19-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybKamikazeWreckTop expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybKamikazeWreckTop ANIVFILE=MODELS\CybKamikazeWreckTop_a.3d DATAFILE=MODELS\CybKamikazeWreckTop_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybKamikazeWreckTop STRENGTH=0.25
#exec MESH ORIGIN MESH=CybKamikazeWreckTop X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybKamikazeWreckTop SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybKamikazeWreckTop SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybKamikazeWreckTop MESH=CybKamikazeWreckTop
#exec MESHMAP SCALE MESHMAP=CybKamikazeWreckTop X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybKamikazeWreckTop
}
