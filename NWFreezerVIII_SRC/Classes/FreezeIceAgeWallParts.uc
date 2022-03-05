//////////////////////////////////////////////////////////////
//				Feralidragon (14-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezeIceAgeWallParts expands NWWallFX;

var float partsScale;

simulated function SetScale(float s)
{
	partsScale = s;
}

simulated function InitPlayFX()
{
local NWWallFrag wf;
local byte i;
local vector VRot, VLoc;
	
	if (WallTex != None)
	{
		for (i = 0; i < int(30*partsScale); i++)
		{
			VRot.X = 32*partsScale;
			VRot.Y = (Rand(30) - 15)*partsScale;
			VRot.Z = (Rand(30) - 15)*partsScale;
			
			VLoc = VRot;
			VLoc.X = 0;
			
			wf = Spawn(Class'FreezeIceAgeWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
			if (wf != None)
			{
				wf.MultiSkins[1] = WallTex;
				wf.InitMinForce *= partsScale;
				wf.InitMaxForce *= partsScale;
				wf.MinDrawScale *= partsScale;
				wf.MaxDrawScale *= partsScale;
			}
		}
	}
}

defaultproperties
{
	partsScale=1.000000
}
