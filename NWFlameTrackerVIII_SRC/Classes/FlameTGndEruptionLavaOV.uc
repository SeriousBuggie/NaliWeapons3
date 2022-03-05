//////////////////////////////////////////////////////////////
//				Feralidragon (11-08-2013)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTGndEruptionLavaOV expands FlameTGndEruptionLava;

var float BaseScaleGlow;

simulated function PostBeginPlay()
{
	BaseScaleGlow = default.ScaleGlow;
	Super.PostBeginPlay();
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = BaseScaleGlow * (FRand()*0.4 + 0.6);
	Super.Tick(Delta);
}

defaultproperties
{
	Style=STY_Translucent
	MultiSkins(1)=Texture'FColdLava'
	ScaleGlow=2.000000
}
