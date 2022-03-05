//////////////////////////////////////////////////////////////
//				Feralidragon (09-09-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravFragSpot expands NWWallFX;

simulated function InitPlayFX()
{
local GravWFrag wf;

	if (WallTex != None)
	{
		wf = Spawn(Class'GravWFrag', Owner,,, rotator(-vector(Rotation)));		
		if (wf != None)
			wf.MultiSkins[1] = WallTex;
	}
	
	Destroy();
}

defaultproperties
{
}
