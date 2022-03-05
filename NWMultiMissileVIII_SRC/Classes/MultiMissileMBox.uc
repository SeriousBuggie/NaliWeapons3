//////////////////////////////////////////////////////////////
//				Feralidragon (30-10-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMissileMBox expands MultiMissileTurretBase;

#exec MESH IMPORT MESH=MultiMissileMBox ANIVFILE=MODELS\MultiMissileMBox_a.3d DATAFILE=MODELS\MultiMissileMBox_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MultiMissileMBox STRENGTH=0.0
#exec MESH ORIGIN MESH=MultiMissileMBox X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=MultiMissileMBox SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MultiMissileMBox SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMissileMBox MESH=MultiMissileMBox
#exec MESHMAP SCALE MESHMAP=MultiMissileMBox X=0.15 Y=0.15 Z=0.3

#exec TEXTURE IMPORT NAME=Sk_MultiMBox01 FILE=SKINS\Sk_MultiMBox01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileMBox NUM=1 TEXTURE=Sk_MultiMBox01

#exec TEXTURE IMPORT NAME=Sk_MultiMBox02 FILE=SKINS\Sk_MultiMBox02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileMBox NUM=2 TEXTURE=Sk_MultiMBox02

#exec AUDIO IMPORT NAME="MMBoxRotAmb" FILE=SOUNDS\MMBoxRotAmb.wav GROUP="MMBase"


var() float BoxHeight, BoxWidth;
var() int PitchLimitDown, PitchLimitUp;
var float rotPitch, headRotPitch;
var MultiMissileMegaBase MMMB;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	headRotPitch = Rotation.Pitch;
	rotPitch = headRotPitch;
}

simulated function rotateTo(float hRotYaw, optional float hRotPitch)
{
	Super.rotateTo(hRotYaw, hRotPitch);
	headRotPitch = hRotPitch;
	if (headRotPitch < PitchLimitDown)
		headRotPitch = PitchLimitDown;
	else if (headRotPitch > PitchLimitUp)
		headRotPitch = PitchLimitUp;
	if (Abs(rotPitch - headRotPitch) > 32768)
		rotPitch += (Class'NWUtils'.static.getSign(headRotPitch - rotPitch)*65536);
}

simulated function adjustSyncRot(float hRotYaw, float cRotYaw, optional float hRotPitch, optional float cRotPitch)
{
	Super.adjustSyncRot(hRotYaw, cRotYaw, hRotPitch, cRotPitch);
	headRotPitch = hRotPitch;
	rotPitch = cRotPitch;
	if (headRotPitch < PitchLimitDown)
		headRotPitch = PitchLimitDown;
	else if (headRotPitch > PitchLimitUp)
		headRotPitch = PitchLimitUp;
}

simulated function Tick(float Delta)
{
local rotator R;
local bool isgrt;

	if (rotPitch != headRotPitch || rotYaw != headRotYaw)
		SoundVolume = default.SoundVolume;
	else
		SoundVolume = 0;

	Super.Tick(Delta);	
	if (rotPitch != headRotPitch)
	{
		isgrt = (headRotPitch > rotPitch);
		rotPitch += (Class'NWUtils'.static.getSign(headRotPitch - rotPitch) * rotAngRate * Delta);
		if ((headRotPitch > rotPitch) != isgrt)
			rotPitch = headRotPitch;
		R = Rotation;
		R.Pitch = int(rotPitch);
		SetRotation(R);
	}
	
	if (MMMB != None)
		MMMB.UpdatePHCollection();
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MultiMissileMBox
	AmbientSound=MMBoxRotAmb
	SoundVolume=255
	SoundRadius=192
	SoundPitch=32
	
	BoxHeight=48.000000
	BoxWidth=116.000000
	PitchLimitUp=9000
	PitchLimitDown=-5000
}
