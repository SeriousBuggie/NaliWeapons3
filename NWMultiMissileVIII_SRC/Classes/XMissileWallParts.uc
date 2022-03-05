//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class XMissileWallParts expands NWWallFX;

simulated function InitPlayFX()
{
local NWWallFrag wf;
local byte i;
local vector VRot, VLoc;
	
	if (WallTex != None)
	{
		for (i = 0; i < 18; i++)
		{
			VRot.X = 300;
			VRot.Y = Rand(600) - 300;
			VRot.Z = Rand(600) - 300;
			
			VLoc = VRot;
			VLoc.X = 0;
			
			wf = Spawn(Class'XMissileWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
				
			if (wf != None)
				wf.MultiSkins[1] = WallTex;
		}
	}
}

defaultproperties
{
}
