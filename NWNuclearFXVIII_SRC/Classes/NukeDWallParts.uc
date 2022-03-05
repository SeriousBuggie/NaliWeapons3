//////////////////////////////////////////////////////////////
//				Feralidragon (21-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeDWallParts expands NWWallFX;

simulated function InitPlayFX()
{
local NWWallFrag wf;
local byte i;
local vector VRot, VLoc;
	
	if (WallTex != None)
	{
		for (i = 0; i < Class'NuclearExplosionLevelD'.default.FlyingDebrisAmount; i++)
		{
			VRot.X = 85;
			VRot.Y = Rand(200) - 100;
			VRot.Z = Rand(200) - 100;
			
			VLoc = VRot;
			VLoc *= 4.25;
			VLoc.X = 100;
			
			wf = Spawn(Class'NukeDWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
				
			if (wf != None)
				wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
}
