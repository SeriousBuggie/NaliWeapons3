//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2013)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SEMPCombo expands SEMPSphereExpl;

#exec AUDIO IMPORT NAME="SBoltCombo" FILE=SOUNDS\SBoltCombo.wav GROUP="Expl"
#exec TEXTURE IMPORT NAME=SComboCover FILE=Effects\SComboCover.bmp GROUP=Effects FLAGS=2

simulated function PostBeginPlay()
{
	Spawn(class'SEMPComboDecal',,,,rot(16384,0,0));
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
	MultiSkins(1)=SComboCover
	
	LightType=LT_Steady
    LightEffect=LE_NonIncidence
    LightBrightness=100
    LightHue=0
    LightSaturation=72
    LightRadius=24
	
	bFixedRotationDir=False
	Physics=PHYS_None
}
