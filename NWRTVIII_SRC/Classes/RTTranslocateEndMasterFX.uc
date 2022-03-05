//////////////////////////////////////////////////////////////
//				Feralidragon (07-04-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTTranslocateEndMasterFX expands RTTranslocateEndFX;

var() byte FXMaxAmount;
var() float FXInterval;

var byte fxCount;
var float fxTimeCount;

simulated function initFX(optional bool isTeam, optional byte myteam)
{
	Super.initFX(isTeam, myteam);
	if (isTeam)
	{
		LightType = LT_Pulse;
		LightEffect = LE_NonIncidence;
		
		if (Team == 0) LightHue = 0;
		else if (Team == 1) LightHue = 170;
		else if (Team == 2) LightHue = 85;
		else if (Team == 3) LightHue = 42;
	}
}

simulated function Tick(float Delta)
{
local RTTranslocateEndFX rtFX;

	Super.Tick(Delta);
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (Style != STY_Modulated)
			LightBrightness = Byte(ScaleGlow * Default.LightBrightness / Default.ScaleGlow);
	
		if (fxCount < FXMaxAmount)
		{
			fxTimeCount += Delta;
			if (fxTimeCount >= FXInterval)
			{
				fxTimeCount = 0.0;
				fxCount++;
				rtFX = Spawn(Class'RTTranslocateEndFX');
				rtFX.initFX((Style != STY_Modulated), Team);
			}
		}
	}
}


defaultproperties
{
	FXMaxAmount=10
	FXInterval=0.010000
	LightRadius=9
	LightBrightness=255
	LightSaturation=96
}
