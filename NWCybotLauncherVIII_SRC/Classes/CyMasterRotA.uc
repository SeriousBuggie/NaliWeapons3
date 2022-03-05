//////////////////////////////////////////////////////////////
//				Feralidragon (07-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyMasterRotA expands NaliWActor;

#exec MESH IMPORT MESH=CyMasterRotA ANIVFILE=MODELS\CyMasterRotA_a.3d DATAFILE=MODELS\CyMasterRotA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyMasterRotA STRENGTH=0
#exec MESH ORIGIN MESH=CyMasterRotA X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CyMasterRotA SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyMasterRotA SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CyMasterRotA MESH=CyMasterRotA
#exec MESHMAP SCALE MESHMAP=CyMasterRotA X=0.2 Y=0.2 Z=0.4

#exec TEXTURE IMPORT NAME=CyMasterRot_OV FILE=SKINS\CyMasterRot_OV.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CyMasterRotA NUM=1 TEXTURE=CyMasterRot_OV


var() class<CyMasterRotOVA> CyMasterRotOVClass;
var() float RotRate, RotRate2;

enum ERotComp
{
	ROTC_Pitch,
	ROTC_Yaw,
	ROTC_PitchYaw,
	ROTC_Roll
};
var() ERotComp UsedRotComponent;

var CyMasterRotOVA CyMasterRotOV;
var Actor CyConActor;
var float rotVal, rotVal2;
var bool bDependOnCyConRot;


replication
{
	reliable if (Role == ROLE_Authority)
		CyConActor;
}

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		CyMasterRotOV = Spawn(CyMasterRotOVClass, Self);
}

simulated function Tick(float Delta)
{
local rotator R;

	if (Level.NetMode != NM_DedicatedServer && CyConActor != None)
	{
		rotVal += (RotRate * Delta);
		while (rotVal >= 65536.f)
			rotVal -= 65536.f;
		rotVal2 += (RotRate2 * Delta);
		while (rotVal2 >= 65536.f)
			rotVal2 -= 65536.f;
		
		SetLocation(CyConActor.Location + CyConActor.PrePivot);
		if (UsedRotComponent == ROTC_Pitch)
			R.Pitch = int(rotVal);
		else if (UsedRotComponent == ROTC_Yaw)
			R.Yaw = int(rotVal);
		else if (UsedRotComponent == ROTC_PitchYaw)
		{
			R.Pitch = int(rotVal);
			R.Yaw = int(rotVal2);
		}
		else
			R.Roll = int(rotVal);
		if (bDependOnCyConRot)
			SetRotation(Class'NWUtils'.static.rTurn(CyConActor.Rotation, R));
		else
			SetRotation(R);
	}
}

simulated function Destroyed()
{
	if (CyMasterRotOV != None)
		CyMasterRotOV.Destroy();
	CyMasterRotOV = None;
	
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=CyMasterRotA
	bAlwaysRelevant=True
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	
	CyMasterRotOVClass=Class'CyMasterRotOVA'
	RotRate=60000.000000
	RotRate2=20000.000000
	UsedRotComponent=ROTC_PitchYaw
	bDependOnCyConRot=False
}
