//////////////////////////////////////////////////////////////
//				Feralidragon (09-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeMassDebrisPartsLevelC expands NWWallFX;

var() float debrisMinScale, debrisMaxScale;

simulated function InitPlayFX()
{
local NukeMassDebrisLevelC wf;
local float Dist;
	
	if (WallTex != None && NuclearExplosionLevelC(Owner) != None)
	{
		wf = Spawn(Class'NukeMassDebrisLevelC',,, Location + vector(Rotation), Rotation);
		if (wf != None)
		{
			Dist = VSize(Location - Owner.Location);
			wf.SetLevitation(Owner.Location, Class'NukeMassDebrisLevelC'.default.RiseTime - (Owner.default.LifeSpan - Owner.LifeSpan), 
				(Dist*(debrisMaxScale - debrisMinScale)/NuclearExplosionLevelC(Owner).debrisRadius) + debrisMinScale);
			wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
	debrisMaxScale=2.500000
	debrisMinScale=0.500000
}
