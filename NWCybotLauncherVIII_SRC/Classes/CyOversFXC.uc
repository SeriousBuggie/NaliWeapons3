//////////////////////////////////////////////////////////////
//				Feralidragon (23-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyOversFXC expands CyOversFXB;

#exec MESH IMPORT MESH=CyOversFXC ANIVFILE=MODELS\CyOversFXC_a.3d DATAFILE=MODELS\CyOversFXC_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyOversFXC STRENGTH=0
#exec MESH ORIGIN MESH=CyOversFXC X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CyOversFXC SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyOversFXC SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CyOversFXC MESH=CyOversFXC
#exec MESHMAP SCALE MESHMAP=CyOversFXC X=0.1 Y=0.1 Z=0.2

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=CyOversFXC
	RRate2=(Roll=10000)
}
