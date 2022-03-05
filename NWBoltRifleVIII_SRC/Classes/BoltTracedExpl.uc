//////////////////////////////////////////////////////////////
//				Feralidragon (26-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltTracedExpl expands NaliWEffects;

#exec MESH IMPORT MESH=BoltTracedExpl ANIVFILE=MODELS\BoltTracedExpl_a.3d DATAFILE=MODELS\BoltTracedExpl_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltTracedExpl STRENGTH=0.5
#exec MESH ORIGIN MESH=BoltTracedExpl X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltTracedExpl SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=BoltTracedExpl SEQ=Start STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltTracedExpl SEQ=End STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltTracedExpl SEQ=Expand STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltTracedExpl SEQ=Compress STARTFRAME=1 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=BoltTracedExpl MESH=BoltTracedExpl
#exec MESHMAP SCALE MESHMAP=BoltTracedExpl X=0.6 Y=0.6 Z=1.2

#exec TEXTURE IMPORT NAME=BlueTrace FILE=Effects\BlueTrace.bmp GROUP=Effects FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=BoltTracedExpl NUM=1 TEXTURE=BlueTrace

var() class<Effects> HeadParticlesClass;
var() float FXRateMax, FXRateMin;
var() name FXName;
var() bool bFadeOut;
var float LSpan;

simulated function PostBeginPlay()
{
local float fxr;
local Effects nwe;

	fxr = FRand()*(FXRateMax - FXRateMin) + FXRateMin;
	PlayAnim(FXName, fxr, 0.0);
	if (HeadParticlesClass != None)
		SpawnParticles(fxr);
	LSpan = LifeSpan;
}

function SpawnParticles(float rate)
{
	ParticlesPlay(Spawn(HeadParticlesClass,,, Location, Rotation), rate);
}

simulated function ParticlesPlay(actor A, float rate)
{
	A.PlayAnim(FXName, rate, 0.0);
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (bFadeOut)
			ScaleGlow = LifeSpan * Default.ScaleGlow / LSpan;
		else
			ScaleGlow = (LSpan-LifeSpan) * Default.ScaleGlow / LSpan;
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=BoltTracedExpl
	
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=2.000000
	DrawScale=1.000000
	LifeSpan=0.750000
	bFadeOut=True
	
	HeadParticlesClass=Class'BoltParticlesExpl'
	FXRateMax=0.950000
	FXRateMin=0.250000
	FXName="Expand"
}
