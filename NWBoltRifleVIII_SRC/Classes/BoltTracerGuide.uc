//////////////////////////////////////////////////////////////
//	Nali Weapons III tracing
//				Feralidragon (23-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltTracerGuide expands NaliWEffects;

function MakeTracing( float TraceSize)
{
local int NumPoints, n;
local float DistSpawn;

	NumPoints = Int(TraceSize / class'BoltTrace'.default.TraceLength);
	for (n = 0; n <= NumPoints; n++)
	{
		DistSpawn = n * class'BoltTrace'.default.TraceLength + class'BoltTrace'.default.TraceLength/2;
		SpawnTrace(DistSpawn, n == 0, n == NumPoints);
	}
	Destroy();
}

function SpawnTrace( float Distance, optional bool bStart, optional bool bEnd)
{
local vector Dist;
local BoltTrace bt;
local float RotPitch, RotYaw, RotRoll;
	
	Dist = ((vect(1,0,0)*Distance) >> Rotation);
	if (bStart)
	{
		bt = Spawn(Class'BoltTraceStart', Owner,, Location + Dist + (vect(1,0,0) >> Rotation));
		Spawn(Class'BoltLightEffect', Owner,, Location + Dist + (vect(-96,0,0) >> Rotation));
	}
	else if (bEnd)
		bt = Spawn(Class'BoltTraceEnd', Owner,, Location + Dist);
	else
		bt = Spawn(Class'BoltTrace', Owner,, Location + Dist);
	
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
