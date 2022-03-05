//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybHeliFireOvR expands CybAndroidFireOv;

#exec MESH IMPORT MESH=CybHeliFireOvR ANIVFILE=MODELS\CybHeliFireOvR_a.3d DATAFILE=MODELS\CybHeliFireOvR_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=CybHeliFireOvR X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybHeliFireOvR SEQ=All STARTFRAME=0 NUMFRAMES=66
#exec MESH SEQUENCE MESH=CybHeliFireOvR SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybHeliFireOvR SEQ=Transform STARTFRAME=0 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=CybHeliFireOvR SEQ=UnTransform STARTFRAME=20 NUMFRAMES=21 RATE=20.0

//Fire
#exec MESH SEQUENCE MESH=CybHeliFireOvR SEQ=LeftFire STARTFRAME=41 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybHeliFireOvR SEQ=RightFire STARTFRAME=49 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybHeliFireOvR SEQ=BothFire STARTFRAME=57 NUMFRAMES=9 RATE=9.0

//------------------------- Animations End ---------------------------------
//**************************************************************************

#exec MESHMAP NEW MESHMAP=CybHeliFireOvR MESH=CybHeliFireOvR
#exec MESHMAP SCALE MESHMAP=CybHeliFireOvR X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybHeliFireOvR
}
