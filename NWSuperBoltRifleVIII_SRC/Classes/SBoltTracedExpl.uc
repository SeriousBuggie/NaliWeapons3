//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2013)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SBoltTracedExpl expands NaliWEffects;

#exec MESH IMPORT MESH=SBoltTracedExpl ANIVFILE=MODELS\SBoltTracedExpl_a.3d DATAFILE=MODELS\SBoltTracedExpl_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=SBoltTracedExpl STRENGTH=0.5
#exec MESH ORIGIN MESH=SBoltTracedExpl X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=SBoltTracedExpl SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=SBoltTracedExpl SEQ=Start STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltTracedExpl SEQ=End STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltTracedExpl SEQ=Expand STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=SBoltTracedExpl SEQ=Compress STARTFRAME=1 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=SBoltTracedExpl MESH=SBoltTracedExpl
#exec MESHMAP SCALE MESHMAP=SBoltTracedExpl X=0.6 Y=0.6 Z=1.2

#exec TEXTURE IMPORT NAME=SRedTrace FILE=Effects\SRedTrace.bmp GROUP=Effects FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=SBoltTracedExpl NUM=1 TEXTURE=SRedTrace

var() class<Effects> HeadParticlesClass;
var() float FXRateMax, FXRateMin;
var() name FXName;
var() bool bFadeOut;

simulated function PostBeginPlay()
{
local float fxr;
local Effects nwe;

	fxr = FRand()*(FXRateMax - FXRateMin) + FXRateMin;
	PlayAnim(FXName, fxr, 0.0);
	if (HeadParticlesClass != None)
		SpawnParticles(fxr);
}

function SpawnParticles( float rate)
{
	ParticlesPlay(Spawn(HeadParticlesClass,,, Location, Rotation), rate);
}

simulated function ParticlesPlay( actor A, float rate)
{
	A.PlayAnim( FXName, rate, 0.0);
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=SBoltTracedExpl
	
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=2.000000
	DrawScale=1.000000
	LifeSpan=0.750000
	
	HeadParticlesClass=Class'SBoltParticlesExpl'
	FXRateMax=0.950000
	FXRateMin=0.250000
	FXName="Expand"
}
