//////////////////////////////////////////////////////////////
//				Feralidragon (26-05-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class OverProjTFX expands NaliWEffects;

#exec MESH IMPORT MESH=OverProjTFX ANIVFILE=MODELS\OverProjTFX_a.3d DATAFILE=MODELS\OverProjTFX_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=OverProjTFX STRENGTH=0.25
#exec MESH ORIGIN MESH=OverProjTFX X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=OverProjTFX SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=OverProjTFX SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=OverProjTFX MESH=OverProjTFX
#exec MESHMAP SCALE MESHMAP=OverProjTFX X=0.1 Y=0.25 Z=0.5

#exec TEXTURE IMPORT NAME=OverProjTFX_White FILE=Effects\OverProjTFX_White.bmp GROUP=Effects FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=OverProjTFX NUM=1 TEXTURE=OverProjTFX_White

#exec TEXTURE IMPORT NAME=OverProjTFX_Blue FILE=Effects\OverProjTFX_Blue.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=OverProjTFX_BoltBlue FILE=Effects\OverProjTFX_BoltBlue.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=OverProjTFX_Cyan FILE=Effects\OverProjTFX_Cyan.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=OverProjTFX_DarkPink FILE=Effects\OverProjTFX_DarkPink.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=OverProjTFX_Green FILE=Effects\OverProjTFX_Green.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=OverProjTFX_LightBlue FILE=Effects\OverProjTFX_LightBlue.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=OverProjTFX_OliveGreen FILE=Effects\OverProjTFX_OliveGreen.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=OverProjTFX_Orange FILE=Effects\OverProjTFX_Orange.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=OverProjTFX_Pink FILE=Effects\OverProjTFX_Pink.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=OverProjTFX_Purple FILE=Effects\OverProjTFX_Purple.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=OverProjTFX_Red FILE=Effects\OverProjTFX_Red.bmp GROUP=Effects FLAGS=2
#exec TEXTURE IMPORT NAME=OverProjTFX_Yellow FILE=Effects\OverProjTFX_Yellow.bmp GROUP=Effects FLAGS=2


var() texture FXTex[13];
var() float LifeSpanRandomizer, FadeInTime;
var float DefDScaleStart, DefDScaleEnd, DefSGlow, DefLifespan;

simulated function PostBeginPlay()
{
	LifeSpan += ((2*FRand()*LifeSpanRandomizer - LifeSpanRandomizer));
	DefLifespan = LifeSpan;
	DefDScaleStart = DrawScale;
	DefDScaleEnd = DrawScale;
	DefSGlow = ScaleGlow;
	
	Super.PostBeginPlay();
}

simulated function InitTFX(byte cTex, float cScaleStart, float cScaleEnd, float cGlow)
{
	if (cTex < ArrayCount(FXTex))
		MultiSkins[1] = FXTex[cTex];
	DefDScaleStart = cScaleStart;
	DefDScaleEnd = cScaleEnd;
	DefSGlow = cGlow;
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if ((DefLifespan - LifeSpan) <= FadeInTime)
			ScaleGlow = (DefLifespan - LifeSpan) * DefSGlow / FadeInTime;
		else
			ScaleGlow = LifeSpan * DefSGlow / (DefLifespan - FadeInTime);
			
		DrawScale = (LifeSpan/DefLifespan) * (DefDScaleEnd - DefDScaleStart) + DefDScaleStart;
		RotationRate = (LifeSpan/DefLifespan) * default.RotationRate;
	}
	Super.Tick(Delta);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=OverProjTFX
	Style=STY_Translucent
	bUnlit=True
	
	ScaleGlow=1.000000
	DrawScale=1.000000
	LifeSpan=2.000000
	
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	RotationRate=(Roll=60000)
	
	LifeSpanRandomizer=1.000000
	FadeInTime=0.100000
	
	FXTex(0)=OverProjTFX_Red
	FXTex(1)=OverProjTFX_Orange
	FXTex(2)=OverProjTFX_Yellow
	FXTex(3)=OverProjTFX_OliveGreen
	FXTex(4)=OverProjTFX_Green
	FXTex(5)=OverProjTFX_BoltBlue
	FXTex(6)=OverProjTFX_Blue
	FXTex(7)=OverProjTFX_Cyan
	FXTex(8)=OverProjTFX_LightBlue
	FXTex(9)=OverProjTFX_Purple
	FXTex(10)=OverProjTFX_Pink
	FXTex(11)=OverProjTFX_DarkPink
	FXTex(12)=OverProjTFX_White
}
