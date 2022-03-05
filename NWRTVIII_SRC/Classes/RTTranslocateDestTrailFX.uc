//////////////////////////////////////////////////////////////
//				Feralidragon (07-04-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTTranslocateDestTrailFX expands RTTranslocateTrailFX;

var() float MinSeeDistance;

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	if (Level.NetMode != NM_DedicatedServer && Owner != None)
		bOwnerNoSee = (VSize(Owner.Location - Location) < MinSeeDistance);
}

defaultproperties
{
	bOwnerNoSee=True
	MinSeeDistance=64.000000
}
