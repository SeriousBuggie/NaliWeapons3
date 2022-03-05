//////////////////////////////////////////////////////////////
//				Feralidragon (10-10-2010)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanIncandesDrill expands NaliWEffects;

//Left
#exec MESH IMPORT MESH=VulcanIncandesDrill ANIVFILE=MODELS\VulcanIncandesDrill_a.3d DATAFILE=MODELS\VulcanIncandesDrill_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=VulcanIncandesDrill STRENGTH=0
#exec MESH ORIGIN MESH=VulcanIncandesDrill X=0 Y=0 Z=0 Yaw=128

//Right
#exec MESH IMPORT MESH=VulcanIncandesDrillR ANIVFILE=MODELS\VulcanIncandesDrill_a.3d DATAFILE=MODELS\VulcanIncandesDrill_d.3d X=0 Y=0 Z=0 UNMIRROR=1 UNMIRRORTEX=4
#exec MESH LODPARAMS MESH=VulcanIncandesDrillR STRENGTH=0
#exec MESH ORIGIN MESH=VulcanIncandesDrillR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=VulcanIncandesDrill SEQ=All STARTFRAME=0 NUMFRAMES=95
#exec MESH SEQUENCE MESH=VulcanIncandesDrill SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanIncandesDrill SEQ=Fire1 STARTFRAME=0 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrill SEQ=Fire2 STARTFRAME=4 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrill SEQ=Fire3 STARTFRAME=8 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrill SEQ=Fire4 STARTFRAME=12 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrill SEQ=Fire5 STARTFRAME=16 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrill SEQ=Fire6 STARTFRAME=20 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrill SEQ=Fire7 STARTFRAME=24 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrill SEQ=AltFire STARTFRAME=29 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrill SEQ=EndFire STARTFRAME=52 NUMFRAMES=43 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrill SEQ=Select STARTFRAME=45 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=VulcanIncandesDrill SEQ=Down STARTFRAME=39 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=VulcanIncandesDrillR SEQ=All STARTFRAME=0 NUMFRAMES=95
#exec MESH SEQUENCE MESH=VulcanIncandesDrillR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanIncandesDrillR SEQ=Fire1 STARTFRAME=0 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrillR SEQ=Fire2 STARTFRAME=4 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrillR SEQ=Fire3 STARTFRAME=8 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrillR SEQ=Fire4 STARTFRAME=12 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrillR SEQ=Fire5 STARTFRAME=16 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrillR SEQ=Fire6 STARTFRAME=20 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrillR SEQ=Fire7 STARTFRAME=24 NUMFRAMES=5 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrillR SEQ=AltFire STARTFRAME=29 NUMFRAMES=11 RATE=11.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrillR SEQ=EndFire STARTFRAME=52 NUMFRAMES=43 RATE=5.0
#exec MESH SEQUENCE MESH=VulcanIncandesDrillR SEQ=Select STARTFRAME=45 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=VulcanIncandesDrillR SEQ=Down STARTFRAME=39 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=VulcanIncandesDrill MESH=VulcanIncandesDrill
#exec MESHMAP SCALE MESHMAP=VulcanIncandesDrill X=0.06 Y=0.06 Z=0.12

#exec MESHMAP NEW MESHMAP=VulcanIncandesDrillR MESH=VulcanIncandesDrillR
#exec MESHMAP SCALE MESHMAP=VulcanIncandesDrillR X=0.06 Y=0.06 Z=0.12

//Skins
#exec TEXTURE IMPORT NAME=IncandesDrill FILE=SKINS\IncandesDrill.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=VulcanIncandesDrill NUM=1 TEXTURE=IncandesDrill
#exec MESHMAP SETTEXTURE MESHMAP=VulcanIncandesDrillR NUM=1 TEXTURE=IncandesDrill


var() mesh IncandesMeshR, IncandesMeshL;

simulated function HandleMesh(bool bRightHand)
{
	if (bRightHand)
		Mesh = IncandesMeshR;
	else
		Mesh = IncandesMeshL;
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=VulcanIncandesDrill
	Style=STY_Translucent
	ScaleGlow=1.500000
	bUnlit=True
	bHidden=True
	
	IncandesMeshR=VulcanIncandesDrillR
	IncandesMeshL=VulcanIncandesDrill
}
