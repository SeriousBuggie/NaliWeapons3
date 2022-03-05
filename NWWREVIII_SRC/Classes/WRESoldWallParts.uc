//////////////////////////////////////////////////////////////
//				Feralidragon (10-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESoldWallParts expands NWWallFX;

simulated function InitPlayFX()
{
local NWWallFrag wf;
local byte i;
local vector VRot, VLoc;
	
	for (i = 0; i < 2; i++)
	{
		VRot.X = 15;
		VRot.Y = Rand(100) - 50;
		VRot.Z = Rand(100) - 50;
		
		VLoc = VRot;
		VLoc.X = 0;
		
		if (WallTex != None)
		{
			wf = Spawn(Class'WRESoldWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
			if (wf != None)
				wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
}
