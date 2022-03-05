//////////////////////////////////////////////////////////////
//				Feralidragon (30-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class VehMineWallParts expands NWWallFX;

simulated function InitPlayFX()
{
local NWWallFrag wf;
local byte i;
local vector VRot, VLoc;
	
	if (WallTex != None)
	{
		for (i = 0; i < 6; i++)
		{
			VRot.X = 2000;
			VRot.Y = Rand(600) - 300;
			VRot.Z = Rand(600) - 300;
			
			VLoc = VRot;
			VLoc.X = 0;
			
			wf = Spawn(Class'VehMineWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
			
			if (wf != None)
				wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
}
