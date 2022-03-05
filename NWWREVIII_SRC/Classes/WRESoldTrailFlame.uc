//////////////////////////////////////////////////////////////
//				Feralidragon (07-08-2013)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WRESoldTrailFlame expands NaliWEffects;

var() texture RndFlames[16];
var() float OutputVel;

simulated function PostBeginPlay()
{
	Texture = RndFlames[Rand(ArrayCount(RndFlames))];
	Velocity = (OutputVel * FRand() + OutputVel) * vector(Rotation);
	DrawScale = (DrawScale + DrawScale * FRand()) * 2;
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
}

defaultproperties
{
	DrawType=DT_Sprite
	Texture=WREIonFireB01
	Style=STY_Translucent
	bUnlit=True
	DrawScale=1.000000
	LifeSpan=0.350000
	ScaleGlow=1.000000
	bNetTemporary=True
	SpriteProjForward=0.000000
	Physics=PHYS_Projectile

	OutputVel=100.000000
	
	RndFlames(0)=WREIonFireB01
	RndFlames(1)=WREIonFireB02
	RndFlames(2)=WREIonFireB03
	RndFlames(3)=WREIonFireB04
	RndFlames(4)=WREIonFireB05
	RndFlames(5)=WREIonFireB06
	RndFlames(6)=WREIonFireB07
	RndFlames(7)=WREIonFireB08
	RndFlames(8)=WREIonFireB09
	RndFlames(9)=WREIonFireB10
	RndFlames(10)=WREIonFireB11
	RndFlames(11)=WREIonFireB12
	RndFlames(12)=WREIonFireB13
	RndFlames(13)=WREIonFireB14
	RndFlames(14)=WREIonFireB15
	RndFlames(15)=WREIonFireB16
}
