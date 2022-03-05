//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanBaseCloud expands NWBaseCloud;

simulated function vector getRandomCloudLoc()
{
local vector V;
local rotator R;

	V.X = DrawScale * RandRange(64, 96);
	R.Yaw = int(FRand()*65536 - 32768);
	V = (V >> R);
	V.Z = DrawScale * RandRange(-96, 96);
	return (Location + (V >> Rotation));
}

defaultproperties
{
	DrawScale=25.000000
	MinDrawScale=1.000000
	
	LifeSpan=6.000000
	bWhiteSmoke=True
	FadeInTime=0.500000
	FadeOutTime=5.750000
	ScaleGlow=0.350000
	CloudDetail=8
}
