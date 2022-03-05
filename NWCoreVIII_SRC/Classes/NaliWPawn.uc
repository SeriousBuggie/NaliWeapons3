//////////////////////////////////////////////////////////////
//	Nali Weapons III Pawn base class
//				Feralidragon (02-01-2011)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NaliWPawn expands StationaryPawn 
abstract;

var() byte MyTeam;
var() bool bMachine;
var Pawn MasterPawn;
var() bool bIsTeamElement;
var string ownerName;

replication
{
	reliable if (Role == ROLE_Authority)
		MyTeam, bMachine, MasterPawn, bIsTeamElement;
}

function setMaster(Pawn P)
{
	if (P != None)
	{
		Instigator = P;
		MasterPawn = P;
		if (P.PlayerReplicationInfo != None)
		{
			ownerName = P.PlayerReplicationInfo.PlayerName;
			if (P.PlayerReplicationInfo.Team < 4)
			{
				MyTeam = P.PlayerReplicationInfo.Team;
				bIsTeamElement = Level.Game.bTeamGame;
			}
		}	
	}
	else
	{
		MasterPawn = None;
		Instigator = Self;
		ownerName = "";
		MyTeam = 0;
		bIsTeamElement = False;
	}
}

function bool isSameTeam(byte nTeam)
{
	return (nTeam == MyTeam);
}

function bool isFriend(actor A)
{
	if (A == None)
		return False;
	
	if (Pawn(A) != None)
		return Class'NWUtils'.static.isFriend(Pawn(A), Level, Instigator, MyTeam, True, True, ownerName, Self);
	else if (A.Instigator != None)
		return Class'NWUtils'.static.isFriend(A.Instigator, Level, Instigator, MyTeam, True, True, ownerName, Self);
	return False;
}


//Stationary specific functions override
function SetTeam(int TeamNum)
{
	if (TeamNum < 4)
		MyTeam = TeamNum;
}

simulated function AddVelocity(vector NewVelocity)
{
	Super(Pawn).AddVelocity(NewVelocity);
}

function bool SameTeamAs(int TeamNum)
{
    return (bIsTeamElement && isSameTeam(TeamNum));
}


defaultproperties
{
	bReplicateInstigator=True
	bGameRelevant=True
	bCanFly=False
	MaxDesiredSpeed=1.000000
	GroundSpeed=320.000000
	WaterSpeed=200.000000
	AccelRate=500.000000
	JumpZ=325.000000
	MaxStepHeight=25.000000
	Visibility=128
	SightRadius=2500.000000
	HearingThreshold=1.000000
	FovAngle=90.000000
	Health=100
	AttitudeToPlayer=ATTITUDE_Hate
	Intelligence=BRAINS_MAMMAL
	bCanTeleport=True
	bStasis=True
	RemoteRole=ROLE_SimulatedProxy
	RotationRate=(Pitch=4096,Yaw=50000,Roll=3072)
}