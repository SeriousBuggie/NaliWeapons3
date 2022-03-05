//////////////////////////////////////////////////////////////
//				Feralidragon (18-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTCorpseFlames expands NaliWEffects;

var() texture RndFlamesTCorpse[16];

simulated function PostBeginPlay()
{
	MultiSkins[Rand(8)] = RndFlamesTCorpse[Rand(ArrayCount(RndFlamesTCorpse))];
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (LifeSpan >= (4*Default.LifeSpan/5))
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / (Default.LifeSpan/5);
		else
			ScaleGlow = LifeSpan * Default.ScaleGlow / (4*Default.LifeSpan/5);
	}
}

defaultproperties
{
    DrawType=DT_Mesh
	Mesh=LodMesh'UnrealShare.BarrelM'
	
	Style=STY_Translucent
	ScaleGlow=1.250000
	bUnlit=True
	DrawScale=1.000000
	LifeSpan=0.500000
	bNetTemporary=True
	
	bParticles=True
	bRandomFrame=True
	Texture=FireB01
	bAnimByOwner=True
	
	Physics=PHYS_Projectile
	RndFlamesTCorpse(0)=FireB01
	RndFlamesTCorpse(1)=FireB02
	RndFlamesTCorpse(2)=FireB03
	RndFlamesTCorpse(3)=FireB04
	RndFlamesTCorpse(4)=FireB05
	RndFlamesTCorpse(5)=FireB06
	RndFlamesTCorpse(6)=FireB07
	RndFlamesTCorpse(7)=FireB08
	RndFlamesTCorpse(8)=FireB09
	RndFlamesTCorpse(9)=FireB10
	RndFlamesTCorpse(10)=FireB11
	RndFlamesTCorpse(11)=FireB12
	RndFlamesTCorpse(12)=FireB13
	RndFlamesTCorpse(13)=FireB14
	RndFlamesTCorpse(14)=FireB15
	RndFlamesTCorpse(15)=FireB16
}
