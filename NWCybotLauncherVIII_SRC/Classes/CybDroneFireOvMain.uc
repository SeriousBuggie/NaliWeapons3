//////////////////////////////////////////////////////////////
//				Feralidragon (13-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDroneFireOvMain expands CybAndroidFireOv;

#exec MESH IMPORT MESH=CybDroneFireOvMain ANIVFILE=MODELS\CybDroneFireOvMain_a.3d DATAFILE=MODELS\CybDroneFireOvMain_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=CybDroneFireOvMain X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybDroneFireOvMain SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=CybDroneFireOvMain SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybDroneFireOvMain SEQ=Transform STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=CybDroneFireOvMain SEQ=UnTransform STARTFRAME=10 NUMFRAMES=11 RATE=10.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybDroneFireOvMain MESH=CybDroneFireOvMain
#exec MESHMAP SCALE MESHMAP=CybDroneFireOvMain X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDroneFireOvMain
}
