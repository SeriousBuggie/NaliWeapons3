//////////////////////////////////////////////////////////////
//				Feralidragon (25-07-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////
class WRESoldWreckedMiniR expands WRESoldWreckedPiece;

#exec MESH IMPORT MESH=WRESoldWreckedMiniR ANIVFILE=MODELS\WRESoldWreckedMini_a.3d DATAFILE=MODELS\WRESoldWreckedMini_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=WRESoldWreckedMiniR STRENGTH=0.1
#exec MESH ORIGIN MESH=WRESoldWreckedMiniR X=0 Y=0 Z=0 Yaw=64

#exec MESH SEQUENCE MESH=WRESoldWreckedMiniR SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WRESoldWreckedMiniR SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=WRESoldWreckedMiniR MESH=WRESoldWreckedMiniR
#exec MESHMAP SCALE MESHMAP=WRESoldWreckedMiniR X=1.0 Y=1.0 Z=2.0

defaultproperties
{
	Mesh=WRESoldWreckedMiniR
}
