//////////////////////////////////////////////////////////////
//				Feralidragon (09-09-2010)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVXFragSpot expands NWWallFX;

simulated function InitPlayFX()
{
local CybVXFrag wf;

	if (WallTex != None && Owner != None)
	{
		wf = Spawn(Class'CybVXFrag', Owner,, Location);		
		if (wf != None)
			wf.MultiSkins[1] = WallTex;
	}
	
	Destroy();
}

defaultproperties
{
}
