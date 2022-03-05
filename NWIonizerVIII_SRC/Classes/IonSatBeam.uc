//////////////////////////////////////////////////////////////
//				Feralidragon (18-12-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatBeam expands NaliWEffects;

#exec MESH IMPORT MESH=IonSatBeam ANIVFILE=MODELS\IonSatBeam_a.3d DATAFILE=MODELS\IonSatBeam_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatBeam STRENGTH=0.0
#exec MESH ORIGIN MESH=IonSatBeam X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonSatBeam SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=IonSatBeam SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatBeam SEQ=ScalingDown STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IonSatBeam SEQ=ScalingUp STARTFRAME=1 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=IonSatBeam MESH=IonSatBeam
#exec MESHMAP SCALE MESHMAP=IonSatBeam X=1.2 Y=0.6 Z=1.2

#exec TEXTURE IMPORT NAME=IonSatBeam FILE=EFFECTS\IonSatBeam.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonSatBeam NUM=1 TEXTURE=IonSatBeam

#exec AUDIO IMPORT NAME="IonBeamAmb" FILE=SOUNDS\IonBeamAmb.wav GROUP="IonBeam"


var() float BeamLength;
var() float FadeInTime, FadeOutTime;

var IonSatBeam NextBeam;
var bool bRotated;
var float RotPitch, RotYaw, RotRoll;


replication
{
	reliable if (Role == ROLE_Authority)
		NextBeam;
	unreliable if (ROLE == Role_Authority)
		RotPitch, RotYaw, RotRoll;
}

simulated function PostBeginPlay()
{
	ScaleByAnim();
}

function BeginPlay()
{
	if (Role == ROLE_Authority)
	{
		RotPitch = Rotation.Pitch;
		RotYaw = Rotation.Yaw;
		RotRoll = Rotation.Roll;
	}
	
	AmbientSound = None;
}

function setNewRotationValues( float RPitch, float RYaw, float RRoll)
{
	RotPitch = RPitch;
	RotYaw = RYaw;
	RotRoll = RRoll;
}

function SetNextBeam(IonSatBeam nBeam)
{
	NextBeam = nBeam;
}

simulated function ScaleByAnim(optional bool bScaleDown)
{
	if (bScaleDown)
		PlayAnim('ScalingDown', 1/FadeOutTime, 0.0);
	else
		PlayAnim('ScalingUp', 1/FadeInTime, 0.0);
}

simulated function Tick(float Delta)
{
local rotator R;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (!bRotated && (RotPitch != 0 || RotYaw != 0 || RotRoll != 0))
		{
			R.Pitch = RotPitch;
			R.Yaw = RotYaw;
			R.Roll = RotRoll;
			SetRotation(R);
			bRotated = True;
		}
		
		if ((Default.LifeSpan - LifeSpan) <= FadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / FadeInTime;
		else if (LifeSpan <= FadeOutTime)
		{
			ScaleGlow = LifeSpan * Default.ScaleGlow / FadeOutTime;
			if (AnimSequence == 'ScalingUp')
				ScaleByAnim(True);
		}
		
		if (AmbientSound != None)
		{
			SoundPitch = 32 + Byte(128*ScaleGlow/Default.ScaleGlow);
			if (LifeSpan <= FadeOutTime)
				SoundVolume = Byte(LifeSpan * Default.SoundVolume / FadeOutTime);
		}
	}
}

simulated function Destroyed()
{
	if (NextBeam != None)
		NextBeam.Destroy();
	NextBeam = None;
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonSatBeam
	Style=STY_Translucent
	bUnlit=True
	ScaleGlow=2.000000
	bNetTemporary=False
	LifeSpan=15.000000
	
	BeamLength=383.750000
	FadeInTime=10.000000
	FadeOutTime=2.000000
	
	AmbientSound=IonBeamAmb
	SoundRadius=255
	SoundVolume=255
}
