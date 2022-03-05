//////////////////////////////////////////////////////////////
//				Feralidragon (05-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDualSentinelBase expands CybotPart;

#exec MESH IMPORT MESH=CybDualSentinelBase ANIVFILE=MODELS\CybDualSentinelBase_a.3d DATAFILE=MODELS\CybDualSentinelBase_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybDualSentinelBase STRENGTH=0.25
#exec MESH ORIGIN MESH=CybDualSentinelBase X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybDualSentinelBase SEQ=All STARTFRAME=0 NUMFRAMES=64
#exec MESH SEQUENCE MESH=CybDualSentinelBase SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybDualSentinelBase SEQ=Transform STARTFRAME=0 NUMFRAMES=28 RATE=27.0
#exec MESH SEQUENCE MESH=CybDualSentinelBase SEQ=UnTransform STARTFRAME=27 NUMFRAMES=28 RATE=27.0

//Fire
#exec MESH SEQUENCE MESH=CybDualSentinelBase SEQ=LeftFire STARTFRAME=55 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybDualSentinelBase SEQ=RightFire STARTFRAME=63 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybDualSentinelBase SEQ=BothFire STARTFRAME=71 NUMFRAMES=9 RATE=9.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybDualSentinelBase MESH=CybDualSentinelBase
#exec MESHMAP SCALE MESHMAP=CybDualSentinelBase X=0.05 Y=0.05 Z=0.1


defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDualSentinelBase
	MultiSkins(1)=CybotSk
	Texture=CybotMetal
}
