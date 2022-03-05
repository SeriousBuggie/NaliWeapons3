//////////////////////////////////////////////////////////////
//				Feralidragon (23-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybAndWreckHead expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybAndWreckHead ANIVFILE=MODELS\CybAndWreckHead_a.3d DATAFILE=MODELS\CybAndWreckHead_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybAndWreckHead STRENGTH=0.1
#exec MESH ORIGIN MESH=CybAndWreckHead X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybAndWreckHead SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybAndWreckHead SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybAndWreckHead MESH=CybAndWreckHead
#exec MESHMAP SCALE MESHMAP=CybAndWreckHead X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    Mesh=CybAndWreckHead
}
