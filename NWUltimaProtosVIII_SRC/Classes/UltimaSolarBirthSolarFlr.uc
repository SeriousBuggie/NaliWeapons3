//////////////////////////////////////////////////////////////
//				Feralidragon (12-01-2014)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarBirthSolarFlr expands NaliWEffects;

#exec TEXTURE IMPORT NAME=BirthSolarFlr01 FILE=SolarEffects\BirthSolarFlr01.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr02 FILE=SolarEffects\BirthSolarFlr02.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr03 FILE=SolarEffects\BirthSolarFlr03.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr04 FILE=SolarEffects\BirthSolarFlr04.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr05 FILE=SolarEffects\BirthSolarFlr05.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr06 FILE=SolarEffects\BirthSolarFlr06.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr07 FILE=SolarEffects\BirthSolarFlr07.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr08 FILE=SolarEffects\BirthSolarFlr08.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr09 FILE=SolarEffects\BirthSolarFlr09.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr10 FILE=SolarEffects\BirthSolarFlr10.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr11 FILE=SolarEffects\BirthSolarFlr11.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr12 FILE=SolarEffects\BirthSolarFlr12.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr13 FILE=SolarEffects\BirthSolarFlr13.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr14 FILE=SolarEffects\BirthSolarFlr14.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr15 FILE=SolarEffects\BirthSolarFlr15.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr16 FILE=SolarEffects\BirthSolarFlr16.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr17 FILE=SolarEffects\BirthSolarFlr17.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr18 FILE=SolarEffects\BirthSolarFlr18.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr19 FILE=SolarEffects\BirthSolarFlr19.bmp GROUP=SolarEffects FLAGS=2
#exec TEXTURE IMPORT NAME=BirthSolarFlr20 FILE=SolarEffects\BirthSolarFlr20.bmp GROUP=SolarEffects FLAGS=2


var() texture FlaresTex[20];
var() float fadeInTime;
var float MaxLTime, StartScale, EndScale, BaseGlow;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		Texture = FlaresTex[Rand(ArrayCount(FlaresTex))];
		MaxLTime = LifeSpan;
		StartScale = DrawScale;
		EndScale = DrawScale;
		BaseGlow = ScaleGlow;
		ScaleGlow = 0.0;
	}
}

simulated function HitWall(vector HitNormal, actor Wall)
{
	Destroy();
}

simulated function initFlare(float LTime, vector FlSpeed, float StartDScale, float EndDScale, float BGlow)
{
	LifeSpan = LTime;
	MaxLTime = LifeSpan;
	Velocity = FlSpeed;
	StartScale = StartDScale;
	EndScale = EndDScale;
	BaseGlow = BGlow;
}

simulated function Tick(float Delta)
{
local float f;

	if (Level.NetMode != NM_DedicatedServer)
	{
		f = (MaxLTime - LifeSpan);
		ScaleGlow = BaseGlow;
		DrawScale = (f/MaxLTime)*(EndScale - StartScale) + StartScale;
		if (f < FadeInTime)
			ScaleGlow *= (f/FadeInTime);
		else
			ScaleGlow *= (LifeSpan/(MaxLTime-FadeInTime));
	}
}

defaultproperties
{
	DrawType=DT_Sprite
	Texture=BirthSolarFlr01
	DrawScale=1.000000
	ScaleGlow=1.000000
	Physics=PHYS_Projectile
	LifeSpan=1.000000
	bUnlit=True
	Style=STY_Translucent
	
	fadeInTime=0.200000
	
	FlaresTex(0)=BirthSolarFlr01
	FlaresTex(1)=BirthSolarFlr02
	FlaresTex(2)=BirthSolarFlr03
	FlaresTex(3)=BirthSolarFlr04
	FlaresTex(4)=BirthSolarFlr05
	FlaresTex(5)=BirthSolarFlr06
	FlaresTex(6)=BirthSolarFlr07
	FlaresTex(7)=BirthSolarFlr08
	FlaresTex(8)=BirthSolarFlr09
	FlaresTex(9)=BirthSolarFlr10
	FlaresTex(10)=BirthSolarFlr11
	FlaresTex(11)=BirthSolarFlr12
	FlaresTex(12)=BirthSolarFlr13
	FlaresTex(13)=BirthSolarFlr14
	FlaresTex(14)=BirthSolarFlr15
	FlaresTex(15)=BirthSolarFlr16
	FlaresTex(16)=BirthSolarFlr17
	FlaresTex(17)=BirthSolarFlr18
	FlaresTex(18)=BirthSolarFlr19
	FlaresTex(19)=BirthSolarFlr20
}
