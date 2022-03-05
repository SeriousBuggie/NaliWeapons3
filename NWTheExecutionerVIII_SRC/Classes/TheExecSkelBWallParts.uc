//////////////////////////////////////////////////////////////
//				Feralidragon (29-01-2012)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecSkelBWallParts expands NWWallFX;

simulated function InitPlayFX()
{
local NWWallFrag wf;
local byte i;
local vector VRot, VLoc;
	
	for (i = 0; i < 20; i++)
	{
		VRot.X = 10;
		VRot.Y = Rand(4) - 2;
		VRot.Z = Rand(4) - 2;
		
		VLoc = VRot * 50;
		VLoc.X = 0;
		
		if (WallTex != None)
		{
			wf = Spawn(Class'TheExecSkelBWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
			if (wf != None)
				wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
}
