//////////////////////////////////////////////////////////////
//	Nali Weapons III InfraRed Precision Rifle tracing
//				Feralidragon (14-11-2010)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRTracerGuide expands NaliWEffects;

var() class<IRPRLightEffectR> LightFXClass[4];
var byte Team;

function MakeTracing(float TraceSize, optional bool bStartingShot, optional bool bEndingShot)
{
local int NumPoints, n;
local float DistSpawn, DistLeftover;
local float tLength;

	tLength = class'IRPRTrace'.default.TraceLength;
	NumPoints = Int(TraceSize / tLength);
	DistLeftover = TraceSize - (NumPoints * tLength);
	for (n = 0; n <= NumPoints; n++)
	{
		DistSpawn = n * tLength + tLength/2;
		if (n == NumPoints)
			DistSpawn -= ((tLength - DistLeftover)/2);
		SpawnTrace(DistSpawn, n == 0, n == NumPoints, DistLeftover/tLength, bStartingShot, bEndingShot);
	}
	Destroy();
}

function SetTeam(byte n)
{
	Team = n;
	if (Team > 3)
		Team = 0;
}

function SpawnTrace(float Distance, optional bool bStart, optional bool bEnd, 
optional float sizeLeftover, optional bool bStartingShot, optional bool bEndingShot)
{
local vector Dist, LightFXOffset;
local IRPRTrace bt;
local float tLength;
local class<IRPRTrace> TraceClass;
local float RotPitch, RotYaw, RotRoll;
	
	Dist = ((vect(1,0,0)*Distance) >> Rotation);
	tLength = class'IRPRTrace'.default.TraceLength;
	
	if (!bEnd)
		sizeLeftover = 1.0;
	else if (sizeLeftover <= 0.0)
		return;
		
	if (bStart && bStartingShot)
		TraceClass = Class'IRPRTraceStart';
	else if (bEnd && bEndingShot)
		TraceClass = Class'IRPRTraceEnd';
	else
		TraceClass = Class'IRPRTrace';
	
	if (bStart)
	{
		LightFXOffset = (tLength/2) * vect(-1,0,0);
		if (bEnd)
			LightFXOffset *= sizeLeftover;
		Spawn(LightFXClass[Team], Owner,, Location + Dist + (LightFXOffset >> Rotation));
	}
	
	RotPitch = Rotation.Pitch;
	RotYaw = Rotation.Yaw;
	RotRoll = Rotation.Roll;
	
	bt = Spawn(TraceClass, Owner,, Location + Dist);
	bt.SetupTrace(RotPitch, RotYaw, RotRoll, sizeLeftover);
	bt.SetTeamTex(Team);
}

defaultproperties
{
    bNetTemporary=False
	LifeSpan=0.000000
	bHidden=True
	
	LightFXClass(0)=Class'IRPRLightEffectR'
	LightFXClass(1)=Class'IRPRLightEffectB'
	LightFXClass(2)=Class'IRPRLightEffectG'
	LightFXClass(3)=Class'IRPRLightEffectY'
}
