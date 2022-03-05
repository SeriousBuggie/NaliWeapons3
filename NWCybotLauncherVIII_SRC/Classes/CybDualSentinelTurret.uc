//////////////////////////////////////////////////////////////
//				Feralidragon (05-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybDualSentinelTurret expands CybotPart;

#exec MESH IMPORT MESH=CybDualSentinelTurret ANIVFILE=MODELS\CybDualSentinelTurret_a.3d DATAFILE=MODELS\CybDualSentinelTurret_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybDualSentinelTurret STRENGTH=0.25
#exec MESH ORIGIN MESH=CybDualSentinelTurret X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybDualSentinelTurret SEQ=All STARTFRAME=0 NUMFRAMES=64
#exec MESH SEQUENCE MESH=CybDualSentinelTurret SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybDualSentinelTurret SEQ=Transform STARTFRAME=0 NUMFRAMES=28 RATE=27.0
#exec MESH SEQUENCE MESH=CybDualSentinelTurret SEQ=UnTransform STARTFRAME=27 NUMFRAMES=28 RATE=27.0

//Fire
#exec MESH SEQUENCE MESH=CybDualSentinelTurret SEQ=LeftFire STARTFRAME=55 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybDualSentinelTurret SEQ=RightFire STARTFRAME=63 NUMFRAMES=9 RATE=9.0
#exec MESH SEQUENCE MESH=CybDualSentinelTurret SEQ=BothFire STARTFRAME=71 NUMFRAMES=9 RATE=9.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybDualSentinelTurret MESH=CybDualSentinelTurret
#exec MESHMAP SCALE MESHMAP=CybDualSentinelTurret X=0.05 Y=0.05 Z=0.1

simulated function SetTeam(byte n)
{
	if (n > 3)	n = 0;
	MultiSkins[2] = Class'Cybot'.default.TeamCoreTex[n];
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybDualSentinelTurret
	MultiSkins(1)=CybotSk
	MultiSkins(2)=CybotCoreRed
	Texture=CybotMetal
	bTurret=True
}
