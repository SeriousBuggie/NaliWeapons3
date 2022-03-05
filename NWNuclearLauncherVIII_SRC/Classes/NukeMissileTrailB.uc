//////////////////////////////////////////////////////////////
//				Feralidragon (09-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeMissileTrailB expands NaliTrail;

#exec MESH IMPORT MESH=NukeMissileTrailB ANIVFILE=MODELS\NukeMissileTrailB_a.3d DATAFILE=MODELS\NukeMissileTrailB_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NukeMissileTrailB STRENGTH=0.0
#exec MESH ORIGIN MESH=NukeMissileTrailB X=0 Y=0 Z=100 PITCH=-64

#exec MESH SEQUENCE MESH=NukeMissileTrailB SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NukeMissileTrailB SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NukeMissileTrailB MESH=NukeMissileTrailB
#exec MESHMAP SCALE MESHMAP=NukeMissileTrailB X=0.1 Y=0.1 Z=0.4

#exec OBJ LOAD FILE=Textures\NukeExhaustFX.utx PACKAGE=NWNuclearLauncherVIII_SRC.NukeExhaustFX
#exec MESHMAP SETTEXTURE MESHMAP=NukeMissileTrailB NUM=1 TEXTURE=NukeExhaust01

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=NukeMissileTrailB
	Style=STY_Translucent
	bUnlit=True
	DrawScale=1.000000
	ScaleGlow=1.150000
}
