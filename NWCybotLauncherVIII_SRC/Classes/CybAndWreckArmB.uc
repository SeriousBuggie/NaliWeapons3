//////////////////////////////////////////////////////////////
//				Feralidragon (23-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybAndWreckArmB expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybAndWreckArm2 ANIVFILE=MODELS\CybAndWreckArm2_a.3d DATAFILE=MODELS\CybAndWreckArm2_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybAndWreckArm2 STRENGTH=0.1
#exec MESH ORIGIN MESH=CybAndWreckArm2 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybAndWreckArm2 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybAndWreckArm2 SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybAndWreckArm2 MESH=CybAndWreckArm2
#exec MESHMAP SCALE MESHMAP=CybAndWreckArm2 X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    Mesh=CybAndWreckArm2
}
