//////////////////////////////////////////////////////////////
//				Feralidragon (15-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaCalc expands NaliWEffects;

#exec MESH IMPORT MESH=UltimaCalc ANIVFILE=MODELS\UltimaCalc_a.3d DATAFILE=MODELS\UltimaCalc_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=UltimaCalc X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UltimaCalc SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaCalc SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=UltimaCalc MESH=UltimaCalc
#exec MESHMAP SCALE MESHMAP=UltimaCalc X=1.0 Y=1.0 Z=2.0

#exec TEXTURE IMPORT NAME=UltimaShockCalc1 FILE=CORONAS\UltimaShockCalc1.bmp GROUP=Render LODSET=0
#exec MESHMAP SETTEXTURE MESHMAP=UltimaCalc NUM=1 TEXTURE=UltimaShockCalc1

//const BaseRadius = 280.000000;

var() bool bDynamic;
var() float FadeInTime, FadeOutTime, ScaleStart, ScaleEnd, Duration;
var() float StartingTime, EndingTime, ZDrawOffset;
var float LifeLeft, lastScale;
var float startingC, endingC;

simulated function PostBeginPlay()
{
	LifeLeft = Duration;
}

simulated function ChangeNotify(bool bStart)
{
	if (bStart)
	{
		startingC = StartingTime;
		if (bDynamic)
			lastScale = ScaleStart;
		else
			lastScale = default.DrawScale;
		DrawScale = 0.0;
	}
	else
	{
		lastScale = DrawScale;
		endingC = EndingTime;
	}
}

simulated function Tick(float Delta)
{
local float L;
	
	if (bDynamic && startingC<=0 && endingC<=0)
	{
		LifeLeft -= Delta;
		if (LifeLeft <= 0)
			LifeLeft = Duration;
		
		if (Level.NetMode != NM_DedicatedServer)
		{
			L = Duration - LifeLeft;
			if (L <= FadeInTime)
				ScaleGlow = L * Default.ScaleGlow / FadeInTime;
			else if (LifeLeft <= FadeOutTime)
				ScaleGlow = LifeLeft * Default.ScaleGlow / FadeOutTime;
				
			if (ScaleStart < ScaleEnd)
				DrawScale = L*(ScaleEnd - ScaleStart)/Duration + ScaleStart;
			else if (ScaleStart > ScaleEnd)
				DrawScale = LifeLeft*(ScaleStart - ScaleEnd)/Duration + ScaleEnd;
		}
	}
	else if (startingC > 0) 
	{
		startingC -= Delta;
		if (startingC <= 0)
			startingC = 0;
		if (Level.NetMode != NM_DedicatedServer)
			DrawScale = (StartingTime-startingC) * lastScale / StartingTime;
	}
	else if (endingC > 0)
	{
		endingC -= Delta;
		if (endingC <= 0)
		{
			Destroy();
			return;
		}
		
		if (Level.NetMode != NM_DedicatedServer)
			DrawScale = endingC * lastScale / EndingTime;
	}
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=UltimaCalc
	bHidden=True
	LifeSpan=0.000000
	bUnlit=True
	Style=STY_Translucent
	
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	RotationRate=(Roll=16384)
	StartingTime=1.000000
	EndingTime=0.500000
	ZDrawOffset=8.000000
	
	ScaleGlow=2.000000
	DrawScale=14.000000
	bDynamic=False
	Duration=0.000000
	FadeInTime=0.000000
	FadeOutTime=0.000000
	ScaleStart=0.000000
	ScaleEnd=0.000000
}
