//////////////////////////////////////////////////////////////
//				Feralidragon (29-06-2013)
//
// NW3 THE EXECUTIONER BUILD 1.00
//////////////////////////////////////////////////////////////

class TheExecOversGroundSmk expands TheExecOversBaseCloud;

var vector initVel;
var float lifeSpanVariation;
var bool initClient;

replication
{
	reliable if (Role == ROLE_Authority)
		initVel, lifeSpanVariation;
}

simulated function InitFX(vector rVel, optional float lifeVar)
{
	initVel = rVel;
	Velocity = initVel;
	lifeSpanVariation = lifeVar;
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (!initClient)
		{
			LifeSpan += lifeSpanVariation;
			initClient = True;
		}
		Velocity = LifeSpan * initVel / (default.LifeSpan + lifeSpanVariation);
	}
	Super.Tick(Delta);
}

defaultproperties
{
	DrawType=DT_Sprite
	Physics=PHYS_Projectile
	bNetTemporary=True
	
	DrawScale=25.000000
	MinDrawScale=10.000000
	LifeSpan=5.000000
	FadeInTime=0.500000
	FadeOutTime=5.000000
}
