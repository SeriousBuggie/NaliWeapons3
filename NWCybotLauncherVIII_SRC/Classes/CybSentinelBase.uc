//////////////////////////////////////////////////////////////
//				Feralidragon (01-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybSentinelBase expands CybotPart;

#exec MESH IMPORT MESH=CybSentinelBase ANIVFILE=MODELS\CybSentinelBase_a.3d DATAFILE=MODELS\CybSentinelBase_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybSentinelBase STRENGTH=0.25
#exec MESH ORIGIN MESH=CybSentinelBase X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybSentinelBase SEQ=All STARTFRAME=0 NUMFRAMES=64
#exec MESH SEQUENCE MESH=CybSentinelBase SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybSentinelBase SEQ=Transform STARTFRAME=0 NUMFRAMES=28 RATE=27.0
#exec MESH SEQUENCE MESH=CybSentinelBase SEQ=UnTransform STARTFRAME=27 NUMFRAMES=28 RATE=27.0

//Fire
#exec MESH SEQUENCE MESH=CybSentinelBase SEQ=Fire STARTFRAME=55 NUMFRAMES=9 RATE=9.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybSentinelBase MESH=CybSentinelBase
#exec MESHMAP SCALE MESHMAP=CybSentinelBase X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybSentinelBase
	MultiSkins(1)=CybotSk
	Texture=CybotMetal
}
