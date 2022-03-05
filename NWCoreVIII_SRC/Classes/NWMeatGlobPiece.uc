//////////////////////////////////////////////////////////////
//				Feralidragon (27-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWMeatGlobPiece expands NWBodyPiece;

var() float MaxDrawScale, MinDrawScale;


simulated function PostBeginPlay()
{
	DrawScale = FRand()*(MaxDrawScale - MinDrawScale) + MinDrawScale;	
	Super.PostBeginPlay();
}

simulated function SetGoreType(class<NWGoreCBoard> newGoreBoardClass)
{
	Super.SetGoreType(newGoreBoardClass);
	if (newGoreBoardClass != None)
		MultiSkins[1] = newGoreBoardClass.static.GetMeatTexture();
}


defaultproperties
{
	Mesh=LodMesh'Botpack.BioGelm'
	MinLifeSpan=5.000000
	MaxLifeSpan=30.000000
	bBloodTrail=True
	BloodTrailTime=5.000000
	bBloodBurst=True

	bSticky=True
	bStickToFloor=True
	bSpawnDecal=True
	bSpawnSlideDecal=True
	SlideDecalSize=4.000000
	DecalScale=1.000000

	FlyingAnim=Flying
	StickAnim=Hit
	SlideAnim=Slide
	DropAnim=Drip
	DropDownAnim=Flying

	FlyingAnimRate=0.400000
	
	SlideRateMin=0.100000
	SlideRateMax=0.400000
	DropRateMin=0.100000
	DropRateMax=0.400000
	DropDownRateMin=0.300000
	DropDownRateMax=0.600000

	SlideOdds=0.700000
	SlideDownOdds=0.600000
	DropOdds=0.650000
	DropDownOdds=0.500000

	SlideDownFrictionMin=0.800000
	SlideDownFrictionMax=0.950000
	WallHitDumping=0.000000
	WallHitSoundOdds=0.000000
	WallHitSounds(0)=None
	WallHitSounds(1)=None
	WallHitSounds(2)=None
	WallHitSounds(3)=None
	bWallSlideRandRotationRoll=False
	WallSlideRotationRoll=32768.000000
	WallSinkInDepth=1.500000
	
	DrawScale=1.000000
	MinDrawScale=0.4500000
	MaxDrawScale=1.1000000
}
