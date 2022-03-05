//////////////////////////////////////////////////////////////
//				Feralidragon (30-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWGoreIntestine expands NWCordNodePiece;

simulated function vector getSpawnDir(vector curDir)
{
	return Normal(Normal(curDir) + VRand()*8.5);
}

simulated function InitNode(int index)
{
	bSticky = (FRand() > 0.9);
	bWaterFX = (FRand() > 0.65);
}

defaultproperties
{
	MinNodes=8
	MaxNodes=15
	MinSegmentLength=8
	MaxSegmentLength=12
	NWCordSegmClass=Class'NWGoreSegmA'
	NWCordSegmStartClass=Class'NWGoreSegmAStart'
	NWCordSegmEndClass=Class'NWGoreSegmAEnd'
	
	bSticky=True
	bStickToFloor=False
	
	SlideRateMin=0.200000
	SlideRateMax=1.000000
	DropRateMin=0.100000
	DropRateMax=1.000000
	DropDownRateMin=0.750000
	DropDownRateMax=1.000000

	SlideOdds=0.900000
	SlideDownOdds=0.900000
	DropOdds=0.900000
	DropDownOdds=0.900000

	SlideDownFrictionMin=0.800000
	SlideDownFrictionMax=0.950000
	WallHitDumping=0.000000
	WallHitSoundOdds=0.000000
	WallHitSounds(0)=None
	WallHitSounds(1)=None
	WallHitSounds(2)=None
	WallHitSounds(3)=None
	
	VelAdd=(Z=500.000000)
}
