//////////////////////////////////////////////////////////////
//				Feralidragon (19-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybKamikazeCoronas expands CybCoronas;

#exec MESH IMPORT MESH=CybKamikazeCoronas ANIVFILE=MODELS\CybKamikazeCoronas_a.3d DATAFILE=MODELS\CybKamikazeCoronas_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=CybKamikazeCoronas X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybKamikazeCoronas SEQ=All STARTFRAME=0 NUMFRAMES=46
#exec MESH SEQUENCE MESH=CybKamikazeCoronas SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybKamikazeCoronas SEQ=Transform STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=CybKamikazeCoronas SEQ=UnTransform STARTFRAME=10 NUMFRAMES=11 RATE=10.0

//Prepare to explode
#exec MESH SEQUENCE MESH=CybKamikazeCoronas SEQ=RotateOnce STARTFRAME=21 NUMFRAMES=25 RATE=25.0
#exec MESH SEQUENCE MESH=CybKamikazeCoronas SEQ=RotateLoop STARTFRAME=21 NUMFRAMES=24 RATE=25.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybKamikazeCoronas MESH=CybKamikazeCoronas
#exec MESHMAP SCALE MESHMAP=CybKamikazeCoronas X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    Mesh=CybKamikazeCoronas
	CoreCenterVertex=1
	CoreRingVertex=2
	bTiny=False
}
