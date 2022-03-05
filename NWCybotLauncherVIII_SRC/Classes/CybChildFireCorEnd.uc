//////////////////////////////////////////////////////////////
//				Feralidragon (14-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybChildFireCorEnd expands NWCoronaFX;

var() float searchMaxRadius, searchMinAccuracy;
var vector clientActorDir;
var class<Actor> clientActorHandle;
var Pawn clientActorInstigator;

replication
{
	reliable if (Role == ROLE_Authority && bNetInitial)
		clientActorHandle, clientActorInstigator, clientActorDir;
}

simulated function Tick(float Delta)
{
local Actor cAH;

	if (Level.NetMode != NM_DedicatedServer && localPlayer != None && clientActorHandle != None)
	{
		ForEach RadiusActors(clientActorHandle, cAH, searchMaxRadius)
		{
			if (cAH.Class == clientActorHandle && cAH.Instigator == clientActorInstigator && (Normal(cAH.Velocity) dot Normal(clientActorDir)) >= searchMinAccuracy)
			{
				if (Projectile(cAH) != None)
					Projectile(cAH).Explode(cAH.Location, Normal(cAH.Location - Location));
				else
					cAH.Destroy();
				break;
			}
		}
		clientActorHandle = None;
	}
	Super.Tick(Delta);
}

defaultproperties
{
	MaxDistance=20000.000000
	CoronaSprite=CybProjCorRed
	MaxCoronaSize=0.750000
	MinCoronaSize=0.500000
	CGlow=1.500000
	LifeSpan=0.300000
	FadeInTime=0.100000
	FadeOutTime=0.200000
	
	CGlowMax=1.750000
	CGlowMin=0.850000
	DScaleCoefMax=1.000000
	DScaleCoefMin=1.000000
	
	searchMaxRadius=384.000000
	searchMinAccuracy=0.850000
}
