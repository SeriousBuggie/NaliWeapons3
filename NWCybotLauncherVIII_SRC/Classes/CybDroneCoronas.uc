//////////////////////////////////////////////////////////////
//				Feralidragon (13-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDroneCoronas expands CybCoronas;

#exec MESH IMPORT MESH=CybDroneCoronas ANIVFILE=MODELS\CybDroneCoronas_a.3d DATAFILE=MODELS\CybDroneCoronas_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=CybDroneCoronas X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybDroneCoronas SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=CybDroneCoronas SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybDroneCoronas SEQ=Transform STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=CybDroneCoronas SEQ=UnTransform STARTFRAME=10 NUMFRAMES=11 RATE=10.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybDroneCoronas MESH=CybDroneCoronas
#exec MESHMAP SCALE MESHMAP=CybDroneCoronas X=0.05 Y=0.05 Z=0.1

simulated function SetTeamExtras(byte team, optional byte texFlags, optional Actor aOwner, optional bool flicker)
{
	if (team > 3) team = 0;
	
	MultiSkins[0] = Eyes[team];
}

defaultproperties
{
    Mesh=CybDroneCoronas
	CoreCenterVertex=1
	CoreRingVertex=2
	bTiny=False
	
	Eyes(0)=LaserPntRed
	Eyes(1)=LaserPntBlue
	Eyes(2)=LaserPntGreen
	Eyes(3)=LaserPntYellow
}
