//////////////////////////////////////////////////////////////
//				Feralidragon (05-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDualSentinelFireOvL expands CybAndroidFireOv;

#exec MESH IMPORT MESH=CybDualSentinelFireOvL ANIVFILE=MODELS\CybDualSentinelFireOvL_a.3d DATAFILE=MODELS\CybDualSentinelFireOvL_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=CybDualSentinelFireOvL X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybDualSentinelFireOvL SEQ=All STARTFRAME=0 NUMFRAMES=64
#exec MESH SEQUENCE MESH=CybDualSentinelFireOvL SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybDualSentinelFireOvL SEQ=Transform STARTFRAME=0 NUMFRAMES=28 RATE=27.0
#exec MESH SEQUENCE MESH=CybDualSentinelFireOvL SEQ=UnTransform STARTFRAME=27 NUMFRAMES=28 RATE=27.0

//Fire
#exec MESH SEQUENCE MESH=CybDualSentinelFireOvL SEQ=LeftFire STARTFRAME=55 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybDualSentinelFireOvL SEQ=RightFire STARTFRAME=63 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybDualSentinelFireOvL SEQ=BothFire STARTFRAME=71 NUMFRAMES=9 RATE=9.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybDualSentinelFireOvL MESH=CybDualSentinelFireOvL
#exec MESHMAP SCALE MESHMAP=CybDualSentinelFireOvL X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDualSentinelFireOvL
}
