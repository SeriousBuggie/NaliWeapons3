//////////////////////////////////////////////////////////////
//				Feralidragon (24-08-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravVortexCloudMaster expands NWBaseCloudMaster;

simulated function PostBeginPlay()
{
	PlayAnim('CollapseH02', 1/default.LifeSpan, 0.0);
}

defaultproperties
{
	LifeSpan=5.000000
	Mesh=GravVortexCloud
}
