//////////////////////////////////////////////////////////////
//				Feralidragon (29-01-2012)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecSkelWallParts expands NWWallFX;

simulated function InitPlayFX()
{
local NWWallFrag wf;
local byte i;
local vector VRot, VLoc;
	
	for (i = 0; i < 25; i++)
	{
		VRot.X = 10;
		VRot.Y = Rand(5) - 2.5;
		VRot.Z = Rand(5) - 2.5;
		
		VLoc = VRot * 100;
		VLoc.X = 0;
		
		if (WallTex != None)
		{
			wf = Spawn(Class'TheExecSkelWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
			if (wf != None)
				wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
}
