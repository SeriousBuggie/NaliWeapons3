//////////////////////////////////////////////////////////////
//				Feralidragon (06-10-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IceOversFXC expands IceOversFXA;

#exec MESH IMPORT MESH=IceOversFXC ANIVFILE=MODELS\IceOversFXC_a.3d DATAFILE=MODELS\IceOversFXC_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceOversFXC STRENGTH=0
#exec MESH ORIGIN MESH=IceOversFXC X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IceOversFXC SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IceOversFXC SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IceOversFXC MESH=IceOversFXC
#exec MESHMAP SCALE MESHMAP=IceOversFXC X=0.1 Y=0.1 Z=0.2

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IceOversFXC
	scaleInTime=0.600000
}
