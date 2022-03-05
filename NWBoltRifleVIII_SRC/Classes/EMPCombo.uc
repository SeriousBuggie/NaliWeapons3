//////////////////////////////////////////////////////////////
//				Feralidragon (26-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class EMPCombo expands EMPSphereExpl;

#exec AUDIO IMPORT NAME="BoltCombo" FILE=SOUNDS\BoltCombo.wav GROUP="Expl"
#exec TEXTURE IMPORT NAME=ComboCover FILE=Effects\ComboCover.bmp GROUP=Effects FLAGS=2

simulated function PostBeginPlay()
{
	Spawn(class'EMPComboDecal',,,,rot(16384,0,0));
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * Default.DrawScale / Default.LifeSpan;
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
	}
}

defaultproperties
{
	LifeSpan=0.750000
	DrawScale=3.000000
	ScaleGlow=3.000000
	
	LightType=LT_None
	EffectSound1=None
	MultiSkins(1)=ComboCover
	
	LightType=LT_Steady
    LightEffect=LE_NonIncidence
    LightBrightness=100
    LightHue=165
    LightSaturation=72
    LightRadius=24
	
	bFixedRotationDir=False
	Physics=PHYS_None
}
