//////////////////////////////////////////////////////////////
//				Feralidragon (28-10-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWMutator expands Mutator;

var() bool bLoadMutatorForClient;

var NWMutator NextNWMutator, NextNWClientMutator;


replication
{
	reliable if (Role == ROLE_Authority)
		NextNWClientMutator;
}


//INTERNAL
function PreBeginPlay()
{
	AddNWMutator(Self);
	if (bLoadMutatorForClient)
	{
		RemoteRole = ROLE_SimulatedProxy;
		bAlwaysRelevant = True;
		AddNWClientMutator(Self);
	}
}

final function AddNWMutator(NWMutator NWMut)
{
local Mutator M;

	for (M = Level.Game.BaseMutator; M != None; M = M.NextMutator)
	{
		if (NWMutator(M) != None && NWMutator(M).NextNWMutator == None)
		{
			NWMutator(M).NextNWMutator = NWMut;
			return;
		}
	}
}

final function AddNWClientMutator(NWMutator NWMut)
{
local Mutator M;

	for (M = Level.Game.BaseMutator; M != None; M = M.NextMutator)
	{
		if (NWMutator(M) != None && NWMutator(M).bLoadMutatorForClient && NWMutator(M).NextNWClientMutator == None)
		{
			NWMutator(M).NextNWClientMutator = NWMut;
			return;
		}
	}
}

//ZeroPing security plugins
function bool isValidZeroPingPreCheck(private bool isAltFire, private NaliWeapons NW, private Actor Other, private vector HitLoc, private vector Start, private vector OtherClientLoc, private vector OwnerClientLoc, 
private rotator OwnerClientVRot, private float Accuracy, private float AccY, private float AccZ, optional private out byte useStandardShot, optional out int ignoreFlags)
{
	if (NextNWMutator != None)
		return NextNWMutator.isValidZeroPingPreCheck(isAltFire, NW, Other, HitLoc, Start, OtherClientLoc, OwnerClientLoc, OwnerClientVRot, Accuracy, AccY, AccZ, useStandardShot, ignoreFlags);
	return True;
}

function bool isValidZeroPingPostCheck(private bool isAltFire, private NaliWeapons NW, private Actor Other, private vector HitLoc, private vector Start, private vector OtherClientLoc, private vector OwnerClientLoc, 
private rotator OwnerClientVRot, private float Accuracy, private float AccY, private float AccZ, optional private out byte useStandardShot)
{
	if (NextNWMutator != None)
		return NextNWMutator.isValidZeroPingPostCheck(isAltFire, NW, Other, HitLoc, Start, OtherClientLoc, OwnerClientLoc, OwnerClientVRot, Accuracy, AccY, AccZ, useStandardShot);
	return True;
}

//Z-Hack override
//	-1 - don't override
//	0|1 - override: set zhack to false|true
simulated function int getZHackBehavior(PlayerPawn PP)
{
	if (Role == ROLE_Authority && NextNWMutator != None)
		return NextNWMutator.getZHackBehavior(PP);
	else if (Role < ROLE_Authority && NextNWClientMutator != None)
		return NextNWClientMutator.getZHackBehavior(PP);
	return -1;
}

//isMonsterGame override
//	-1 - don't override
//	0|1 - override: return false|true
function int isMonsterGame()
{
	if (NextNWMutator != None)
		return NextNWMutator.isMonsterGame();
	return -1;
}

//isFriend override
//	-1 - don't override
//	0|1 - override: return false|true
function int isFriend(Pawn P, optional Pawn Instig, optional byte team, optional bool bNoHurtTeam, 
optional bool bNoHurtInstig, optional string ownerName, optional Actor src)
{
	if (NextNWMutator != None)
		return NextNWMutator.isFriend(P, Instig, team, bNoHurtTeam, bNoHurtInstig, ownerName, src);
	return -1;
}

//isSameHorde override
//	-1 - don't override
//	0|1 - override: return false|true
function int isSameHorde(Pawn P, Pawn Instig)
{
	if (NextNWMutator != None)
		return NextNWMutator.isSameHorde(P, Instig);
	return -1;
}

//isTeamMember override
//	-1 - don't override
//	0|1 - override: return false|true
simulated function int isTeamMember(Pawn PSource, Actor A)
{
	if (Role == ROLE_Authority && NextNWMutator != None)
		return NextNWMutator.isTeamMember(PSource, A);
	else if (Role < ROLE_Authority && NextNWClientMutator != None)
		return NextNWClientMutator.isTeamMember(PSource, A);
	return -1;
}

//getTeam override
//	-1 - don't override
//	0-255 - override: return team
simulated function int getTeam(Actor A)
{
	if (Role == ROLE_Authority && NextNWMutator != None)
		return NextNWMutator.getTeam(A);
	else if (Role < ROLE_Authority && NextNWClientMutator != None)
		return NextNWClientMutator.getTeam(A);
	return -1;
}

//isValidTarget override
//	-1 - don't override
//	0|1 - override: return false|true
simulated function int isValidTarget(Actor A, optional bool ignoreStationaryPawn)
{
	if (Role == ROLE_Authority && NextNWMutator != None)
		return NextNWMutator.isValidTarget(A, ignoreStationaryPawn);
	else if (Role < ROLE_Authority && NextNWClientMutator != None)
		return NextNWClientMutator.isValidTarget(A, ignoreStationaryPawn);
	return -1;
}

//isMonster override
//	-1 - don't override
//	0|1 - override: return false|true
simulated function int isMonster(Pawn P)
{
	if (Role == ROLE_Authority && NextNWMutator != None)
		return NextNWMutator.isMonster(P);
	else if (Role < ROLE_Authority && NextNWClientMutator != None)
		return NextNWClientMutator.isMonster(P);
	return -1;
}

//checkFilters override
//	-1 - don't override
//	0|1 - override: return false|true
function int checkFilters(string ID, string Filters, optional Pawn Other)
{
	if (NextNWMutator != None)
		return NextNWMutator.checkFilters(ID, Filters, Other);
	return -1;
}

//SetPropertiesOptions for new actor
function SetPropertiesOptions(string ID, Actor A)
{
	if (NextNWMutator != None)
		NextNWMutator.SetPropertiesOptions(ID, A);
}

//Ignore skill kill
function bool ignoreSkillKill(string ID, out string Msg, out string denyList, out int extraPoints, out int extraFrags)
{
	if (NextNWMutator != None)
		return NextNWMutator.ignoreSkillKill(ID, Msg, denyList, extraPoints, extraFrags);
	return False;
}

//Dynamically loaded profile event
function LoadedDynamicProfile(byte ProfileID)
{
	if (NextNWMutator != None)
		NextNWMutator.LoadedDynamicProfile(ProfileID);
}


defaultproperties
{
	bAlwaysTick=True
	bLoadMutatorForClient=True
}