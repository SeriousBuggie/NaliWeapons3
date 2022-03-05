//////////////////////////////////////////////////////////////
//				Feralidragon (14-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerIceCrystalSmk expands NaliWEffects;

var() texture SmkTex[16];
var() float RisingSpeed;
var() float FadeInTime, FadeOutTime;

simulated function PostBeginPlay()
{
	Texture = SmkTex[Rand(ArrayCount(SmkTex))];
	Velocity = RisingSpeed * vect(0,0,1);
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (LifeSpan <= FadeOutTime)
			ScaleGlow = (LifeSpan/FadeOutTime) * default.ScaleGlow;
		else if ((default.LifeSpan - LifeSpan) <= FadeInTime)
			ScaleGlow = ((default.LifeSpan - LifeSpan)/FadeInTime) * default.ScaleGlow;
		else
			ScaleGlow = default.ScaleGlow;
	}
}

defaultproperties
{
	DrawType=DT_Sprite	
	Style=STY_Translucent
	bUnlit=True
	bNetTemporary=True
	SpriteProjForward=32.000000
	Physics=PHYS_Projectile
	
	DrawScale=6.500000
	LifeSpan=2.000000
	ScaleGlow=0.400000
	RisingSpeed=-128.000000
	
	FadeInTime=0.30000
	FadeOutTime=1.000000
	
	Texture=NukeWSmk01
	SmkTex(0)=NukeWSmk01
	SmkTex(1)=NukeWSmk02
	SmkTex(2)=NukeWSmk03
	SmkTex(3)=NukeWSmk04
	SmkTex(4)=NukeWSmk05
	SmkTex(5)=NukeWSmk06
	SmkTex(6)=NukeWSmk07
	SmkTex(7)=NukeWSmk08
	SmkTex(8)=NukeWSmk09
	SmkTex(9)=NukeWSmk10
	SmkTex(10)=NukeWSmk11
	SmkTex(11)=NukeWSmk12
	SmkTex(12)=NukeWSmk13
	SmkTex(13)=NukeWSmk14
	SmkTex(14)=NukeWSmk15
	SmkTex(15)=NukeWSmk16
}
