//////////////////////////////////////////////////////////////
//				Feralidragon (21-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeAWallParts expands NWWallFX;

simulated function InitPlayFX()
{
local NWWallFrag wf;
local byte i;
local vector VRot, VLoc;
	
	if (WallTex != None)
	{
		for (i = 0; i < 24; i++)
		{
			VRot.X = 300;
			VRot.Y = Rand(600) - 300;
			VRot.Z = Rand(600) - 300;
			
			VLoc = VRot;
			VLoc.X = 0;
			
			wf = Spawn(Class'NukeAWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
				
			if (wf != None)
				wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
}
