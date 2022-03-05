//////////////////////////////////////////////////////////////
//	Nali Weapons III MultiMissile Launcher Laser tracing
//				Feralidragon (10-06-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class LaserTrace expands NaliWEffects;

#exec MESH IMPORT MESH=LaserTrace ANIVFILE=MODELS\LaserTrace_a.3d DATAFILE=MODELS\LaserTrace_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=LaserTrace STRENGTH=0
#exec MESH ORIGIN MESH=LaserTrace X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=LaserTrace SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=LaserTrace SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=LaserTrace MESH=LaserTrace
#exec MESHMAP SCALE MESHMAP=LaserTrace X=2.0 Y=0.025 Z=0.05

#exec OBJ LOAD FILE=Textures\StaticLasers.utx PACKAGE=NWMultiMissileVIII_SRC.StaticLasers
#exec MESHMAP SETTEXTURE MESHMAP=LaserTrace NUM=1 TEXTURE=LaserTraceRed01

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=LaserTrace
	bHidden=True
	bUnlit=True
	ScaleGlow=1.500000
	Style=STY_Translucent
	bNetTemporary=False
}
