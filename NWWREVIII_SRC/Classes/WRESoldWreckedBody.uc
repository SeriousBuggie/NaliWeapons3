//////////////////////////////////////////////////////////////
//				Feralidragon (25-07-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////
class WRESoldWreckedBody expands WRESoldWreckedPiece;

#exec MESH IMPORT MESH=WRESoldWreckedBody ANIVFILE=MODELS\WRESoldWreckedBody_a.3d DATAFILE=MODELS\WRESoldWreckedBody_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WRESoldWreckedBody STRENGTH=0.1
#exec MESH ORIGIN MESH=WRESoldWreckedBody X=0 Y=0 Z=0 Yaw=64

#exec MESH SEQUENCE MESH=WRESoldWreckedBody SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WRESoldWreckedBody SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=WRESoldWreckedBody MESH=WRESoldWreckedBody
#exec MESHMAP SCALE MESHMAP=WRESoldWreckedBody X=1.0 Y=1.0 Z=2.0

defaultproperties
{
	Mesh=WRESoldWreckedBody
}
