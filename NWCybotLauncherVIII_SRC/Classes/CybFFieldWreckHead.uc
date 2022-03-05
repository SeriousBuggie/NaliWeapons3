//////////////////////////////////////////////////////////////
//				Feralidragon (20-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybFFieldWreckHead expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybFFieldWreckHead ANIVFILE=MODELS\CybFFieldWreckHead_a.3d DATAFILE=MODELS\CybFFieldWreckHead_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybFFieldWreckHead STRENGTH=0.15
#exec MESH ORIGIN MESH=CybFFieldWreckHead X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybFFieldWreckHead SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybFFieldWreckHead SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybFFieldWreckHead MESH=CybFFieldWreckHead
#exec MESHMAP SCALE MESHMAP=CybFFieldWreckHead X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybFFieldWreckHead
}
