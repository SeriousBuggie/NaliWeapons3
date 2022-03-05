//////////////////////////////////////////////////////////////
//				Feralidragon (07-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybNWPoint expands NWPoint;

var bool isEncroached;

function SetEncroachability(float CRadius, float CHeight)
{
	isEncroached = False;
	SetCollisionSize(CRadius, CHeight);
	SetCollision(True, True, True);
}

function Reset()
{
	isEncroached = False;
	SetCollisionSize(0.0, 0.0);
	SetCollision(False, False, False);
}

function bool EncroachingOn(Actor Other)
{
	//isEncroached = (Other.Brush == None);
	isEncroached = True;
	return False;
}

defaultproperties
{
}
