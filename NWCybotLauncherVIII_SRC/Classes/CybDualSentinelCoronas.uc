//////////////////////////////////////////////////////////////
//				Feralidragon (05-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDualSentinelCoronas expands CybCoronas;

#exec MESH IMPORT MESH=CybDualSentinelCoronas ANIVFILE=MODELS\CybDualSentinelCoronas_a.3d DATAFILE=MODELS\CybDualSentinelCoronas_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=CybDualSentinelCoronas X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybDualSentinelCoronas SEQ=All STARTFRAME=0 NUMFRAMES=64
#exec MESH SEQUENCE MESH=CybDualSentinelCoronas SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybDualSentinelCoronas SEQ=Transform STARTFRAME=0 NUMFRAMES=28 RATE=27.0
#exec MESH SEQUENCE MESH=CybDualSentinelCoronas SEQ=UnTransform STARTFRAME=27 NUMFRAMES=28 RATE=27.0

//Fire
#exec MESH SEQUENCE MESH=CybDualSentinelCoronas SEQ=LeftFire STARTFRAME=55 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybDualSentinelCoronas SEQ=RightFire STARTFRAME=63 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybDualSentinelCoronas SEQ=BothFire STARTFRAME=71 NUMFRAMES=9 RATE=9.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybDualSentinelCoronas MESH=CybDualSentinelCoronas
#exec MESHMAP SCALE MESHMAP=CybDualSentinelCoronas X=0.05 Y=0.05 Z=0.1

simulated function SetTeamExtras(byte team, optional byte texFlags, optional Actor aOwner, optional bool flicker)
{
	if (team > 3) team = 0;
	
	MultiSkins[0] = Eyes[team];
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDualSentinelCoronas
	CoreCenterVertex=1
	CoreRingVertex=2
	bTiny=True
	
	Eyes(0)=LaserPntRed
	Eyes(1)=LaserPntBlue
	Eyes(2)=LaserPntGreen
	Eyes(3)=LaserPntYellow
}
