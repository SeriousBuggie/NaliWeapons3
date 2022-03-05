//////////////////////////////////////////////////////////////
//				Feralidragon (10-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCannonInnerLaser expands NaliWActor;

#exec MESH IMPORT MESH=IRPRCannonInnerLaser ANIVFILE=MODELS\IRPRCannonInnerLaser_a.3d DATAFILE=MODELS\IRPRCannonInnerLaser_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IRPRCannonInnerLaser STRENGTH=0.0
#exec MESH ORIGIN MESH=IRPRCannonInnerLaser X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=IRPRCannonInnerLaser SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=IRPRCannonInnerLaser SEQ=Opened STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRCannonInnerLaser SEQ=Closed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRCannonInnerLaser SEQ=Opening STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPRCannonInnerLaser SEQ=Closing STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=IRPRCannonInnerLaser MESH=IRPRCannonInnerLaser
#exec MESHMAP SCALE MESHMAP=IRPRCannonInnerLaser X=0.3 Y=0.3 Z=0.6

#exec TEXTURE IMPORT NAME=Sk_IRPRCannon_01 FILE=SKINS\Sk_IRPRCannon_01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPRCannonInnerLaser NUM=1 TEXTURE=Sk_IRPRCannon_01

#exec TEXTURE IMPORT NAME=IRPRCLaserTrace FILE=CORONAS\IRPRCLaserTrace.bmp GROUP=Skins LODSET=0 MIPS=OFF
#exec MESHMAP SETTEXTURE MESHMAP=IRPRCannonInnerLaser NUM=2 TEXTURE=IRPRCLaserTrace


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IRPRCannonInnerLaser
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Physics=PHYS_None
	LifeSpan=0.000000
	bAlwaysRelevant=True
	bGameRelevant=True
	bAnimByOwner=True
	
	Style=STY_Translucent
	ScaleGlow=1.500000
	bUnlit=True
	
	SoundVolume=255
	SoundRadius=255
	SoundPitch=64
}
