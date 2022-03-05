//////////////////////////////////////////////////////////////
//				Feralidragon (10-10-2010)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanMuzCor expands VulcanMuz;

//MUZZLE
//*******************************************************

//1st person
#exec MESH IMPORT MESH=VulcanMuzCor ANIVFILE=MODELS\VulcanMuzCor_a.3d DATAFILE=MODELS\VulcanMuzCor_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=VulcanMuzCor X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=VulcanMuzCorR ANIVFILE=MODELS\VulcanMuzCor_a.3d DATAFILE=MODELS\VulcanMuzCor_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=VulcanMuzCorR X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=VulcanMuzCor SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCor SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCor SEQ=Muz1 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCor SEQ=Muz2 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCor SEQ=Muz3 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCor SEQ=Muz4 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCor SEQ=Muz5 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCor SEQ=Muz6 STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCor SEQ=Muz7 STARTFRAME=6 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCor SEQ=Muz8 STARTFRAME=7 NUMFRAMES=1

#exec MESH SEQUENCE MESH=VulcanMuzCorR SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCorR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCorR SEQ=Muz1 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCorR SEQ=Muz2 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCorR SEQ=Muz3 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCorR SEQ=Muz4 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCorR SEQ=Muz5 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCorR SEQ=Muz6 STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCorR SEQ=Muz7 STARTFRAME=6 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzCorR SEQ=Muz8 STARTFRAME=7 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=VulcanMuzCor MESH=VulcanMuzCor
#exec MESHMAP SCALE MESHMAP=VulcanMuzCor X=0.12 Y=0.12 Z=0.24

#exec MESHMAP NEW MESHMAP=VulcanMuzCorR MESH=VulcanMuzCorR
#exec MESHMAP SCALE MESHMAP=VulcanMuzCorR X=0.12 Y=0.12 Z=0.24

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=VulcanMuz02 FILE=Coronas\VulcanMuz02.bmp GROUP=Effects FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=VulcanMuzCor NUM=1 TEXTURE=VulcanMuz02
#exec MESHMAP SETTEXTURE MESHMAP=VulcanMuzCorR NUM=1 TEXTURE=VulcanMuz02

//===========================================================================

defaultproperties
{
    Mesh=VulcanMuzCor
	ScaleGlow=0.600000
	
	MeshL=VulcanMuzCor
	MeshR=VulcanMuzCorR
}
