//////////////////////////////////////////////////////////////
//				Feralidragon (29-01-2012)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecSpark expands NaliWEffects;

simulated function PostBeginPlay()
{
local vector RndVect;

	RndVect.Y = (2*FRand() - 1);
	RndVect.Z = (2*FRand() - 1);
	RndVect.X = FRand();
	
    Velocity = (RndVect >> Rotation) * (50 * FRand() + 25);
	DrawScale = FRand() * 0.05 + 0.025;
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
	DrawScale=0.050000
	bUnlit=True
	bCollideWorld=True
	bBounce=True
}
