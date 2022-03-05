//////////////////////////////////////////////////////////////
//				Feralidragon (31-12-2012)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybLifeline expands NaliWActor;

var Cybot C;

function InitLifeline(Cybot Cyb, float LTime)
{
	if (Cyb == None || LTime <= 0.0)
	{
		Destroy();
		return;
	}
	C = Cyb;
	SetTimer(LTime, False);
}

function Timer()
{
	if (C != None)
	{
		C.MakeNoise(1.65);
		C.ExplodeSelf(C.MasterPawn);
		C.Destroy();
	}
	Destroy();
}

defaultproperties
{
	RemoteRole=ROLE_None
	bHidden=True
}
