//////////////////////////////////////////////////////////////
//	Nali Weapons III tracing
//				Feralidragon (23-06-2010)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SBoltTracerGuide expands NaliWEffects;

function MakeTracing( float TraceSize)
{
local int NumPoints, n;
local float DistSpawn;

	NumPoints = Int(TraceSize / class'SBoltTrace'.default.TraceLength);
	for (n = 0; n <= NumPoints; n++)
	{
		DistSpawn = n * class'SBoltTrace'.default.TraceLength + class'SBoltTrace'.default.TraceLength/2;
		SpawnTrace(DistSpawn, n == 0, n == NumPoints);
	}
	Destroy();
}

function SpawnTrace(float Distance, optional bool bStart, optional bool bEnd)
{
local vector Dist;
local SBoltTrace bt;
local float RotPitch, RotYaw, RotRoll;
	
	Dist = ((vect(1,0,0)*Distance) >> Rotation);
	if (bStart)
	{
		bt = Spawn(Class'SBoltTraceStart', Owner,, Location + Dist + (vect(1,0,0) >> Rotation));
		Spawn(Class'SBoltLightEffect', Owner,, Location + Dist + (vect(-96,0,0) >> Rotation));
	}
	else if (bEnd)
		bt = Spawn(Class'SBoltTraceEnd', Owner,, Location + Dist);
	else
		bt = Spawn(Class'SBoltTrace', Owner,, Location + Dist);
	
	RotPitch = Rotation.Pitch;
	RotYaw = Rotation.Yaw;
	RotRoll = Rotation.Roll;
	bt.setNewRotationValues(RotPitch, RotYaw, RotRoll);
}

defaultproperties
{
    bNetTemporary=False
	LifeSpan=0.000000
	bHidden=True
}
