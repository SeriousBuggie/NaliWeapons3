//////////////////////////////////////////////////////////////
//				Feralidragon (30-04-2012)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravMut expands Mutator;

struct GravInstigators
{
	var Pawn V, K;
	var bool isGrabbed;
	var bool bKill;
	var bool bPurge;
};

var() name GravitonPushDamageType;
var GravInstigators GravInstigationList[64];
var float GravCounter;

function bool PreventDeath(Pawn Killed, Pawn Killer, name damageType, vector HitLocation)
{
local bool isPreventDeath;
local Pawn newKiller;

	isPreventDeath = (NextMutator != None && NextMutator.PreventDeath(Killed, Killer, damageType, HitLocation));
	if (!isPreventDeath && damageType != GravitonPushDamageType && (Killer == None || Killer == Killed) && isInGrabList(Killed))
	{
		if (isInGrabKillList(Killed))
		{
			newKiller = getRealKiller(Killed);
			if (newKiller != None)
			{
				processGrabKill(Killed);
				return True;
			}
		}
		removeFromGrabList(Killed);
	}
    return isPreventDeath;
}

function Tick(float Delta)
{
local int i, limit;

	limit = -1;
	for (i = 0; i < ArrayCount(GravInstigationList); i++)
	{
		if (GravInstigationList[i].V == None)
			break;
		
		limit = i;
		if (GravInstigationList[i].bKill)
		{
			GravInstigationList[i].V.Died(GravInstigationList[i].K, GravitonPushDamageType, GravInstigationList[i].K.Location);
			GravInstigationList[i].bPurge = True;
		}
	}
	
	for (i = limit; i >= 0; i--)
	{
		if (GravInstigationList[i].bPurge)
			removeFromGrabListByIndex(i);
	}
}

function addToGravList(Pawn Victim, Pawn Killer)
{
local byte i;
	
	if (Victim == None || Killer == None)
		return;

	for (i = 0; i < ArrayCount(GravInstigationList); i++)
	{
		if (GravInstigationList[i].V == None || GravInstigationList[i].V == Victim)
		{
			GravInstigationList[i].K = Killer;
			GravInstigationList[i].V = Victim;
			GravInstigationList[i].isGrabbed = False;
			GravInstigationList[i].bKill = False;
			GravInstigationList[i].bPurge = False;
			return;
		}
	}
}

function Pawn getRealKiller(Pawn Victim)
{
local byte i;

	if (Victim == None)
		return None;
	
	for (i = 0; i < ArrayCount(GravInstigationList); i++)
	{
		if (GravInstigationList[i].V == Victim)
			return GravInstigationList[i].K;
	}
	return None;
}

function processGrabKill(Pawn Victim)
{
local byte i;

	if (Victim == None)
		return;
	
	for (i = 0; i < ArrayCount(GravInstigationList); i++)
	{
		if (GravInstigationList[i].V == Victim)
		{
			GravInstigationList[i].bKill = True;
			return;
		}
	}
}

function processGrabVictim(Pawn Victim, bool bGrab)
{
local byte i;

	if (Victim == None)
		return;
		
	for (i = 0; i < ArrayCount(GravInstigationList); i++)
	{
		if (GravInstigationList[i].V == Victim)
		{
			GravInstigationList[i].isGrabbed = bGrab;
			return;
		}
	}
}

function bool isInGrabKillList(Pawn Victim)
{
local byte i;
local Pawn P;

	if (Victim == None)
		return False;

	for (i = 0; i < ArrayCount(GravInstigationList); i++)
	{
		P = GravInstigationList[i].V;
		if (P == None)
			return False;
		else if (P == Victim)
		{
			if (GravInstigationList[i].isGrabbed || (P.Physics == PHYS_Falling || P.Region.Zone.DamagePerSec > 0 || P.Region.Zone.bKillZone))
				return True;
			removeFromGrabList(Victim);
		}
	}
	return False;
}

function bool isInGrabList(Pawn Victim)
{
local byte i;

	if (Victim == None)
		return False;

	for (i = 0; i < ArrayCount(GravInstigationList); i++)
	{
		if (GravInstigationList[i].V == None)
			return False;
		else if (GravInstigationList[i].V == Victim)
			return True;
	}
	return False;
}

function removeFromGrabList(Pawn Victim)
{
local byte i;

	if (Victim == None)
		return;

	for (i = 0; i < ArrayCount(GravInstigationList); i++)
	{
		if (GravInstigationList[i].V == None)
			return;
		else if (GravInstigationList[i].V == Victim)
			removeFromGrabListByIndex(i);
	}
}

function removeFromGrabListByIndex(byte i)
{
local byte j, lastI;

	if (GravInstigationList[i].V == None)
		return;

	for (j = i; j < (ArrayCount(GravInstigationList)-1); j++)
	{
		GravInstigationList[j] = GravInstigationList[j+1];
		if (GravInstigationList[j].V == None)
			return;
	}
	
	lastI = ArrayCount(GravInstigationList) - 1;
	GravInstigationList[lastI].V = None;
	GravInstigationList[lastI].K = None;
	GravInstigationList[lastI].isGrabbed = False;
	GravInstigationList[lastI].bKill = False;
	GravInstigationList[lastI].bPurge = False;
}

defaultproperties
{
	GravitonPushDamageType=GravitonPush
}


