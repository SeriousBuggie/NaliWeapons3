//////////////////////////////////////////////////////////////
//				Feralidragon (25-08-2013)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravVtxSpiralTraceFX expands GravHitSpiralTraceFX;

var() float MaxDScaleInitCoef, MinDScaleInitCoef;
var() float MaxDrawScale, MinDrawScale;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	MaxDrawScale *= RandRange(MinDScaleInitCoef, MaxDScaleInitCoef);
	MinDrawScale *= RandRange(MinDScaleInitCoef, MaxDScaleInitCoef);
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		DrawScale = LifeSpan * (MaxDrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
	Super.Tick(Delta);
}

defaultproperties
{
	DrawScale=35.000000
	MaxDrawScale=35.000000
	MinDrawScale=4.000000
	ScaleGlow=0.500000
	LifeSpan=5.000000
	
	MaxDScaleInitCoef=1.350000
	MinDScaleInitCoef=0.500000
	
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	RotationRate=(Roll=-9000)
}
