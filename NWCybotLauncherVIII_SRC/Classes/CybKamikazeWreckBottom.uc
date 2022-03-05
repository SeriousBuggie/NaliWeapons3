//////////////////////////////////////////////////////////////
//				Feralidragon (19-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybKamikazeWreckBottom expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybKamikazeWreckBottom ANIVFILE=MODELS\CybKamikazeWreckBottom_a.3d DATAFILE=MODELS\CybKamikazeWreckBottom_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybKamikazeWreckBottom STRENGTH=0.25
#exec MESH ORIGIN MESH=CybKamikazeWreckBottom X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybKamikazeWreckBottom SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybKamikazeWreckBottom SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybKamikazeWreckBottom MESH=CybKamikazeWreckBottom
#exec MESHMAP SCALE MESHMAP=CybKamikazeWreckBottom X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybKamikazeWreckBottom
}
