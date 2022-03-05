//////////////////////////////////////////////////////////////
//				Feralidragon (21-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeDWallFrag expands NukeAWallFrag;

var() float SmkRate, SmkTime;
var float SmkRCount, SmkTCount;

var() byte MaxHitExplosions;
var byte hitExplCount;

simulated function HitWall (vector HitNormal, actor HitWall)
{
	Super.HitWall(HitNormal, HitWall);
	ProcessHitWall(HitNormal, HitWall);
}

simulated function ProcessHitWall(vector HitNormal, actor HitWall)
{
local NukeMiscExplD nmeD;

	if (Physics != PHYS_None && hitExplCount < MaxHitExplosions)
	{
		hitExplCount++;
		nmeD = Spawn(Class'NukeMiscExplD');
		nmeD.SetScale(CollisionRadius);
	}
}

simulated function Tick(float Delta)
{
local NukeSmkD nsD;

	Super.Tick(Delta);

	SmkTCount += Delta;
	if (SmkTCount <= SmkTime && SmkRate > 0 && Physics != PHYS_None)
	{
		SmkRCount += Delta;
		if (SmkRCount >= 1/SmkRate)
		{
			SmkRCount = 0;
			nsD = Spawn(Class'NukeSmkD');
			nsD.DrawScale = CollisionRadius / 6;
		}
	}
}

state Dying
{
    simulated function HitWall (vector HitNormal, actor HitWall)
    {
		Super.HitWall(HitNormal, HitWall);
		ProcessHitWall(HitNormal, HitWall);
	}
}

defaultproperties
{
	MinDrawScale=7.000000
	MaxDrawScale=15.000000
	
	InitMinForce=1400.000000
	InitMaxForce=2000.000000
	
	LifeSpan=20.000000
	LifeSpanVariation=7.000000
	
	SmkRate=5.000000
	SmkTime=7.000000
	MaxHitExplosions=15
}
