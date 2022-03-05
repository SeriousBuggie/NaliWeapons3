//////////////////////////////////////////////////////////////
//				Feralidragon (09-02-2012)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecChargedWallParts expands NWWallFX;

simulated function InitPlayFX()
{
local NWWallFrag wf;
local byte i;
local vector VRot, VLoc;
	
	for (i = 0; i < 9; i++)
	{
		VRot.X = 1;
		VRot.Y = Rand(4) - 2;
		VRot.Z = Rand(4) - 2;
		
		VLoc = VRot;
		VLoc.X = 0;
		
		if (WallTex != None)
		{
			wf = Spawn(Class'TheExecChargedWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
			if (wf != None)
				wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
}
