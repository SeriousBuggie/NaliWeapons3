//////////////////////////////////////////////////////////////
//				Feralidragon (14-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltStormTracedImpl expands BoltTracedExpl;

#exec TEXTURE IMPORT NAME=BlueTraceRev FILE=Effects\BlueTraceRev.bmp GROUP=Effects FLAGS=2

simulated function SetLifeSpan(float t)
{
	LifeSpan = t;
	LSpan = LifeSpan;
	FXRateMax = 1/LifeSpan;
	FXRateMin = FXRateMax;
	PlayAnim(FXName, FXRateMax, 0.0);
}

defaultproperties
{
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=1.000000
	DrawScale=3.000000
	LifeSpan=0.500000
	MultiSkins(1)=BlueTraceRev
	
	HeadParticlesClass=None
	FXRateMax=2.000000
	FXRateMin=2.000000
	FXName=Compress
	bFadeOut=False
}
