//////////////////////////////////////////////////////////////
//				Feralidragon (22-08-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravBeamEnFX expands NaliWEffects;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	RemoteRole = ROLE_None;
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		ScaleGlow = FRand() + 1.0;
		DrawScale = FRand()*0.1 + Default.DrawScale;
	}
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=GravBeamEnFX01
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=0.500000
	LifeSpan=0.000000
	ScaleGlow=1.000000
	bNetTemporary=False
	
	LightBrightness=100
	LightHue=192
	LightSaturation=48
	LightRadius=6
	
	SpriteProjForward=48.000000
}
