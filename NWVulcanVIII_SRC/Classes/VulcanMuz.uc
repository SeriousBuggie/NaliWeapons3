//////////////////////////////////////////////////////////////
//				Feralidragon (10-10-2010)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanMuz expands NaliWEffects;

//MUZZLE
//*******************************************************

//1st person
#exec MESH IMPORT MESH=VulcanMuz ANIVFILE=MODELS\VulcanMuz_a.3d DATAFILE=MODELS\VulcanMuz_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=VulcanMuz X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=VulcanMuzR ANIVFILE=MODELS\VulcanMuz_a.3d DATAFILE=MODELS\VulcanMuz_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=VulcanMuzR X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=VulcanMuz SEQ=All STARTFRAME=0 NUMFRAMES=8
#exec MESH SEQUENCE MESH=VulcanMuz SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuz SEQ=Muz1 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuz SEQ=Muz2 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuz SEQ=Muz3 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuz SEQ=Muz4 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuz SEQ=Muz5 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuz SEQ=Muz6 STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuz SEQ=Muz7 STARTFRAME=6 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuz SEQ=Muz8 STARTFRAME=7 NUMFRAMES=1

#exec MESH SEQUENCE MESH=VulcanMuzR SEQ=All STARTFRAME=0 NUMFRAMES=8
#exec MESH SEQUENCE MESH=VulcanMuzR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzR SEQ=Muz1 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzR SEQ=Muz2 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzR SEQ=Muz3 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzR SEQ=Muz4 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzR SEQ=Muz5 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzR SEQ=Muz6 STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzR SEQ=Muz7 STARTFRAME=6 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanMuzR SEQ=Muz8 STARTFRAME=7 NUMFRAMES=1

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=VulcanMuz MESH=VulcanMuz
#exec MESHMAP SCALE MESHMAP=VulcanMuz X=0.12 Y=0.12 Z=0.24

#exec MESHMAP NEW MESHMAP=VulcanMuzR MESH=VulcanMuzR
#exec MESHMAP SCALE MESHMAP=VulcanMuzR X=0.12 Y=0.12 Z=0.24

//-----------------------------------------------------------------------------------

//Skins
#exec TEXTURE IMPORT NAME=VulcanMuz01 FILE=Coronas\VulcanMuz01.bmp GROUP=Effects FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=VulcanMuz NUM=1 TEXTURE=VulcanMuz01
#exec MESHMAP SETTEXTURE MESHMAP=VulcanMuzR NUM=1 TEXTURE=VulcanMuz01

//===========================================================================

var() Mesh MeshL, MeshR;
var() name RndAnim[8];

simulated function PostBeginPlay()
{
	AnimSequence = RndAnim[Rand(ArrayCount(RndAnim))];
	AnimFrame = FRand();
}

simulated function RandomizeMesh( bool bRightHand)
{
	if (bRightHand)
		Mesh = MeshR;
	else
		Mesh = MeshL;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=VulcanMuz
	
	bHidden=True
	Style=STY_Translucent
	ScaleGlow=1.500000
	bUnlit=True
	bNetTemporary=False
	
	MeshL=VulcanMuz
	MeshR=VulcanMuzR
	
	RndAnim(0)=Muz1
	RndAnim(1)=Muz2
	RndAnim(2)=Muz3
	RndAnim(3)=Muz4
	RndAnim(4)=Muz5
	RndAnim(5)=Muz6
	RndAnim(6)=Muz7
	RndAnim(7)=Muz8
}
