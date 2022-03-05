//////////////////////////////////////////////////////////////
//				Feralidragon (15-12-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatEnvOv expands NaliTrail;

#exec MESH IMPORT MESH=IonSatEnvOv ANIVFILE=MODELS\IonSatEnvOv_a.3d DATAFILE=MODELS\IonSatEnvOv_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatEnvOv STRENGTH=0.0
#exec MESH ORIGIN MESH=IonSatEnvOv X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatEnvOv SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=IonSatEnvOv SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatEnvOv SEQ=Openning STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=IonSatEnvOv SEQ=Closed STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatEnvOv SEQ=Closing STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonSatEnvOv MESH=IonSatEnvOv
#exec MESHMAP SCALE MESHMAP=IonSatEnvOv X=0.3 Y=0.3 Z=0.6

#exec TEXTURE IMPORT NAME=IonSatPanelsEnv FILE=SKINS\IonSatPanelsEnv.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonSatEnvOv NUM=1 TEXTURE=IonSatPanelsEnv

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonSatEnvOv
	bAnimByOwner=True
	bMeshEnviroMap=True
	Style=STY_Translucent
	bUnlit=True
	ScaleGlow=0.250000
	Texture=IonSatPanelsEnv
}
