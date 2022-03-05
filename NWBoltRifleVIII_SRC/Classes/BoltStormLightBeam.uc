//////////////////////////////////////////////////////////////
//				Feralidragon (15-08-2013)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltStormLightBeam expands NaliWEffects;

#exec MESH IMPORT MESH=BoltStormLightBeam ANIVFILE=MODELS\BoltStormLightBeam_a.3d DATAFILE=MODELS\BoltStormLightBeam_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=BoltStormLightBeam X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltStormLightBeam SEQ=All STARTFRAME=0 NUMFRAMES=5
#exec MESH SEQUENCE MESH=BoltStormLightBeam SEQ=Compress STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightBeam SEQ=Decompress STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightBeam SEQ=Shrink STARTFRAME=2 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltStormLightBeam SEQ=Grow STARTFRAME=3 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=BoltStormLightBeam MESH=BoltStormLightBeam
#exec MESHMAP SCALE MESHMAP=BoltStormLightBeam X=32.0 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=BoltStormLightBeamBlue FILE=Effects\BoltStormLightBeamBlue.bmp GROUP=Coronas FLAGS=2 MIPS=OFF
#exec MESHMAP SETTEXTURE MESHMAP=BoltStormLightBeam NUM=1 TEXTURE=BoltStormLightBeamBlue


const BLENGTH = 10240.000000;
const BRADIUS = 8.000000;

var() float BeamLength, BeamRadius;
var() float BeamGlowCoefMin, BeamGlowCoefMax;
var float BaseBeamLength, BaseBeamRadius, BaseGlow;
var float tCount, totalT;
var bool bFadeIn;

simulated function PostBeginPlay()
{
	BaseBeamLength = BeamLength;
	BaseBeamRadius = BeamRadius;
	BaseGlow = ScaleGlow;
	adjustDimensions();
	Super.PostBeginPlay();
}

simulated function Tick(float Delta)
{
local float f, fglow;

	Super.Tick(Delta);
	if (Level.NetMode != NM_DedicatedServer)
	{
		fglow = BaseGlow;
		if (totalT > 0.0)
		{
			tCount += Delta;
			if (tCount <= totalT)
			{
				if (bFadeIn)
					f = tCount / totalT;
				else
					f = (totalT-tCount) / totalT;
				BeamRadius = f * BaseBeamRadius;
				fglow *= f;
			}
			adjustDimensions();
		}

		ScaleGlow = fglow * RandRange(BeamGlowCoefMin, BeamGlowCoefMax);
	}
}

simulated function fadeIn(float t)
{
	tCount = 0.0;
	totalT = t;
	bFadeIn = True;
}

simulated function fadeOut(float t)
{
	tCount = 0.0;
	totalT = t;
	bFadeIn = False;
}


simulated function setRadius(float newRadius)
{
	BeamRadius = newRadius;
	BaseBeamRadius = BeamRadius;
	adjustDimensions();
}

simulated function setLength(float newLength)
{
	BeamLength = newLength;
	BaseBeamLength = BeamLength;
	adjustDimensions();
}

simulated function setDimensions(float newRadius, float newLength)
{
	BeamRadius = newRadius;
	BeamLength = newLength;
	BaseBeamLength = BeamLength;
	BaseBeamRadius = BeamRadius;
	adjustDimensions();
}

simulated function adjustDimensions()
{
	bHidden = (BeamRadius == 0.0 || BeamLength == 0.0);
	if (bHidden)
		return;
	DrawScale = BeamRadius / BRADIUS;
	AnimSequence = 'Grow';
	AnimFrame = BeamLength / (BLENGTH * DrawScale) / 2.f;
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=BoltStormLightBeam
	bNetTemporary=False
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=2.000000
	DrawScale=1.000000
	LifeSpan=0.000000
	RemoteRole=ROLE_None
	
	BeamLength=512.000000
	BeamRadius=128.000000
	BeamGlowCoefMin=0.650000
	BeamGlowCoefMax=1.100000
}
