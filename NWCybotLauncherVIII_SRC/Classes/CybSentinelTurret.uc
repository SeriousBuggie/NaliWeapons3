//////////////////////////////////////////////////////////////
//				Feralidragon (01-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybSentinelTurret expands CybotPart;

#exec MESH IMPORT MESH=CybSentinelTurret ANIVFILE=MODELS\CybSentinelTurret_a.3d DATAFILE=MODELS\CybSentinelTurret_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybSentinelTurret STRENGTH=0.25
#exec MESH ORIGIN MESH=CybSentinelTurret X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybSentinelTurret SEQ=All STARTFRAME=0 NUMFRAMES=64
#exec MESH SEQUENCE MESH=CybSentinelTurret SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybSentinelTurret SEQ=Transform STARTFRAME=0 NUMFRAMES=28 RATE=27.0
#exec MESH SEQUENCE MESH=CybSentinelTurret SEQ=UnTransform STARTFRAME=27 NUMFRAMES=28 RATE=27.0

//Fire
#exec MESH SEQUENCE MESH=CybSentinelTurret SEQ=Fire STARTFRAME=55 NUMFRAMES=9 RATE=9.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybSentinelTurret MESH=CybSentinelTurret
#exec MESHMAP SCALE MESHMAP=CybSentinelTurret X=0.05 Y=0.05 Z=0.1

simulated function SetTeam(byte n)
{
	if (n > 3)	n = 0;
	MultiSkins[2] = Class'Cybot'.default.TeamCoreTex[n];
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybSentinelTurret
	MultiSkins(1)=CybotSk
	MultiSkins(2)=CybotCoreRed
	Texture=CybotMetal
	bTurret=True
}
