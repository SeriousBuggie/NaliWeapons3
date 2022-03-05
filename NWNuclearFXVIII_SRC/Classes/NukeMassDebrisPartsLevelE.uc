//////////////////////////////////////////////////////////////
//				Feralidragon (09-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeMassDebrisPartsLevelE expands NWWallFX;

var() float debrisMinScale, debrisMaxScale;
var() float dirFactor;

simulated function InitPlayFX()
{
local NukeMassDebrisLevelE wf;
local float Dist;
local vector dir;
	
	if (WallTex != None && NuclearExplosionLevelE(Owner) != None)
	{
		Dist = VSize(Location - Owner.Location);
		dir = Normal(Location - Owner.Location);
		wf = Spawn(Class'NukeMassDebrisLevelE',,, Location + vector(Rotation), Rotation);
		if (wf != None)
		{
			wf.SetForces(Normal(vector(Rotation) + dir*dirFactor), (Dist*(debrisMaxScale - debrisMinScale)/NuclearExplosionLevelE(Owner).debrisRadius) + debrisMinScale);
			wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
	debrisMaxScale=2.500000
	debrisMinScale=0.500000
	dirFactor=0.650000
}
