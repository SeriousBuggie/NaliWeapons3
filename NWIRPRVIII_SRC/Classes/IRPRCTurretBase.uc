//////////////////////////////////////////////////////////////
//				Feralidragon (10-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCTurretBase expands NaliWActor;

#exec MESH IMPORT MESH=IRPRCTurretBase ANIVFILE=MODELS\IRPRCTurretBase_a.3d DATAFILE=MODELS\IRPRCTurretBase_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IRPRCTurretBase STRENGTH=0.0
#exec MESH ORIGIN MESH=IRPRCTurretBase X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IRPRCTurretBase SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRCTurretBase SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IRPRCTurretBase MESH=IRPRCTurretBase
#exec MESHMAP SCALE MESHMAP=IRPRCTurretBase X=0.6 Y=0.6 Z=1.2

#exec TEXTURE IMPORT NAME=Sk_IRPRCBase01 FILE=SKINS\Sk_IRPRCBase01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPRCTurretBase NUM=1 TEXTURE=Sk_IRPRCBase01


var float headRotYaw;
var float rotAngRate, rotYaw;

simulated function PostBeginPlay()
{
	headRotYaw = Rotation.Yaw;
	rotYaw = headRotYaw;
}

simulated function setRotAngRate(float rAngRate)
{
	rotAngRate = rAngRate;
}

simulated function rotateTo(float hRotYaw, optional float hRotPitch)
{
	headRotYaw = hRotYaw;
	if (Abs(rotYaw - headRotYaw) > 32768)
		rotYaw += (Class'NWUtils'.static.getSign(headRotYaw - rotYaw)*65536);
}

simulated function adjustSyncRot(float hRotYaw, float cRotYaw, optional float hRotPitch, optional float cRotPitch)
{
	headRotYaw = hRotYaw;
	rotYaw = cRotYaw;
}

simulated function Tick(float Delta)
{
local rotator R;
local bool isgrt;

	if (rotYaw != headRotYaw)
	{
		isgrt = (headRotYaw > rotYaw);
		rotYaw += (Class'NWUtils'.static.getSign(headRotYaw - rotYaw) * rotAngRate * Delta);
		if ((headRotYaw > rotYaw) != isgrt)
			rotYaw = headRotYaw;
		R = Rotation;
		R.Yaw = int(rotYaw);
		SetRotation(R);
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IRPRCTurretBase
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Physics=PHYS_None
	LifeSpan=0.000000
	bAlwaysRelevant=True
	bGameRelevant=True
}
