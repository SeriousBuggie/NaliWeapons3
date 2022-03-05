//////////////////////////////////////////////////////////////
//				Feralidragon (26-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarAftermathSmkW expands NWBaseCloud;

var float RealLSpan, MaxDrawScale, BaseGlow;

simulated function PostBeginPlay()
{
	MaxDrawScale = DrawScale;
	BaseGlow = ScaleGlow;
	Super.PostBeginPlay();
}

simulated function initAftermathSmk(float lSpanVar, vector vel, float minScl, float maxScl, float glow)
{
	RealLSpan = default.LifeSpan * lSpanVar;
	LifeSpan = RealLSpan;
	FadeOutTime = default.FadeOutTime * lSpanVar;
	Velocity = vel;
	MinDrawScale = minScl;
	MaxDrawScale = maxScl;
	BaseGlow = glow;
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan-LifeSpan) * (MaxDrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
		if (bWhiteSmoke)
		{
			if ((Default.LifeSpan-LifeSpan) <= FadeInTime && FadeInTime > 0)
				ScaleGlow = (Default.LifeSpan-LifeSpan) * BaseGlow / FadeInTime;
			else if (LifeSpan <= FadeOutTime && FadeOutTime > 0)
				ScaleGlow = LifeSpan * BaseGlow / FadeOutTime;
		}
		else
		{
			if ((Default.LifeSpan-LifeSpan) <= FadeInTime && FadeInTime > 0)
				ChangeBlackSmoke(Byte((Default.LifeSpan-LifeSpan) * 8.0 / FadeInTime));
			else if (LifeSpan <= FadeOutTime && FadeOutTime > 0)
				ChangeBlackSmoke(Byte(LifeSpan * 8.0 / FadeOutTime));
		}
	}
}

defaultproperties
{
    DrawType=DT_Sprite
	Mesh=None
	Texture=NukeWSmk01
	Style=STY_Translucent
	bUnlit=True
	bParticles=False
	bRandomFrame=False
	bAnimByOwner=False
	bNetTemporary=True
	Physics=PHYS_Projectile
	Mass=10.000000
	
	MinDrawScale=55.000000
	DrawScale=65.000000
	ScaleGlow=0.100000
	bWhiteSmoke=True
	LifeSpan=60.000000
	FadeInTime=1.500000
	FadeOutTime=55.000000
}
