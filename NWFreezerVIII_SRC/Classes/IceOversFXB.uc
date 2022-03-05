//////////////////////////////////////////////////////////////
//				Feralidragon (06-10-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IceOversFXB expands IceOversFXA;

#exec MESH IMPORT MESH=IceOversFXB ANIVFILE=MODELS\IceOversFXB_a.3d DATAFILE=MODELS\IceOversFXB_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceOversFXB STRENGTH=0
#exec MESH ORIGIN MESH=IceOversFXB X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IceOversFXB SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IceOversFXB SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IceOversFXB MESH=IceOversFXB
#exec MESHMAP SCALE MESHMAP=IceOversFXB X=0.1 Y=0.1 Z=0.2

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IceOversFXB
	scaleInTime=0.400000
}
