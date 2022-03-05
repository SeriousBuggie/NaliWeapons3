//////////////////////////////////////////////////////////////
//				Feralidragon (19-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonPainterLaserTrace expands NaliWEffects;

#exec MESH IMPORT MESH=IonPainterLaserTrace ANIVFILE=MODELS\IonPainterLaserTrace_a.3d DATAFILE=MODELS\IonPainterLaserTrace_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonPainterLaserTrace STRENGTH=0
#exec MESH ORIGIN MESH=IonPainterLaserTrace X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonPainterLaserTrace SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonPainterLaserTrace SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonPainterLaserTrace MESH=IonPainterLaserTrace
#exec MESHMAP SCALE MESHMAP=IonPainterLaserTrace X=2.0 Y=0.05 Z=0.1

#exec OBJ LOAD FILE=Textures\IonStaticLasers.utx PACKAGE=NWIonizerVIII_SRC.IonStaticLasers
#exec MESHMAP SETTEXTURE MESHMAP=IonPainterLaserTrace NUM=1 TEXTURE=IonLaserTraceRed01

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonPainterLaserTrace
	bHidden=True
	bUnlit=True
	ScaleGlow=1.500000
	Style=STY_Translucent
	bNetTemporary=False
}
