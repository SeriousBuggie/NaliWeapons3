//////////////////////////////////////////////////////////////
//				Feralidragon (22-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FrozenImpaledBody expands FrozenBody;

var vector startLoc, endLoc;
var float locTime, locTCount;

replication
{
	reliable if (Role == ROLE_Authority && bNetInitial)
		startLoc, endLoc, locTime, locTCount;
}

function TakeDamage(int NDamage, Pawn instigatedBy, Vector hitlocation, vector momentum, name damageType);
simulated function Landed(vector HitNormal);
simulated function HitWall(vector HitNormal, actor Wall);
function Touch(actor Other);
function Bump(actor Other);

function SetTravel(vector sLoc, vector eLoc, float trTime)
{
local rotator R;

	startLoc = sLoc;
	endLoc = eLoc;
	locTime = trTime;
	locTCount = locTime;
	
	R = rotator(eLoc - sLoc);
	R.Roll = int(FRand()*65536 - 32768);
	SetRotation(R);
	PrePivot = ((CollisionHeight * vect(0,0,-0.35)) >> R);
}

simulated function Tick(float Delta)
{
	if (locTCount > 0.0)
	{
		locTCount -= Delta;
		if (locTCount < 0.0)
			locTCount = 0.0;
		SetLocation(endLoc + (startLoc - endLoc)*(locTCount/locTime));
	}
	
	Super.Tick(Delta);
}

defaultproperties
{
	LifeSpan=22.000000
	bFallingBody=False
	bCollidableBody=False
	RemoteRole=ROLE_SimulatedProxy
}
