//////////////////////////////////////////////////////////////
//				Feralidragon (25-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeElectricDebrisPartsLevelE expands NukeMassDebrisPartsLevelE;

var() byte debrisMaxCap;

simulated function InitPlayFX()
{
local NukeElectricDebrisLevelE wf;
local float Dist, rad;
local byte i, maxDebris;
local vector VRot, VLoc;
	
	if (WallTex != None && NuclearExplosionLevelE(Owner) != None)
	{
		Dist = VSize(Location - Owner.Location);
		maxDebris = Min(debrisMaxCap, Byte(4 * Dist/NuclearExplosionLevelE(Owner).LightningMaxDistance));
		
		for (i = 0; i < maxDebris; i++)
		{
			rad = Dist/100;
			VRot.X = rad;
			VRot.Y = (FRand()*rad*2) - rad;
			VRot.Z = (FRand()*rad*2) - rad;
			
			VLoc = VRot;
			VLoc.X = 0;
			
			wf = Spawn(Class'NukeElectricDebrisLevelE',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
			
			if (wf != None)
			{
				wf.MultiSkins[1] = WallTex;
				wf.SetForces((Dist*(debrisMaxScale - debrisMinScale)/NuclearExplosionLevelE(Owner).debrisRadius) + debrisMinScale);
			}
		}
	}
}

defaultproperties
{
	debrisMaxScale=1.500000
	debrisMinScale=0.500000
	debrisMaxCap=5
}
