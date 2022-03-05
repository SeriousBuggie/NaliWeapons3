//////////////////////////////////////////////////////////////
//				Feralidragon (06-10-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IceOversFXD expands IceOversFXA;

#exec MESH IMPORT MESH=IceOversFXD ANIVFILE=MODELS\IceOversFXD_a.3d DATAFILE=MODELS\IceOversFXD_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceOversFXD STRENGTH=0
#exec MESH ORIGIN MESH=IceOversFXD X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IceOversFXD SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IceOversFXD SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IceOversFXD MESH=IceOversFXD
#exec MESHMAP SCALE MESHMAP=IceOversFXD X=0.1 Y=0.1 Z=0.2

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IceOversFXD
	scaleInTime=0.100000
}
