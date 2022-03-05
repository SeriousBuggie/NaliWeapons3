//////////////////////////////////////////////////////////////
//				Feralidragon (24-12-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonChargePartDebris expands NWWallFX;

var() float debrisMinScale, debrisMaxScale;
var() float dirFactor;

simulated function InitPlayFX()
{
local IonChargeDebris wf;
local float Dist;
local vector dir;
	
	if (WallTex != None && IonNukeTrigger(Owner) != None)
	{
		Dist = VSize(Location - Owner.Location);
		dir = Normal(Location - Owner.Location);
		
		wf = Spawn(Class'IonChargeDebris', Owner,, Location + vector(Rotation), Rotation);
		wf.SetForces(Normal(vector(Rotation) + dir*dirFactor), 
			(Dist*(debrisMaxScale - debrisMinScale)/IonNukeTrigger(Owner).debrisRadius) + debrisMinScale);
		
		if (wf != None)
			wf.MultiSkins[1] = WallTex;
	}
}

defaultproperties
{
	debrisMaxScale=2.500000
	debrisMinScale=0.500000
	dirFactor=0.150000
}
