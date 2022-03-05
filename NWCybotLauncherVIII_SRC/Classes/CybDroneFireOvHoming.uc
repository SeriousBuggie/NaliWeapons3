//////////////////////////////////////////////////////////////
//				Feralidragon (16-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDroneFireOvHoming expands CybAndroidFireOv;

#exec MESH IMPORT MESH=CybDroneFireOvHoming ANIVFILE=MODELS\CybDroneFireOvHoming_a.3d DATAFILE=MODELS\CybDroneFireOvHoming_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=CybDroneFireOvHoming X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybDroneFireOvHoming SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=CybDroneFireOvHoming SEQ=Still STARTFRAME=0 NUMFRAMES=1

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybDroneFireOvHoming MESH=CybDroneFireOvHoming
#exec MESHMAP SCALE MESHMAP=CybDroneFireOvHoming X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDroneFireOvHoming
	bRandomFrame=False
}
