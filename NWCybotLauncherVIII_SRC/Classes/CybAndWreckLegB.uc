//////////////////////////////////////////////////////////////
//				Feralidragon (23-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybAndWreckLegB expands CybAndWreckLeg;

#exec MESH IMPORT MESH=CybAndWreckLegB ANIVFILE=MODELS\CybAndWreckLeg_a.3d DATAFILE=MODELS\CybAndWreckLeg_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybAndWreckLegB STRENGTH=0.1
#exec MESH ORIGIN MESH=CybAndWreckLegB X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CybAndWreckLegB SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybAndWreckLegB SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybAndWreckLegB MESH=CybAndWreckLegB
#exec MESHMAP SCALE MESHMAP=CybAndWreckLegB X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    Mesh=CybAndWreckLegB
}
