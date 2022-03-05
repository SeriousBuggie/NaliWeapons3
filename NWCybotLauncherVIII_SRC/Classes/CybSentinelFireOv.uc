//////////////////////////////////////////////////////////////
//				Feralidragon (05-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybSentinelFireOv expands CybAndroidFireOv;

#exec MESH IMPORT MESH=CybSentinelFireOv ANIVFILE=MODELS\CybSentinelFireOv_a.3d DATAFILE=MODELS\CybSentinelFireOv_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=CybSentinelFireOv X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybSentinelFireOv SEQ=All STARTFRAME=0 NUMFRAMES=64
#exec MESH SEQUENCE MESH=CybSentinelFireOv SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybSentinelFireOv SEQ=Transform STARTFRAME=0 NUMFRAMES=28 RATE=27.0
#exec MESH SEQUENCE MESH=CybSentinelFireOv SEQ=UnTransform STARTFRAME=27 NUMFRAMES=28 RATE=27.0

//Fire
#exec MESH SEQUENCE MESH=CybSentinelFireOv SEQ=Fire STARTFRAME=55 NUMFRAMES=9 RATE=9.0

//------------------------- Animations End ---------------------------------
//**************************************************************************

#exec MESHMAP NEW MESHMAP=CybSentinelFireOv MESH=CybSentinelFireOv
#exec MESHMAP SCALE MESHMAP=CybSentinelFireOv X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybSentinelFireOv
}
