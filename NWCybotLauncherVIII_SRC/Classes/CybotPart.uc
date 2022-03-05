//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybot Part (bases or turrets)
//				Feralidragon (01-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybotPart expands NaliWActor
abstract;

var() bool bTurret;
var rotator InitialRotation;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	InitialRotation = Rotation;
}

simulated function Tick( float Delta)
{
local rotator R;

	if (bTurret && Owner != None)
	{
		if ((Cybot(Owner) == None || !Cybot(Owner).bSleeping) && Rotation.Yaw != Owner.Rotation.Yaw)
		{
			R.Yaw = Owner.Rotation.Yaw;
			SetRotation(R);
		}
		else if (Cybot(Owner) != None && Cybot(Owner).bSleeping && Rotation.Yaw != InitialRotation.Yaw)
		{
			R.Yaw = InitialRotation.Yaw;
			SetRotation(R);
		}
	}
}

simulated function SetTeam(byte n);


defaultproperties
{
	DrawType=DT_Mesh
	RemoteRole=ROLE_SimulatedProxy
	Physics=PHYS_None
	bAnimByOwner=True
	CollisionRadius=0.000000
    CollisionHeight=0.000000
}
