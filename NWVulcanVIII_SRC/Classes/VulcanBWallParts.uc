//////////////////////////////////////////////////////////////
//				Feralidragon (14-10-2010)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanBWallParts expands NWWallFX;

simulated function InitPlayFX()
{
local NWWallFrag wf;
local vector VRot, VLoc;

	VRot.X = 15;
	VRot.Y = Rand(100) - 50;
	VRot.Z = Rand(100) - 50;
		
	VLoc = VRot;
	VLoc.X = 0;
		
	if (WallTex != None)
	{
		wf = Spawn(Class'VulcanBWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
			
		if (wf != None)
			wf.MultiSkins[1] = WallTex;
	}
}

defaultproperties
{
}
