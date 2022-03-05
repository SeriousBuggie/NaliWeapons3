//////////////////////////////////////////////////////////////
//				Feralidragon (30-10-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMissileTurretBase expands NaliWActor;

#exec MESH IMPORT MESH=MultiMissileTurretBase ANIVFILE=MODELS\MultiMissileTurretBase_a.3d DATAFILE=MODELS\MultiMissileTurretBase_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=MultiMissileTurretBase STRENGTH=0.0
#exec MESH ORIGIN MESH=MultiMissileTurretBase X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MultiMissileTurretBase SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MultiMissileTurretBase SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=MultiMissileTurretBase MESH=MultiMissileTurretBase
#exec MESHMAP SCALE MESHMAP=MultiMissileTurretBase X=0.6 Y=0.6 Z=1.2

#exec TEXTURE IMPORT NAME=Sk_MultiMBase01 FILE=SKINS\Sk_MultiMBase01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MultiMissileTurretBase NUM=1 TEXTURE=Sk_MultiMBase01


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
	Mesh=MultiMissileTurretBase
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Physics=PHYS_None
	LifeSpan=0.000000
	bAlwaysRelevant=True
	bGameRelevant=True
}
