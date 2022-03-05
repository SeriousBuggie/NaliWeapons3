//////////////////////////////////////////////////////////////
//				Feralidragon (23-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybAndWreckArmA expands CybWreckedPiece;

#exec MESH IMPORT MESH=CybAndWreckArm1 ANIVFILE=MODELS\CybAndWreckArm1_a.3d DATAFILE=MODELS\CybAndWreckArm1_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybAndWreckArm1 STRENGTH=0.1
#exec MESH ORIGIN MESH=CybAndWreckArm1 X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybAndWreckArm1 SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybAndWreckArm1 SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybAndWreckArm1 MESH=CybAndWreckArm1
#exec MESHMAP SCALE MESHMAP=CybAndWreckArm1 X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    Mesh=CybAndWreckArm1
}
