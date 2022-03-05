//////////////////////////////////////////////////////////////
//				Feralidragon (27-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVortexCoronas expands CybCoronas;

#exec MESH IMPORT MESH=CybVortexCoronas ANIVFILE=MODELS\CybVortexCoronas_a.3d DATAFILE=MODELS\CybVortexCoronas_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH ORIGIN MESH=CybVortexCoronas X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybVortexCoronas SEQ=All STARTFRAME=0 NUMFRAMES=42
#exec MESH SEQUENCE MESH=CybVortexCoronas SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybVortexCoronas SEQ=Transform STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=CybVortexCoronas SEQ=UnTransform STARTFRAME=10 NUMFRAMES=11 RATE=10.0

//Rotating
#exec MESH SEQUENCE MESH=CybVortexCoronas SEQ=RotateOnce STARTFRAME=21 NUMFRAMES=21 RATE=21.0
#exec MESH SEQUENCE MESH=CybVortexCoronas SEQ=RotateLoop STARTFRAME=21 NUMFRAMES=20 RATE=21.0

//------------------------- Animations End ---------------------------------
//**************************************************************************

#exec MESHMAP NEW MESHMAP=CybVortexCoronas MESH=CybVortexCoronas
#exec MESHMAP SCALE MESHMAP=CybVortexCoronas X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    Mesh=CybVortexCoronas
	CoreCenterVertex=1
	CoreRingVertex=2
	bTiny=False
}
