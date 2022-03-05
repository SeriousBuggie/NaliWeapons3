//////////////////////////////////////////////////////////////
//				Feralidragon (12-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCLaserWallParts expands NWWallFX;

simulated function InitPlayFX()
{
local NWWallFrag wf;
local byte i;
local vector VRot, VLoc;
	
	for (i = 0; i < 3; i++)
	{
		VRot.X = 5;
		VRot.Y = Rand(100) - 50;
		VRot.Z = Rand(100) - 50;
		
		VLoc = VRot;
		VLoc.X = 0;
		
		if (WallTex != None)
		{
			wf = Spawn(Class'IRPRCLaserWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
			if (wf != None)
				wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
}
