//////////////////////////////////////////////////////////////
//				Feralidragon (29-12-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerDebrisExpl expands NaliWEffects;

#exec OBJ LOAD FILE=Textures\IonizerExpls.utx PACKAGE=NWIonizerVIII_SRC.Expls

var() texture RndExplTex[4];

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	Texture = RndExplTex[Rand(ArrayCount(RndExplTex))];
}

simulated function SetDrawscale(float DScale)
{
	DrawScale = DScale * Default.DrawScale;
}

defaultproperties
{
	LifeSpan=0.700000
	DrawType=DT_SpriteAnimOnce
	Style=STY_Translucent
	Texture=IonizerExplA01
	bUnlit=True
	
	DrawScale=1.500000
	ScaleGlow=1.500000
	
	RndExplTex(0)=IonizerExplA01
	RndExplTex(1)=IonizerExplB01
	RndExplTex(2)=IonizerExplC01
	RndExplTex(2)=IonizerExplD01
}