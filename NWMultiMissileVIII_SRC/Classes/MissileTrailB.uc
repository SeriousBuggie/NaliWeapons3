//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MissileTrailB expands NaliTrail;

#exec MESH IMPORT MESH=MissileTrailB ANIVFILE=MODELS\MissileTrailB_a.3d DATAFILE=MODELS\MissileTrailB_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MissileTrailB STRENGTH=0.45
#exec MESH ORIGIN MESH=MissileTrailB X=0 Y=0 Z=-40 PITCH=-64

#exec MESH SEQUENCE MESH=MissileTrailB SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MissileTrailB SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MissileTrailB MESH=MissileTrailB
#exec MESHMAP SCALE MESHMAP=MissileTrailB X=0.05 Y=0.05 Z=0.1

#exec OBJ LOAD FILE=Textures\MissileExhaustFX.utx PACKAGE=NWMultiMissileVIII_SRC.MissileExhaustFX
#exec MESHMAP SETTEXTURE MESHMAP=MissileTrailB NUM=1 TEXTURE=MissileExhaust01

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=MissileTrailB
	Style=STY_Translucent
	bUnlit=True
	DrawScale=1.000000
	ScaleGlow=0.850000
}
