//////////////////////////////////////////////////////////////
//				Feralidragon (18-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTAltFireGlow expands FlameTFireGlow;

//FIRE GLOW
//*******************************************************

//1st person
#exec MESH IMPORT MESH=FlameTAltFireGlow ANIVFILE=MODELS\FlameTAltFireGlow_a.3d DATAFILE=MODELS\FlameTAltFireGlow_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FlameTAltFireGlow X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FlameTAltFireGlowR ANIVFILE=MODELS\FlameTAltFireGlow_a.3d DATAFILE=MODELS\FlameTAltFireGlow_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=FlameTAltFireGlowR X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FlameTAltFireGlow SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTAltFireGlow SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTAltFireGlow SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTAltFireGlow SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTAltFireGlow SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTAltFireGlow SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTAltFireGlow SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FlameTAltFireGlowR SEQ=All STARTFRAME=0 NUMFRAMES=32
#exec MESH SEQUENCE MESH=FlameTAltFireGlowR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FlameTAltFireGlowR SEQ=Fire STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=FlameTAltFireGlowR SEQ=AltFire STARTFRAME=3 NUMFRAMES=17 RATE=17.0
#exec MESH SEQUENCE MESH=FlameTAltFireGlowR SEQ=NoAmmoAltFire STARTFRAME=17 NUMFRAMES=3 RATE=3.0
#exec MESH SEQUENCE MESH=FlameTAltFireGlowR SEQ=Select STARTFRAME=25 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FlameTAltFireGlowR SEQ=Down STARTFRAME=19 NUMFRAMES=7 RATE=30.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FlameTAltFireGlow MESH=FlameTAltFireGlow
#exec MESHMAP SCALE MESHMAP=FlameTAltFireGlow X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FlameTAltFireGlowR MESH=FlameTAltFireGlowR
#exec MESHMAP SCALE MESHMAP=FlameTAltFireGlowR X=0.0255 Y=0.0255 Z=0.051

//===========================================================================

defaultproperties
{
    Mesh=FlameTAltFireGlow
	DrawScale=0.020000
	
	MeshL=FlameTAltFireGlow
	MeshR=FlameTAltFireGlowR
}
