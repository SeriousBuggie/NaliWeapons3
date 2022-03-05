//////////////////////////////////////////////////////////////
//				Feralidragon (14-01-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatelliteSpark expands NaliWEffects;

simulated function PostBeginPlay()
{
local vector RndVect;

	RndVect.Y = (2*FRand() - 1);
	RndVect.Z = (2*FRand() - 1);
	RndVect.X = FRand();
	
    Velocity = (RndVect >> Rotation) * (200 * FRand() + 100);
	DrawScale = FRand() * 0.1 + 0.1;
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
}
   
simulated function ZoneChange( ZoneInfo NewZone )
{
	if ( NewZone.bWaterZone )
		Destroy();
}

simulated function Landed( vector HitNormal )
{
	Destroy();
}

simulated function HitWall( vector HitNormal, actor Wall )
{
	Destroy();
}

defaultproperties
{
	Physics=PHYS_Falling
	LifeSpan=2.000000
	ScaleGlow=4.000000
	DrawType=DT_Sprite
	Style=STY_Translucent
	Texture=Texture'Botpack.Effects.Sparky'
	DrawScale=0.100000
	bUnlit=True
	bCollideWorld=True
	bBounce=True
}
