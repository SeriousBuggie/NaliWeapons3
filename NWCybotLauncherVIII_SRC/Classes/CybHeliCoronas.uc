//////////////////////////////////////////////////////////////
//				Feralidragon (07-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybHeliCoronas expands CybCoronas;

#exec MESH IMPORT MESH=CybHeliCoronas ANIVFILE=MODELS\CybHeliCoronas_a.3d DATAFILE=MODELS\CybHeliCoronas_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=CybHeliCoronas X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybHeliCoronas SEQ=All STARTFRAME=0 NUMFRAMES=66
#exec MESH SEQUENCE MESH=CybHeliCoronas SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybHeliCoronas SEQ=Transform STARTFRAME=0 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=CybHeliCoronas SEQ=UnTransform STARTFRAME=20 NUMFRAMES=21 RATE=20.0

//Fire
#exec MESH SEQUENCE MESH=CybHeliCoronas SEQ=LeftFire STARTFRAME=41 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybHeliCoronas SEQ=RightFire STARTFRAME=49 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybHeliCoronas SEQ=BothFire STARTFRAME=57 NUMFRAMES=9 RATE=9.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybHeliCoronas MESH=CybHeliCoronas
#exec MESHMAP SCALE MESHMAP=CybHeliCoronas X=0.05 Y=0.05 Z=0.1

simulated function SetTeamExtras(byte team, optional byte texFlags, optional Actor aOwner, optional bool flicker)
{
	if (team > 3) team = 0;
	
	MultiSkins[2] = Eyes[team];
}

defaultproperties
{
    Mesh=CybHeliCoronas
	CoreCenterVertex=1
	CoreRingVertex=0
	bTiny=True
	
	Eyes(0)=LaserPntRed
	Eyes(1)=LaserPntBlue
	Eyes(2)=LaserPntGreen
	Eyes(3)=LaserPntYellow
}
