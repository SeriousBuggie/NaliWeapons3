//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWFlame expands NaliWEffects;

#exec TEXTURE IMPORT NAME=FireB01 FILE=Flames\FireB01.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB02 FILE=Flames\FireB02.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB03 FILE=Flames\FireB03.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB04 FILE=Flames\FireB04.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB05 FILE=Flames\FireB05.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB06 FILE=Flames\FireB06.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB07 FILE=Flames\FireB07.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB08 FILE=Flames\FireB08.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB09 FILE=Flames\FireB09.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB10 FILE=Flames\FireB10.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB11 FILE=Flames\FireB11.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB12 FILE=Flames\FireB12.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB13 FILE=Flames\FireB13.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB14 FILE=Flames\FireB14.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB15 FILE=Flames\FireB15.bmp GROUP=Flames FLAGS=2
#exec TEXTURE IMPORT NAME=FireB16 FILE=Flames\FireB16.bmp GROUP=Flames FLAGS=2

var() texture RndFlames[16];

simulated function PostBeginPlay()
{
	Texture = RndFlames[Rand(ArrayCount(RndFlames))];
	Velocity = (75 * FRand() + 75) * vect(0,0,1);
	DrawScale = (DrawScale + DrawScale * FRand()) * 2;
}

simulated function Tick( float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=FireB01
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=0.250000
	LifeSpan=0.350000
	ScaleGlow=1.000000
	bNetTemporary=True
	
	SpriteProjForward=0.000000
	
	Physics=PHYS_Projectile
	
	RndFlames(0)=FireB01
	RndFlames(1)=FireB02
	RndFlames(2)=FireB03
	RndFlames(3)=FireB04
	RndFlames(4)=FireB05
	RndFlames(5)=FireB06
	RndFlames(6)=FireB07
	RndFlames(7)=FireB08
	RndFlames(8)=FireB09
	RndFlames(9)=FireB10
	RndFlames(10)=FireB11
	RndFlames(11)=FireB12
	RndFlames(12)=FireB13
	RndFlames(13)=FireB14
	RndFlames(14)=FireB15
	RndFlames(15)=FireB16
}
