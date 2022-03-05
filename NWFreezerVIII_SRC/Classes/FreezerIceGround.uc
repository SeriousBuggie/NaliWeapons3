//////////////////////////////////////////////////////////////
//				Feralidragon (22-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerIceGround expands NaliWEffects;

#exec MESH IMPORT MESH=FreezerIceGround ANIVFILE=MODELS\FreezerIceGround_a.3d DATAFILE=MODELS\FreezerIceGround_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FreezerIceGround STRENGTH=0.25
#exec MESH ORIGIN MESH=FreezerIceGround X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos01 STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos02 STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos03 STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos04 STARTFRAME=3 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos05 STARTFRAME=4 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos06 STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos07 STARTFRAME=6 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos08 STARTFRAME=7 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos09 STARTFRAME=8 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos10 STARTFRAME=9 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos11 STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos12 STARTFRAME=11 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos13 STARTFRAME=12 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos14 STARTFRAME=13 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos15 STARTFRAME=14 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos16 STARTFRAME=15 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos17 STARTFRAME=16 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos18 STARTFRAME=17 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos19 STARTFRAME=18 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceGround SEQ=RndPos20 STARTFRAME=19 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FreezerIceGround MESH=FreezerIceGround
#exec MESHMAP SCALE MESHMAP=FreezerIceGround X=1.0 Y=1.0 Z=2.0


var() float BaseHeight, AnimTimeDivisor;
var() float MinDrawScale, MaxDrawScale;
var() name RndAnim[20];
var() sound FreezingSnd;
var float tTime, tCount, prepCount, tAnimTime;
var byte curAnimIndex;
var bool isRising, isFadingOut, bDestrEnd;


simulated function TweenToNextPos()
{
local byte newIndex;

	if (tAnimTime <= 0.0)
		return;
	do
	{
		newIndex = Rand(ArrayCount(RndAnim));
	}
	until (newIndex != curAnimIndex)
	curAnimIndex = newIndex;
	TweenAnim(RndAnim[curAnimIndex], tAnimTime);
}

simulated function AnimEnd()
{
	if (tCount > 0.0)
		TweenToNextPos();
}

simulated function SetScale(float s)
{
	MinDrawScale = s * default.MinDrawScale;
	MaxDrawScale = s * default.MaxDrawScale;
}

simulated function Rise(float t)
{
	tTime = t;
	tCount = tTime;
	isRising = True;
	tAnimTime = tTime / AnimTimeDivisor;
	TweenToNextPos();
	if (FreezingSnd != None)
		PlaySound(FreezingSnd,, 100,, int(6000 * (MinDrawScale/default.MinDrawScale)));
}

simulated function Sink(float t, optional bool bDestroyOnEnd)
{
	tTime = t;
	tCount = tTime;
	isRising = False;
	tAnimTime = tTime / AnimTimeDivisor;
	TweenToNextPos();
	bDestrEnd = bDestroyOnEnd;
}

simulated function FadeOut(float t, optional bool bDestroyOnEnd)
{
	Style = STY_Translucent;
	tTime = t;
	tCount = tTime;
	isFadingOut = True;
	bDestrEnd = bDestroyOnEnd;
}

simulated function PrepareToFadeOut(float prepT, float fadeT, optional bool bDestroyOnEnd)
{
	prepCount = prepT;
	FadeOut(fadeT, bDestroyOnEnd);
}

simulated function PrepareToSink(float prepT, float sinkT, optional bool bDestroyOnEnd)
{
	prepCount = prepT;
	Sink(sinkT, bDestroyOnEnd);
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (prepCount <= 0.0)
		{
			if (tTime > 0.0 && tCount > 0.0)
			{
				tCount -= Delta;
				if (tCount <= 0.0)
					tCount = 0.0;

				if (isFadingOut)
				{
					ScaleGlow = (tCount/tTime) * default.ScaleGlow;
					if (tCount == 0.0)
					{
						isFadingOut = False;
						if (bDestrEnd)
							Destroy();
					}
				}
				else if (isRising)
				{
					DrawScale = ((tTime - tCount)/tTime) * (MaxDrawScale - MinDrawScale) + MinDrawScale;
					PrePivot = ((tTime - tCount)/tTime) * (-vector(Rotation) * BaseHeight * DrawScale);
					if (tCount == 0.0)
						isRising = False;
				}
				else
				{
					DrawScale = (tCount/tTime) * (MaxDrawScale - MinDrawScale) + MinDrawScale;
					PrePivot = (tCount/tTime) * (-vector(Rotation) * BaseHeight * DrawScale);
					if (bDestrEnd)
						Destroy();
				}
			}
		}
		else
			prepCount -= Delta;
	}
}

defaultproperties
{
	DrawType=DT_Mesh
    Mesh=FreezerIceGround
	Texture=IceFragSk
	bMeshEnviroMap=True
	Style=STY_Normal
	bUnlit=True
	ScaleGlow=1.500000
	DrawScale=1.000000
	bNetTemporary=False
	AnimSequence=RndPos01
	
	AnimTimeDivisor=2.000000
	BaseHeight=8.000000
	MinDrawScale=0.200000
	MaxDrawScale=2.000000
	FreezingSnd=IceFlameBaseSnd
	
	RndAnim(0)=RndPos01
	RndAnim(1)=RndPos02
	RndAnim(2)=RndPos03
	RndAnim(3)=RndPos04
	RndAnim(4)=RndPos05
	RndAnim(5)=RndPos06
	RndAnim(6)=RndPos07
	RndAnim(7)=RndPos08
	RndAnim(8)=RndPos09
	RndAnim(9)=RndPos10
	RndAnim(10)=RndPos11
	RndAnim(11)=RndPos12
	RndAnim(12)=RndPos13
	RndAnim(13)=RndPos14
	RndAnim(14)=RndPos15
	RndAnim(15)=RndPos16
	RndAnim(16)=RndPos17
	RndAnim(17)=RndPos18
	RndAnim(18)=RndPos19
	RndAnim(19)=RndPos20
}
