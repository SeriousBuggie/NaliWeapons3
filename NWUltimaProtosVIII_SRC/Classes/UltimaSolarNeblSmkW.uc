//////////////////////////////////////////////////////////////
//				Feralidragon (26-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarNeblSmkW expands NWBaseCloud;

var vector LocAssim;
var float LocAssimMaxRadius, RealLSpan, stRadius;
var rotator rotRate;
var float rotYaw, rotPitch;


simulated function setLocAssimilation(vector loc, float mRadius, rotator assimRotRate)
{
local rotator R;

	LocAssim = loc;
	LocAssimMaxRadius = mRadius;
	stRadius = VSize(LocAssim - Location);
	
	R = rotator(Location - LocAssim);
	rotYaw = R.Yaw;
	rotPitch = R.Pitch;
	rotRate = assimRotRate;
}

simulated function setLifeVariance(float lSpanVar, float fadeInVar, float fadeOutVar)
{
	RealLSpan = default.LifeSpan * lSpanVar;
	LifeSpan = RealLSpan;
	FadeInTime = default.FadeInTime * fadeInVar;
	FadeOutTime = default.FadeOutTime * fadeOutVar;
	rotRate *= (default.LifeSpan/RealLSpan);
}

simulated function Tick(float Delta)
{
local float curRadius;
local rotator R;

	if (Level.NetMode != NM_DedicatedServer)
	{
		rotYaw += (rotRate.Yaw * Delta);
		while (rotYaw > 65536.f)
			rotYaw -= 65536.f;
		rotPitch += (rotRate.Pitch * Delta);
		while (rotPitch > 65536.f)
			rotPitch -= 65536.f;
		
		R.Yaw = int(rotYaw);
		R.Pitch = int(rotPitch);
		curRadius = (LifeSpan/RealLSpan) * stRadius;
		SetLocation(LocAssim + vector(R)*curRadius);
		
		DrawScale = (VSize(LocAssim - Location)/LocAssimMaxRadius)*(Default.DrawScale - MinDrawScale) + MinDrawScale;
		if (bWhiteSmoke)
		{
			if ((RealLSpan-LifeSpan) <= FadeInTime && FadeInTime > 0)
				ScaleGlow = (RealLSpan-LifeSpan) * Default.ScaleGlow / FadeInTime;
			else if (LifeSpan <= FadeOutTime && FadeOutTime > 0)
				ScaleGlow = LifeSpan * Default.ScaleGlow / FadeOutTime;
		}
		else
		{
			if ((RealLSpan-LifeSpan) <= FadeInTime && FadeInTime > 0)
				ChangeBlackSmoke(Byte((RealLSpan-LifeSpan) * 8.0 / FadeInTime));
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
	Physics=PHYS_None
	Mass=10.000000
	
	MinDrawScale=1.000000
	DrawScale=65.000000
	ScaleGlow=0.100000
	bWhiteSmoke=True
	LifeSpan=3.500000
	FadeInTime=2.500000
	FadeOutTime=0.500000
}
