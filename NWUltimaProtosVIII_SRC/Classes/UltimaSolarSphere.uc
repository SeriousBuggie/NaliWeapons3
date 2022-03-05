//////////////////////////////////////////////////////////////
//				Feralidragon (27-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarSphere expands NaliWEffects;

var() float SphereBaseRadius;

var float FullLSpan;
var float startDrawScale, endDrawScale;
var float maxGlow, glowFlicker;
var float fadeInTime, fadeOutTime;

var float tComprCount, deltaMult;


simulated function PostBeginPlay()
{
	FullLSpan = default.LifeSpan;
	maxGlow = default.ScaleGlow;
	startDrawScale = default.DrawScale;
	endDrawScale = startDrawScale;
	DrawScale = startDrawScale;
	glowFlicker = 0.0;
}

simulated function initSolarSphere(float LSpan, float cGlow, float flickCoef, float startDScale, float endDScale, 
optional float FadeInT, optional float FadeOutT, optional texture SphSkin, optional ERenderStyle rStyle)
{
	FullLSpan = LSpan;
	LifeSpan = FullLSpan;
	maxGlow = cGlow;
	ScaleGlow = maxGlow;
	startDrawScale = startDScale;
	endDrawScale = endDScale;
	DrawScale = startDrawScale;
	fadeInTime = FadeInT;
	fadeOutTime = FadeOutT;
	glowFlicker = flickCoef;
	if (SphSkin != None)
		MultiSkins[1] = SphSkin;
	if (rStyle > STY_None)
		Style = rStyle;
}

simulated function setRotatingYawSpeed(float rSpeed)
{
	SetPhysics(PHYS_Rotating);
	bFixedRotationDir = True;
	RotationRate.Yaw = int(rSpeed);
}

simulated function setTimeSkip(float baseT, float compT)
{
	tComprCount = compT;
	deltaMult = baseT/compT;
}

simulated function vector getRandomSurfaceLoc(optional float radDepth)
{
local float f;

	f = DrawScale * SphereBaseRadius;
	f -= (f * radDepth);
	return (f * VRand());
}

simulated function vector getSurfaceLocFromDir(vector dir, optional float radDepth)
{
local float f;

	f = DrawScale * SphereBaseRadius;
	f -= (f * radDepth);
	return (f * Normal(dir));
}

simulated function Tick(float Delta)
{
local float fTime1, fTime2, oDlt;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (tComprCount > 0.0)
		{
			tComprCount -= Delta;
			oDlt = Delta;
			Delta = (oDlt * deltaMult);
			LifeSpan -= (Delta - oDlt);
		}
		
		fTime1 = LifeSpan;
		fTime2 = (FullLSpan - LifeSpan);
		if (fTime2 <= fadeInTime)
			ScaleGlow = (fTime2/fadeInTime) * maxGlow;
		else if (fTime1 <= fadeOutTime)
			ScaleGlow = (fTime1/fadeOutTime) * maxGlow;
		else
			ScaleGlow = maxGlow;
		ScaleGlow += (ScaleGlow * glowFlicker * (FRand()*2-1));
		
		DrawScale = (fTime2/FullLSpan)*(endDrawScale - startDrawScale) + startDrawScale;
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=NuclearNucleusSphereLevel05
	MultiSkins(1)=BirthBlueHeatFX
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=True
	bUnlit=True
	
	LifeSpan=10.000000
	DrawScale=1.000000
	ScaleGlow=1.500000
	Style=STY_Translucent
	SphereBaseRadius=160.000000
}
