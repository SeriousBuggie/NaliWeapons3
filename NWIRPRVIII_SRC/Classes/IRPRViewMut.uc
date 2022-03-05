//////////////////////////////////////////////////////////////
//				Feralidragon (26-06-2011)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRViewMut expands Mutator;

function PostBeginPlay()
{
	SetTimer(5.0, True);
}

function Timer()
{
local Pawn P;

	for (P = Level.PawnList; P != None; P = P.NextPawn)
	{
		if (!P.bAlwaysRelevant && (Bot(P) != None || PlayerPawn(P) != None))
			P.bAlwaysRelevant = True;
	}
}