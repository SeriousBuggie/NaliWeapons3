//////////////////////////////////////////////////////////////
//				Feralidragon (23-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybAndWreckLeg expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybAndWreckLeg ANIVFILE=MODELS\CybAndWreckLeg_a.3d DATAFILE=MODELS\CybAndWreckLeg_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybAndWreckLeg STRENGTH=0.1
#exec MESH ORIGIN MESH=CybAndWreckLeg X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybAndWreckLeg SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybAndWreckLeg SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybAndWreckLeg MESH=CybAndWreckLeg
#exec MESHMAP SCALE MESHMAP=CybAndWreckLeg X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    Mesh=CybAndWreckLeg
}
