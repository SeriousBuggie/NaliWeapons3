//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2013)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SEMPSphereExpl expands NaliWEffects;

#exec AUDIO IMPORT NAME="SEMPExpl" FILE=SOUNDS\SEMPExpl.wav GROUP="Expl"

var() float MaxDrawScale;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * (MaxDrawScale - Default.DrawScale) / Default.LifeSpan + Default.DrawScale;
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=SEMPSphere
	
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	RotationRate=(Pitch=500000,Yaw=500000)
	
	bUnlit=True
	DrawScale=0.250000
	ScaleGlow=0.400000
	Style=STY_Translucent
	
	LifeSpan=0.350000
	MaxDrawScale=1.350000
	
	LightType=LT_Steady
    LightEffect=LE_NonIncidence
    LightBrightness=100
    LightHue=0
    LightSaturation=72
    LightRadius=20
	
	EffectSound1=SEMPExpl
}
