//////////////////////////////////////////////////////////////
//				Feralidragon (15-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaDebrisFloorParts expands NWWallFX;

simulated function InitPlayFX()
{
local UltimaProjectFloorDebris wf;
	
	if (WallTex != None)
	{
		wf = Spawn(Class'UltimaProjectFloorDebris');
		if (wf != None)
			wf.MultiSkins[1] = WallTex;
	}
}

defaultproperties
{
}
