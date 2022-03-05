//////////////////////////////////////////////////////////////
//				Feralidragon (18-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTFireOver expands NaliWEffects;

//FIRE OVERLAYER
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FlameTFireOver ANIVFILE=MODELS\FlameTFireOver_a.3d DATAFILE=MODELS\FlameTFireOver_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FlameTFireOver STRENGTH=0
#exec MESH ORIGIN MESH=FlameTFireOver X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FlameTFireOverR ANIVFILE=MODELS\FlameTFireOver_a.3d DATAFILE=MODELS\FlameTFireOver_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=FlameTFireOverR STRENGTH=0
#exec MESH ORIGIN MESH=FlameTFireOverR X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FlameTFireOver SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTFireOver SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTFireOver SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTFireOver SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTFireOver SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTFireOver SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTFireOver SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FlameTFireOverR SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTFireOverR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTFireOverR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTFireOverR SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTFireOverR SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTFireOverR SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTFireOverR SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FlameTFireOver MESH=FlameTFireOver
#exec MESHMAP SCALE MESHMAP=FlameTFireOver X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FlameTFireOverR MESH=FlameTFireOverR
#exec MESHMAP SCALE MESHMAP=FlameTFireOverR X=0.0255 Y=0.0255 Z=0.051

//===========================================================================

//Skins
#exec TEXTURE IMPORT NAME=FlameTFireOver FILE=Overlayers\FlameTFireOver.bmp GROUP=Overlayers FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=FlameTFireOver NUM=1 TEXTURE=FlameTFireOver
#exec MESHMAP SETTEXTURE MESHMAP=FlameTFireOverR NUM=1 TEXTURE=FlameTFireOver

//===========================================================================

var() Mesh MeshL, MeshR;
var float DesiredGlow;

simulated function HandleMesh( bool bRightHand)
{
	if (bRightHand)
		Mesh = MeshR;
	else
		Mesh = MeshL;
}

simulated function Tick(float Delta)
{
	if (DesiredGlow > ScaleGlow)
	{
		ScaleGlow += (Delta/2);
		if (ScaleGlow > DesiredGlow)
			ScaleGlow = DesiredGlow;
	}
	else if (DesiredGlow < ScaleGlow)
	{
		ScaleGlow -= (Delta/2);
		if (ScaleGlow < DesiredGlow)
			ScaleGlow = DesiredGlow;
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=FlameTFireOver
	
	bHidden=True
	Style=STY_Translucent
	ScaleGlow=0.000000
	bUnlit=True
	bNetTemporary=False
	
	MeshL=FlameTFireOver
	MeshR=FlameTFireOverR
}
