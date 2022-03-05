//////////////////////////////////////////////////////////////
//				Feralidragon (03-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerFXFirst expands FreezerCoolantSmoke;

//1st person
#exec MESH IMPORT MESH=FreezerCoolSmk ANIVFILE=MODELS\FreezerCoolSmk_a.3d DATAFILE=MODELS\FreezerCoolSmk_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FreezerCoolSmk X=0 Y=0 Z=0 Yaw=128

#exec MESH IMPORT MESH=FreezerCoolSmkM ANIVFILE=MODELS\FreezerCoolSmkM_a.3d DATAFILE=MODELS\FreezerCoolSmkM_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FreezerCoolSmkM X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=FreezerCoolSmkR ANIVFILE=MODELS\FreezerCoolSmk_a.3d DATAFILE=MODELS\FreezerCoolSmk_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=FreezerCoolSmkR X=0 Y=0 Z=0

#exec MESH IMPORT MESH=FreezerCoolSmkMR ANIVFILE=MODELS\FreezerCoolSmkM_a.3d DATAFILE=MODELS\FreezerCoolSmkM_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH ORIGIN MESH=FreezerCoolSmkMR X=0 Y=0 Z=0

//-----------------------------------------------------------------------------------

//Animations
#exec MESH SEQUENCE MESH=FreezerCoolSmk SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=FreezerCoolSmk SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerCoolSmk SEQ=Fire STARTFRAME=7 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=FreezerCoolSmk SEQ=AltFire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=FreezerCoolSmk SEQ=Select STARTFRAME=23 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FreezerCoolSmk SEQ=Down STARTFRAME=17 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FreezerCoolSmkM SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=FreezerCoolSmkM SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerCoolSmkM SEQ=Fire STARTFRAME=7 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=FreezerCoolSmkM SEQ=AltFire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=FreezerCoolSmkM SEQ=Select STARTFRAME=23 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FreezerCoolSmkM SEQ=Down STARTFRAME=17 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FreezerCoolSmkR SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=FreezerCoolSmkR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerCoolSmkR SEQ=Fire STARTFRAME=7 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=FreezerCoolSmkR SEQ=AltFire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=FreezerCoolSmkR SEQ=Select STARTFRAME=23 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FreezerCoolSmkR SEQ=Down STARTFRAME=17 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=FreezerCoolSmkMR SEQ=All STARTFRAME=0 NUMFRAMES=30
#exec MESH SEQUENCE MESH=FreezerCoolSmkMR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerCoolSmkMR SEQ=Fire STARTFRAME=7 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=FreezerCoolSmkMR SEQ=AltFire STARTFRAME=0 NUMFRAMES=7 RATE=7.0
#exec MESH SEQUENCE MESH=FreezerCoolSmkMR SEQ=Select STARTFRAME=23 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=FreezerCoolSmkMR SEQ=Down STARTFRAME=17 NUMFRAMES=7 RATE=30.0

//-----------------------------------------------------------------------------------

//Scale
#exec MESHMAP NEW MESHMAP=FreezerCoolSmk MESH=FreezerCoolSmk
#exec MESHMAP SCALE MESHMAP=FreezerCoolSmk X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FreezerCoolSmkM MESH=FreezerCoolSmkM
#exec MESHMAP SCALE MESHMAP=FreezerCoolSmkM X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FreezerCoolSmkR MESH=FreezerCoolSmkR
#exec MESHMAP SCALE MESHMAP=FreezerCoolSmkR X=0.0255 Y=0.0255 Z=0.051

#exec MESHMAP NEW MESHMAP=FreezerCoolSmkMR MESH=FreezerCoolSmkMR
#exec MESHMAP SCALE MESHMAP=FreezerCoolSmkMR X=0.0255 Y=0.0255 Z=0.051

//===========================================================================

simulated function setHand( bool bRight)
{
	if (bRight)
	{
		RightMesh = Mesh'FreezerCoolSmkR';
		LeftMesh = Mesh'FreezerCoolSmkMR';
	}
}


defaultproperties
{
    Mesh=FreezerCoolSmk
	RightMesh=FreezerCoolSmk
	LeftMesh=FreezerCoolSmkM
	
	DrawScale=0.300000
	LifeSpan=0.750000
	ScaleGlow=1.000000
	RisingSpeed=-5.250000
	
	bHidden=True
}
