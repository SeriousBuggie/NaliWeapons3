//////////////////////////////////////////////////////////////
//				Feralidragon (29-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class XShockInternalExpl expands NaliWEffects;

var() texture RndExplTex[3];

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	Texture = RndExplTex[Rand(3)];
}

defaultproperties
{
	EffectSound1=None
	LifeSpan=0.800000
	DrawType=DT_SpriteAnimOnce
	Style=STY_Translucent
	Texture=ExplA01
	DrawScale=1.600000
	bUnlit=True
	ScaleGlow=0.700000
	 
	RndExplTex(0)=ExplA01
	RndExplTex(1)=ExplB01
	RndExplTex(2)=ExplC01
}
