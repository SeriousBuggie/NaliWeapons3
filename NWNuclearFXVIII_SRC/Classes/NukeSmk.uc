//////////////////////////////////////////////////////////////
//				Feralidragon (21-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeSmk expands NuclearHitSmokeFX;

var() texture SmkBlackATex[24], SmkBlackBTex[24], SmkBlackCTex[24], SmkBlackDTex[24];
var() texture SmkBlackETex[24], SmkBlackFTex[24], SmkBlackGTex[24], SmkBlackHTex[24];
var byte texN;

simulated function PostBeginPlay()
{
	if (Style == STY_Modulated)
	{
		texN = Rand(ArrayCount(SmkBlackATex));
		Texture = getModulTex(texN, 0.0);
	}
	else
		Super.PostBeginPlay();
}

simulated function Tick( float DeltaTime)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (Style == STY_Modulated)
		{
			DrawScale = (Default.LifeSpan - LifeSpan) * (MaxDrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
			if (Default.LifeSpan - LifeSpan <= FadeInTime)
				Texture = getModulTex(texN, (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / FadeInTime);
			else if (FadeOutTime > 0 && LifeSpan <= FadeOutTime)
				Texture = getModulTex(texN, LifeSpan * Default.ScaleGlow / FadeOutTime);
			else if (FadeOutTime == 0)
				Texture = getModulTex(texN, LifeSpan * Default.ScaleGlow / (Default.LifeSpan - FadeInTime));
		}
		else
			Super.Tick(DeltaTime);
	}
}


simulated function texture getModulTex(byte i, float glow)
{
local byte slot;

	if (i >= ArrayCount(SmkBlackATex))
		return None;

	glow = FClamp(glow, 0.0, 1.0);
	slot = Byte(glow * 8);
	switch (slot)
	{
		case 8:		return SmkBlackATex[i];
		case 7:		return SmkBlackBTex[i];
		case 6:		return SmkBlackCTex[i];
		case 5:		return SmkBlackDTex[i];
		case 4:		return SmkBlackETex[i];
		case 3:		return SmkBlackFTex[i];
		case 2:		return SmkBlackGTex[i];
		case 1:		return SmkBlackHTex[i];
		case 0:		return Texture'ModulInvis';
	}
	
	return None;
}

defaultproperties
{
	MinDrawScale=30.0000000
	MaxDrawScale=40.000000
	FadeInTime=0.100000
	FadeOutTime=1.500000
	LifeSpan=2.500000
	DrawScale=1.000000
	RisingSpeed=75.000000
	ScaleGlow=0.350000
	
	SmkBlackATex(0)=NWBlackASmk01
	SmkBlackATex(1)=NWBlackASmk02
	SmkBlackATex(2)=NWBlackASmk03
	SmkBlackATex(3)=NWBlackASmk04
	SmkBlackATex(4)=NWBlackASmk05
	SmkBlackATex(5)=NWBlackASmk06
	SmkBlackATex(6)=NWBlackASmk07
	SmkBlackATex(7)=NWBlackASmk08
	SmkBlackATex(8)=NWBlackASmk09
	SmkBlackATex(9)=NWBlackASmk10
	SmkBlackATex(10)=NWBlackASmk11
	SmkBlackATex(11)=NWBlackASmk12
	SmkBlackATex(12)=NWBlackASmk13
	SmkBlackATex(13)=NWBlackASmk14
	SmkBlackATex(14)=NWBlackASmk15
	SmkBlackATex(15)=NWBlackASmk16
	SmkBlackATex(16)=NWBlackASmk17
	SmkBlackATex(17)=NWBlackASmk18
	SmkBlackATex(18)=NWBlackASmk19
	SmkBlackATex(19)=NWBlackASmk20
	SmkBlackATex(20)=NWBlackASmk21
	SmkBlackATex(21)=NWBlackASmk22
	SmkBlackATex(22)=NWBlackASmk23
	SmkBlackATex(23)=NWBlackASmk24
	
	SmkBlackBTex(0)=NWBlackBSmk01
	SmkBlackBTex(1)=NWBlackBSmk02
	SmkBlackBTex(2)=NWBlackBSmk03
	SmkBlackBTex(3)=NWBlackBSmk04
	SmkBlackBTex(4)=NWBlackBSmk05
	SmkBlackBTex(5)=NWBlackBSmk06
	SmkBlackBTex(6)=NWBlackBSmk07
	SmkBlackBTex(7)=NWBlackBSmk08
	SmkBlackBTex(8)=NWBlackBSmk09
	SmkBlackBTex(9)=NWBlackBSmk10
	SmkBlackBTex(10)=NWBlackBSmk11
	SmkBlackBTex(11)=NWBlackBSmk12
	SmkBlackBTex(12)=NWBlackBSmk13
	SmkBlackBTex(13)=NWBlackBSmk14
	SmkBlackBTex(14)=NWBlackBSmk15
	SmkBlackBTex(15)=NWBlackBSmk16
	SmkBlackBTex(16)=NWBlackBSmk17
	SmkBlackBTex(17)=NWBlackBSmk18
	SmkBlackBTex(18)=NWBlackBSmk19
	SmkBlackBTex(19)=NWBlackBSmk20
	SmkBlackBTex(20)=NWBlackBSmk21
	SmkBlackBTex(21)=NWBlackBSmk22
	SmkBlackBTex(22)=NWBlackBSmk23
	SmkBlackBTex(23)=NWBlackBSmk24
	
	SmkBlackCTex(0)=NWBlackCSmk01
	SmkBlackCTex(1)=NWBlackCSmk02
	SmkBlackCTex(2)=NWBlackCSmk03
	SmkBlackCTex(3)=NWBlackCSmk04
	SmkBlackCTex(4)=NWBlackCSmk05
	SmkBlackCTex(5)=NWBlackCSmk06
	SmkBlackCTex(6)=NWBlackCSmk07
	SmkBlackCTex(7)=NWBlackCSmk08
	SmkBlackCTex(8)=NWBlackCSmk09
	SmkBlackCTex(9)=NWBlackCSmk10
	SmkBlackCTex(10)=NWBlackCSmk11
	SmkBlackCTex(11)=NWBlackCSmk12
	SmkBlackCTex(12)=NWBlackCSmk13
	SmkBlackCTex(13)=NWBlackCSmk14
	SmkBlackCTex(14)=NWBlackCSmk15
	SmkBlackCTex(15)=NWBlackCSmk16
	SmkBlackCTex(16)=NWBlackCSmk17
	SmkBlackCTex(17)=NWBlackCSmk18
	SmkBlackCTex(18)=NWBlackCSmk19
	SmkBlackCTex(19)=NWBlackCSmk20
	SmkBlackCTex(20)=NWBlackCSmk21
	SmkBlackCTex(21)=NWBlackCSmk22
	SmkBlackCTex(22)=NWBlackCSmk23
	SmkBlackCTex(23)=NWBlackCSmk24
	
	SmkBlackDTex(0)=NWBlackDSmk01
	SmkBlackDTex(1)=NWBlackDSmk02
	SmkBlackDTex(2)=NWBlackDSmk03
	SmkBlackDTex(3)=NWBlackDSmk04
	SmkBlackDTex(4)=NWBlackDSmk05
	SmkBlackDTex(5)=NWBlackDSmk06
	SmkBlackDTex(6)=NWBlackDSmk07
	SmkBlackDTex(7)=NWBlackDSmk08
	SmkBlackDTex(8)=NWBlackDSmk09
	SmkBlackDTex(9)=NWBlackDSmk10
	SmkBlackDTex(10)=NWBlackDSmk11
	SmkBlackDTex(11)=NWBlackDSmk12
	SmkBlackDTex(12)=NWBlackDSmk13
	SmkBlackDTex(13)=NWBlackDSmk14
	SmkBlackDTex(14)=NWBlackDSmk15
	SmkBlackDTex(15)=NWBlackDSmk16
	SmkBlackDTex(16)=NWBlackDSmk17
	SmkBlackDTex(17)=NWBlackDSmk18
	SmkBlackDTex(18)=NWBlackDSmk19
	SmkBlackDTex(19)=NWBlackDSmk20
	SmkBlackDTex(20)=NWBlackDSmk21
	SmkBlackDTex(21)=NWBlackDSmk22
	SmkBlackDTex(22)=NWBlackDSmk23
	SmkBlackDTex(23)=NWBlackDSmk24
	
	SmkBlackETex(0)=NWBlackESmk01
	SmkBlackETex(1)=NWBlackESmk02
	SmkBlackETex(2)=NWBlackESmk03
	SmkBlackETex(3)=NWBlackESmk04
	SmkBlackETex(4)=NWBlackESmk05
	SmkBlackETex(5)=NWBlackESmk06
	SmkBlackETex(6)=NWBlackESmk07
	SmkBlackETex(7)=NWBlackESmk08
	SmkBlackETex(8)=NWBlackESmk09
	SmkBlackETex(9)=NWBlackESmk10
	SmkBlackETex(10)=NWBlackESmk11
	SmkBlackETex(11)=NWBlackESmk12
	SmkBlackETex(12)=NWBlackESmk13
	SmkBlackETex(13)=NWBlackESmk14
	SmkBlackETex(14)=NWBlackESmk15
	SmkBlackETex(15)=NWBlackESmk16
	SmkBlackETex(16)=NWBlackESmk17
	SmkBlackETex(17)=NWBlackESmk18
	SmkBlackETex(18)=NWBlackESmk19
	SmkBlackETex(19)=NWBlackESmk20
	SmkBlackETex(20)=NWBlackESmk21
	SmkBlackETex(21)=NWBlackESmk22
	SmkBlackETex(22)=NWBlackESmk23
	SmkBlackETex(23)=NWBlackESmk24
	
	SmkBlackFTex(0)=NWBlackFSmk01
	SmkBlackFTex(1)=NWBlackFSmk02
	SmkBlackFTex(2)=NWBlackFSmk03
	SmkBlackFTex(3)=NWBlackFSmk04
	SmkBlackFTex(4)=NWBlackFSmk05
	SmkBlackFTex(5)=NWBlackFSmk06
	SmkBlackFTex(6)=NWBlackFSmk07
	SmkBlackFTex(7)=NWBlackFSmk08
	SmkBlackFTex(8)=NWBlackFSmk09
	SmkBlackFTex(9)=NWBlackFSmk10
	SmkBlackFTex(10)=NWBlackFSmk11
	SmkBlackFTex(11)=NWBlackFSmk12
	SmkBlackFTex(12)=NWBlackFSmk13
	SmkBlackFTex(13)=NWBlackFSmk14
	SmkBlackFTex(14)=NWBlackFSmk15
	SmkBlackFTex(15)=NWBlackFSmk16
	SmkBlackFTex(16)=NWBlackFSmk17
	SmkBlackFTex(17)=NWBlackFSmk18
	SmkBlackFTex(18)=NWBlackFSmk19
	SmkBlackFTex(19)=NWBlackFSmk20
	SmkBlackFTex(20)=NWBlackFSmk21
	SmkBlackFTex(21)=NWBlackFSmk22
	SmkBlackFTex(22)=NWBlackFSmk23
	SmkBlackFTex(23)=NWBlackFSmk24
	
	SmkBlackGTex(0)=NWBlackGSmk01
	SmkBlackGTex(1)=NWBlackGSmk02
	SmkBlackGTex(2)=NWBlackGSmk03
	SmkBlackGTex(3)=NWBlackGSmk04
	SmkBlackGTex(4)=NWBlackGSmk05
	SmkBlackGTex(5)=NWBlackGSmk06
	SmkBlackGTex(6)=NWBlackGSmk07
	SmkBlackGTex(7)=NWBlackGSmk08
	SmkBlackGTex(8)=NWBlackGSmk09
	SmkBlackGTex(9)=NWBlackGSmk10
	SmkBlackGTex(10)=NWBlackGSmk11
	SmkBlackGTex(11)=NWBlackGSmk12
	SmkBlackGTex(12)=NWBlackGSmk13
	SmkBlackGTex(13)=NWBlackGSmk14
	SmkBlackGTex(14)=NWBlackGSmk15
	SmkBlackGTex(15)=NWBlackGSmk16
	SmkBlackGTex(16)=NWBlackGSmk17
	SmkBlackGTex(17)=NWBlackGSmk18
	SmkBlackGTex(18)=NWBlackGSmk19
	SmkBlackGTex(19)=NWBlackGSmk20
	SmkBlackGTex(20)=NWBlackGSmk21
	SmkBlackGTex(21)=NWBlackGSmk22
	SmkBlackGTex(22)=NWBlackGSmk23
	SmkBlackGTex(23)=NWBlackGSmk24
	
	SmkBlackHTex(0)=NWBlackHSmk01
	SmkBlackHTex(1)=NWBlackHSmk02
	SmkBlackHTex(2)=NWBlackHSmk03
	SmkBlackHTex(3)=NWBlackHSmk04
	SmkBlackHTex(4)=NWBlackHSmk05
	SmkBlackHTex(5)=NWBlackHSmk06
	SmkBlackHTex(6)=NWBlackHSmk07
	SmkBlackHTex(7)=NWBlackHSmk08
	SmkBlackHTex(8)=NWBlackHSmk09
	SmkBlackHTex(9)=NWBlackHSmk10
	SmkBlackHTex(10)=NWBlackHSmk11
	SmkBlackHTex(11)=NWBlackHSmk12
	SmkBlackHTex(12)=NWBlackHSmk13
	SmkBlackHTex(13)=NWBlackHSmk14
	SmkBlackHTex(14)=NWBlackHSmk15
	SmkBlackHTex(15)=NWBlackHSmk16
	SmkBlackHTex(16)=NWBlackHSmk17
	SmkBlackHTex(17)=NWBlackHSmk18
	SmkBlackHTex(18)=NWBlackHSmk19
	SmkBlackHTex(19)=NWBlackHSmk20
	SmkBlackHTex(20)=NWBlackHSmk21
	SmkBlackHTex(21)=NWBlackHSmk22
	SmkBlackHTex(22)=NWBlackHSmk23
	SmkBlackHTex(23)=NWBlackHSmk24
}
