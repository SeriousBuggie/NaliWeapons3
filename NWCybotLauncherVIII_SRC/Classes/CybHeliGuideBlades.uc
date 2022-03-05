//////////////////////////////////////////////////////////////
//				Feralidragon (07-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybHeliGuideBlades expands CybAttach;

#exec MESH IMPORT MESH=CybHeliGuideBlades ANIVFILE=MODELS\CybHeliGuideBlades_a.3d DATAFILE=MODELS\CybHeliGuideBlades_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybHeliGuideBlades STRENGTH=0.25
#exec MESH ORIGIN MESH=CybHeliGuideBlades X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybHeliGuideBlades SEQ=All STARTFRAME=0 NUMFRAMES=84
#exec MESH SEQUENCE MESH=CybHeliGuideBlades SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybHeliGuideBlades SEQ=Transform STARTFRAME=0 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=CybHeliGuideBlades SEQ=UnTransform STARTFRAME=20 NUMFRAMES=21 RATE=20.0

//Rotate
#exec MESH SEQUENCE MESH=CybHeliGuideBlades SEQ=Rotate STARTFRAME=43 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=CybHeliGuideBlades SEQ=Rotating STARTFRAME=43 NUMFRAMES=40 RATE=39.0

//------------------------- Animations End ---------------------------------
//**************************************************************************


#exec MESHMAP NEW MESHMAP=CybHeliGuideBlades MESH=CybHeliGuideBlades
#exec MESHMAP SCALE MESHMAP=CybHeliGuideBlades X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=HeliSk FILE=SKINS\HeliSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybHeliGuideBlades NUM=1 TEXTURE=HeliSk

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybHeliGuideBlades
	
	AnimCache(0)=Transform
	AnimCache(1)=UnTransform
	AnimCache(2)=Rotating
}
