//////////////////////////////////////////////////////////////
//				Feralidragon (30-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class LandMineWallParts expands NWWallFX;

var byte bitsCount;

simulated function AnimEnd()
{
    InitPlayFX();
	PlayAnim('Hit',0.275);
	
	if (bitsCount >= 5)
		Destroy();
}

simulated function InitPlayFX()
{
local NWWallFrag wf;
local vector VRot, VLoc;
	
	if (bitsCount < 5)
	{
		VRot.X = 15;
		VRot.Y = Rand(48) - 24;
		VRot.Z = Rand(48) - 24;
		
		VLoc = VRot;
		VLoc.X = 0;
		
		if (WallTex != None)
		{
			wf = Spawn(Class'LandMineWallFrag',,, Location + (VLoc >> Rotation), rotator(VRot >> Rotation));
			
			if (wf != None)
				wf.MultiSkins[1] = WallTex;
		}
		
		bitsCount++;
	}
}

defaultproperties
{
	LifeSpan=0.600000
}
