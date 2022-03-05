//////////////////////////////////////////////////////////////
//	Nali Weapons III MultiMissile Launcher location point guide
//				Feralidragon (10-06-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MLocPoint expands NaliWActor;

var bool bOn;

replication
{
	reliable if (Role == ROLE_Authority)
		bOn;
}

function PreBeginPlay()
{
	bOn = True;
	SetTimer(0.25, True);
}

function Timer()
{
	bOn = (Owner != None && !Owner.bDeleteMe && Pawn(Owner.Owner) != None && Pawn(Owner.Owner).Weapon == Owner &&
	!Pawn(Owner.Owner).bHidden && Pawn(Owner.Owner).Health > 0);
}

defaultproperties
{
	bHidden=True
	bAlwaysRelevant=True
	bNetTemporary=False
	LifeSpan=0.000000
	NetPriority=3.000000
	NetUpdateFrequency=10.000000
}
