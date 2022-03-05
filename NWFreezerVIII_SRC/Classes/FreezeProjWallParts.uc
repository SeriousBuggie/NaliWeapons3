//////////////////////////////////////////////////////////////
//				Feralidragon (05-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezeProjWallParts expands NWWallFX;

simulated function InitPlayFX()
{
local NWWallFrag wf;
local byte i;
local vector VRot, VLoc;
	
	if (WallTex != None)
	{
		for (i = 0; i < 3; i++)
		{
			VRot.X = 15;
			VRot.Y = Rand(100) - 50;
			VRot.Z = Rand(100) - 50;
			
			VLoc = VRot;
			VLoc.X = 0;
			
			wf = Spawn(Class'FreezeProjRemainWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
				
			if (wf != None)
				wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
}
