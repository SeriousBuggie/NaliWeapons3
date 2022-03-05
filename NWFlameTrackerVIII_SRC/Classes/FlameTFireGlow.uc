//////////////////////////////////////////////////////////////
//				Feralidragon (18-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTFireGlow expands FlameTFireOver;

//FIRE GLOW
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FlameTFireGlow ANIVFILE=MODELS\FlameTFireGlow_a.3d DATAFILE=MODELS\FlameTFireGlow_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FlameTFireGlow X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FlameTFireGlowR ANIVFILE=MODELS\FlameTFireGlow_a.3d DATAFILE=MODELS\FlameTFireGlow_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=FlameTFireGlowR X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FlameTFireGlow SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTFireGlow SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTFireGlow SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTFireGlow SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTFireGlow SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTFireGlow SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTFireGlow SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FlameTFireGlowR SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTFireGlowR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTFireGlowR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTFireGlowR SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTFireGlowR SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTFireGlowR SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTFireGlowR SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FlameTFireGlow MESH=FlameTFireGlow
#exec MESHMAP SCALE MESHMAP=FlameTFireGlow X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FlameTFireGlowR MESH=FlameTFireGlowR
#exec MESHMAP SCALE MESHMAP=FlameTFireGlowR X=0.0255 Y=0.0255 Z=0.051


#exec TEXTURE IMPORT NAME=FlameTFireGlow FILE=Coronas\FlameTFireGlow.bmp GROUP=Coronas FLAGS=2

//===========================================================================

defaultproperties
{
    Mesh=FlameTFireGlow
	DrawScale=0.045000
	Texture=FlameTFireGlow
	bParticles=True
	
	MeshL=FlameTFireGlow
	MeshR=FlameTFireGlowR
}
