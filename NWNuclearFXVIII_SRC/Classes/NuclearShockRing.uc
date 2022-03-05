//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearShockRing expands NaliFullMeshFX;

#exec TEXTURE IMPORT NAME=NuclearShockRing FILE=CORONAS\NuclearShockRing.bmp GROUP=Coronas FLAGS=2

var() float MinDrawScale, FadeInTime, FadeOutTime;
var() float TexUVMultiplier;

simulated function Tick( float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * (Default.DrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
		DrawScale *= TexUVMultiplier;
		if (Default.LifeSpan - LifeSpan <= FadeInTime)
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / FadeInTime;
		else if (FadeOutTime > 0 && LifeSpan <= FadeOutTime)
			ScaleGlow = LifeSpan * Default.ScaleGlow / FadeOutTime;
		else if (FadeOutTime == 0)
			ScaleGlow = LifeSpan * Default.ScaleGlow / (Default.LifeSpan - FadeInTime);
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NuclearMushRingA
	Style=STY_Translucent
	RemoteRole=ROLE_SimulatedProxy
	bUnlit=True
	bAlwaysRelevant=True
	
	MultiSkins(1)=NuclearShockRing
	MinDrawScale=0.250000
	FadeInTime=0.500000
	FadeOutTime=1.500000
	LifeSpan=7.500000
	DrawScale=120.000000
	ScaleGlow=1.000000
	TexUVMultiplier=1.049180
	
	RadiusView=28800.000000
	bAffectByDrawScale=False
}
