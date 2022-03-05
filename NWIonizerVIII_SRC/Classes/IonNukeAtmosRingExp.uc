//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2012)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class IonNukeAtmosRingExp expands IonNukeAtmosRing;

#exec MESH IMPORT MESH=IonNukeAtmosRingExp ANIVFILE=MODELS\IonNukeAtmosRing_a.3d DATAFILE=MODELS\IonNukeAtmosRing_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonNukeAtmosRingExp STRENGTH=0.1
#exec MESH ORIGIN MESH=IonNukeAtmosRingExp X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonNukeAtmosRingExp SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonNukeAtmosRingExp SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonNukeAtmosRingExp MESH=IonNukeAtmosRingExp
#exec MESHMAP SCALE MESHMAP=IonNukeAtmosRingExp X=0.1 Y=0.1 Z=0.3

#exec TEXTURE IMPORT NAME=IonNukeAtmosRingExp FILE=CORONAS\IonNukeAtmosRingExp.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=IonNukeAtmosRingExp NUM=1 TEXTURE=IonNukeAtmosRingExp

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonNukeAtmosRingExp
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	RotationRate=(Yaw=2000)
	ScaleGlow=2.000000
}
