//////////////////////////////////////////////////////////////
//				Feralidragon (05-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaDebrisParts expands NWWallFX;

var() byte debrisAmount;

simulated function InitPlayFX()
{
local NWWallFrag wf;
local float Dist, rad;
local byte i, maxDebris;
local vector VRot, VLoc;
	
	if (WallTex != None && Owner != None)
	{
		Dist = VSize(Location - Owner.Location);
		for (i = 0; i < debrisAmount; i++)
		{
			rad = Dist/100;
			VRot.X = rad;
			VRot.Y = (FRand()*rad*2) - rad;
			VRot.Z = (FRand()*rad*2) - rad;
			VLoc = VRot;
			VLoc.X = 0;
			
			wf = Spawn(Class'UltimaProjLightningDebris',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
			if (wf != None)
				wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
	debrisAmount=2
}
