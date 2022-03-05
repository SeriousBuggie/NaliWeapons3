//////////////////////////////////////////////////////////////
//	Nali Weapons III Bolt spark
//				Feralidragon (23-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltSpark expands NaliZPEffects;

simulated function PostBeginPlay()
{
local vector RndVect;

	Super.PostBeginPlay();

	RndVect.Y = (2*FRand() - 1);
	RndVect.Z = (2*FRand() - 1);
	RndVect.X = FRand();
	
    Velocity = (RndVect >> Rotation) * (200 * FRand() + 100);
	DrawScale = FRand() * 0.1 + 0.1;
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
}
   
simulated function ZoneChange(ZoneInfo NewZone)
{
	if (NewZone.bWaterZone)
		Destroy();
}

simulated function Landed(vector HitNormal)
{
	Destroy();
}

simulated function HitWall(vector HitNormal, actor Wall)
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
