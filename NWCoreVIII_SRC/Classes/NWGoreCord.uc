//////////////////////////////////////////////////////////////
//				Feralidragon (30-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWGoreCord expands NWCordNodePiece;

simulated function vector getSpawnDir(vector curDir)
{
	return Normal(Normal(curDir) + VRand()*2);
}

simulated function InitNode(int index)
{
	bSticky = (FRand() > 0.75);
	bWaterFX = (FRand() > 0.8);
}

defaultproperties
{
	MinNodes=5
	MaxNodes=10
	MinSegmentLength=6
	MaxSegmentLength=8
	NWCordSegmClass=Class'NWGoreSegmB'
	NWCordSegmStartClass=Class'NWGoreSegmBStart'
	NWCordSegmEndClass=Class'NWGoreSegmBEnd'
	
	MinLifeSpan=5.000000
	MaxLifeSpan=20.000000
	
	bSticky=True
	bStickToFloor=False
	
	SlideRateMin=0.200000
	SlideRateMax=1.000000
	DropRateMin=0.100000
	DropRateMax=1.000000
	DropDownRateMin=0.750000
	DropDownRateMax=1.000000

	SlideOdds=0.850000
	SlideDownOdds=0.850000
	DropOdds=0.850000
	DropDownOdds=0.850000

	SlideDownFrictionMin=0.800000
	SlideDownFrictionMax=0.950000
	WallHitDumping=0.000000
	WallHitSoundOdds=0.000000
	WallHitSounds(0)=None
	WallHitSounds(1)=None
	WallHitSounds(2)=None
	WallHitSounds(3)=None
	
	VelAdd=(Z=1000.000000)
}
