//////////////////////////////////////////////////////////////
//				Feralidragon (24-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFireMPWallParts expands NWWallFX;

simulated function InitPlayFX()
{
local NWWallFrag wf;
local vector VRot, VLoc;
local byte i;

	for (i = 0; i < 10; i++)
	{
		VRot.X = 15;
		VRot.Y = Rand(100) - 50;
		VRot.Z = Rand(100) - 50;
			
		VLoc = VRot;
		VLoc.X = 0;
			
		if (WallTex != None)
		{
			wf = Spawn(Class'VulcanSkyFireMPWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
			if (wf != None)
				wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
}
