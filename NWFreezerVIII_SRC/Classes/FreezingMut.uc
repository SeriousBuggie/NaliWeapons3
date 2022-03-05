//////////////////////////////////////////////////////////////
//				Feralidragon (04-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezingMut expands Mutator;

var PlayerPawn PlayerList[32];
var byte PPointer;

function PostBeginPlay()
{
	SetTimer(0.2, True);
}

function bool PreventDeath(Pawn Killed, Pawn Killer, name damageType, vector HitLocation)
{
local bool cannotDie;

	if (NextMutator != None)
        cannotDie = NextMutator.PreventDeath(Killed,Killer, damageType,HitLocation);
	
	if (!cannotDie && damageType == 'Frozen' && Killer != None)
	{
		Killed.Health = 0;
		if (PlayerPawn(Killed) != None && PPointer < ArrayCount(PlayerList))
		{
			PlayerList[PPointer] = PlayerPawn(Killed);
			PPointer++;
		}
	}

    return cannotDie;
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	return (Carcass(Other) == None || !IsInList(Other.Instigator));
}

function Timer()
{
	if (PlayerList[0] == None)
		return;
	CleanList();
}

function CleanList()
{
local byte i;

	for (i = 0; i < ArrayCount(PlayerList); i++)
		PlayerList[i] = None;
	PPointer = 0;
}

function bool IsInList( Pawn P)
{
local byte i;
	
	if (PlayerPawn(P) == None)
		return False;

	for (i = 0; i < ArrayCount(PlayerList); i++)
	{
		if (PlayerList[i] == None)
			return False;
		else if (PlayerPawn(P) == PlayerList[i])
			return True;
	}
	
	return False;
}