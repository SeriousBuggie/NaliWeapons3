//////////////////////////////////////////////////////////////
//				Feralidragon (24-08-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravVtxFragSpot expands NWWallFX;

simulated function InitPlayFX()
{
local GravVtxFrag wf;

	if (WallTex != None && Owner != None)
	{
		wf = Spawn(Class'GravVtxFrag', Owner,, Location);		
		if (wf != None)
			wf.MultiSkins[1] = WallTex;
	}
	
	Destroy();
}

defaultproperties
{
}
