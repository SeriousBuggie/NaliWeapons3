//////////////////////////////////////////////////////////////
//				Feralidragon (08-08-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESoldLifeline expands NaliWActor;

var WRESoldier S;

function InitLifeline(WRESoldier Sold, float LTime)
{
	if (Sold == None || LTime <= 0.0)
	{
		Destroy();
		return;
	}
	S = Sold;
	SetTimer(LTime, False);
}

function Timer()
{
	if (S != None)
	{
		S.MakeNoise(1.65);
		S.ExplodeSelf(S.MasterPawn);
		S.Destroy();
	}
	Destroy();
}

defaultproperties
{
	RemoteRole=ROLE_None
	bHidden=True
}
