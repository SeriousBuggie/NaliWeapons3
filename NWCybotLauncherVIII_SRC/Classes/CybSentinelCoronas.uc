//////////////////////////////////////////////////////////////
//				Feralidragon (03-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybSentinelCoronas expands CybCoronas;

#exec MESH IMPORT MESH=CybSentinelCoronas ANIVFILE=MODELS\CybSentinelCoronas_a.3d DATAFILE=MODELS\CybSentinelCoronas_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=CybSentinelCoronas X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybSentinelCoronas SEQ=All STARTFRAME=0 NUMFRAMES=64
#exec MESH SEQUENCE MESH=CybSentinelCoronas SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybSentinelCoronas SEQ=Transform STARTFRAME=0 NUMFRAMES=28 RATE=27.0
#exec MESH SEQUENCE MESH=CybSentinelCoronas SEQ=UnTransform STARTFRAME=27 NUMFRAMES=28 RATE=27.0

//Fire
#exec MESH SEQUENCE MESH=CybSentinelCoronas SEQ=Fire STARTFRAME=55 NUMFRAMES=9 RATE=9.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybSentinelCoronas MESH=CybSentinelCoronas
#exec MESHMAP SCALE MESHMAP=CybSentinelCoronas X=0.05 Y=0.05 Z=0.1


simulated function SetTeamExtras(byte team, optional byte texFlags, optional Actor aOwner, optional bool flicker)
{
	if (team > 3) team = 0;
	
	MultiSkins[0] = Eyes[team];
}

defaultproperties
{
    Mesh=CybSentinelCoronas
	CoreCenterVertex=1
	CoreRingVertex=2
	bTiny=True
	
	Eyes(0)=LaserPntRed
	Eyes(1)=LaserPntBlue
	Eyes(2)=LaserPntGreen
	Eyes(3)=LaserPntYellow
}
