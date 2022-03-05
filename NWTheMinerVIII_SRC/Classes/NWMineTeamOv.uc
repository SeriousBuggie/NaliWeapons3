//////////////////////////////////////////////////////////////
//				Feralidragon (24-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class NWMineTeamOv expands Effects
abstract;

var() texture TeamTex[4];
var() float BlinkRate, OnRate, OffRate, OnTime, OffTime;
var bool bOn;
var float fxGlow, pauseCount;

replication
{
	unreliable if (Role == ROLE_Authority)
		BlinkRate;
}

simulated function SetTeamTex( byte team)
{
	if (team < 4)
		MultiSkins[1] = TeamTex[team];
}

function setBlinkRate( float newRate)
{
	BlinkRate = newRate;
}

simulated function Tick( float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (pauseCount > 0.0)
			pauseCount -= Delta;
		else if (!bOn)
		{
			fxGlow += (Delta * BlinkRate * OnRate);
			if (fxGlow > default.ScaleGlow)
			{
				fxGlow = default.ScaleGlow;
				bOn = True;
				pauseCount = OnTime;
			}
		}
		else
		{
			fxGlow -= (Delta * BlinkRate * OffRate);
			if (fxGlow <= 0.0)
			{
				fxGlow = 0.0;
				bOn = False;
				pauseCount = OffTime;
			}
		}
		
		ScaleGlow = fxGlow;
	}
}

defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	bAnimByOwner=True
	LifeSpan=0.000000
	Mass=0.000000
	
	DrawType=DT_Mesh
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=1.50000
	
	BlinkRate=1.000000
	OnRate=5.000000
	OffRate=1.000000
	OnTime=0.000000
	OffTime=0.000000
}