//////////////////////////////////////////////////////////////
//				Feralidragon (21-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeBWallParts expands NWWallFX;

simulated function InitPlayFX()
{
local NWWallFrag wf;
local byte i;
local vector VRot, VLoc;
	
	if (WallTex != None)
	{
		for (i = 0; i < 30; i++)
		{
			VRot.X = 300;
			VRot.Y = Rand(200) - 100;
			VRot.Z = Rand(200) - 100;
			
			VLoc = VRot;
			VLoc.X = 0;
			
			wf = Spawn(Class'NukeBWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
				
			if (wf != None)
				wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
}
