//////////////////////////////////////////////////////////////
//				Feralidragon (25-07-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////
class WRESoldWreckedHead expands WRESoldWreckedPiece;

#exec MESH IMPORT MESH=WRESoldWreckedHead ANIVFILE=MODELS\WRESoldWreckedHead_a.3d DATAFILE=MODELS\WRESoldWreckedHead_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WRESoldWreckedHead STRENGTH=0.1
#exec MESH ORIGIN MESH=WRESoldWreckedHead X=0 Y=0 Z=0 Yaw=64

#exec MESH SEQUENCE MESH=WRESoldWreckedHead SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WRESoldWreckedHead SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=WRESoldWreckedHead MESH=WRESoldWreckedHead
#exec MESHMAP SCALE MESHMAP=WRESoldWreckedHead X=1.0 Y=1.0 Z=2.0

defaultproperties
{
	Mesh=WRESoldWreckedHead
}
