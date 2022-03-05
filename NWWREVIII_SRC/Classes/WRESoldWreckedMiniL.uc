//////////////////////////////////////////////////////////////
//				Feralidragon (25-07-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////
class WRESoldWreckedMiniL expands WRESoldWreckedPiece;

#exec MESH IMPORT MESH=WRESoldWreckedMiniL ANIVFILE=MODELS\WRESoldWreckedMini_a.3d DATAFILE=MODELS\WRESoldWreckedMini_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WRESoldWreckedMiniL STRENGTH=0.1
#exec MESH ORIGIN MESH=WRESoldWreckedMiniL X=0 Y=0 Z=0 Yaw=64

#exec MESH SEQUENCE MESH=WRESoldWreckedMiniL SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WRESoldWreckedMiniL SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=WRESoldWreckedMiniL MESH=WRESoldWreckedMiniL
#exec MESHMAP SCALE MESHMAP=WRESoldWreckedMiniL X=1.0 Y=1.0 Z=2.0

defaultproperties
{
	Mesh=WRESoldWreckedMiniL
}
