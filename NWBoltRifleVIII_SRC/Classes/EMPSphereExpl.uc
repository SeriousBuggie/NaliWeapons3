//////////////////////////////////////////////////////////////
//	Nali Weapons III Bolt Rifle EMP
//				Feralidragon (26-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class EMPSphereExpl expands NaliWEffects;

#exec AUDIO IMPORT NAME="EMPExpl" FILE=SOUNDS\EMPExpl.wav GROUP="Expl"

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
    Mesh=EMPSphere
	
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
    LightHue=165
    LightSaturation=72
    LightRadius=20
	
	EffectSound1=EMPExpl
}
