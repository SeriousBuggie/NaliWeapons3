//////////////////////////////////////////////////////////////
//				Feralidragon (18-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTAltFireOver expands FlameTFireOver;

//FIRE OVERLAYER
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FlameTAltFireOver ANIVFILE=MODELS\FlameTAltFireOver_a.3d DATAFILE=MODELS\FlameTAltFireOver_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FlameTAltFireOver STRENGTH=0
#exec MESH ORIGIN MESH=FlameTAltFireOver X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FlameTAltFireOverR ANIVFILE=MODELS\FlameTAltFireOver_a.3d DATAFILE=MODELS\FlameTAltFireOver_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=FlameTAltFireOverR STRENGTH=0
#exec MESH ORIGIN MESH=FlameTAltFireOverR X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FlameTAltFireOver SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTAltFireOver SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTAltFireOver SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTAltFireOver SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTAltFireOver SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTAltFireOver SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTAltFireOver SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FlameTAltFireOverR SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTAltFireOverR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTAltFireOverR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTAltFireOverR SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTAltFireOverR SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTAltFireOverR SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTAltFireOverR SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FlameTAltFireOver MESH=FlameTAltFireOver
#exec MESHMAP SCALE MESHMAP=FlameTAltFireOver X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FlameTAltFireOverR MESH=FlameTAltFireOverR
#exec MESHMAP SCALE MESHMAP=FlameTAltFireOverR X=0.0255 Y=0.0255 Z=0.051

//===========================================================================

//Skins
#exec TEXTURE IMPORT NAME=FlameDarkerRedOver FILE=Overlayers\FlameDarkerRedOver.bmp GROUP=Overlayers FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=FlameTAltFireOver NUM=1 TEXTURE=FlameDarkerRedOver
#exec MESHMAP SETTEXTURE MESHMAP=FlameTAltFireOverR NUM=1 TEXTURE=FlameDarkerRedOver

#exec TEXTURE IMPORT NAME=FlameRedOver FILE=Overlayers\FlameRedOver.bmp GROUP=Overlayers FLAGS=2

//===========================================================================

defaultproperties
{
    Mesh=FlameTAltFireOver
	
	MeshL=FlameTAltFireOver
	MeshR=FlameTAltFireOverR
	
	Texture=FlameRedOver
}
