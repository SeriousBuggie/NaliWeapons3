//////////////////////////////////////////////////////////////
//				Feralidragon (26-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarBirthCorWaveShock expands NWCoronaFX;

#exec TEXTURE IMPORT NAME=BirthWaveShock01 FILE=Coronas\BirthWaveShock01.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=BirthWaveShock02 FILE=Coronas\BirthWaveShock02.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=BirthWaveShock03 FILE=Coronas\BirthWaveShock03.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=BirthWaveShock04 FILE=Coronas\BirthWaveShock04.bmp GROUP=Coronas FLAGS=2

var() texture WaveTex[4];
var float lSpanCoef;

simulated function initWaveShock(byte texIndex, optional float lifeSpanCoef, optional float dScaleCoef)
{
	if (texIndex < ArrayCount(WaveTex))
		Texture = WaveTex[texIndex];
	if (lSpanCoef > 0.0)
		lSpanCoef = lifeSpanCoef;
	if (dScaleCoef > 0.0)
	{
		MaxCoronaSize *= dScaleCoef;
		MinCoronaSize *= dScaleCoef;
	}
}

simulated function Tick(float Delta)
{
local NWCorUpdaterFX lUpdt;

	if (Level.NetMode != NM_DedicatedServer && localPlayer != None)
	{	
		
		if (localUpdater != None && Delta != 0.5)
		{
			updateDelta = Delta;
			return;
		}
		else if (Delta == 0.5)
			Delta = updateDelta;
		LifeSpan -= (Delta * (lSpanCoef - 1.f));
		lUpdt = localUpdater;
		localUpdater = None;
		Super.Tick(Delta + Delta * (lSpanCoef - 1.f));
		localUpdater = lUpdt;
	}
}

defaultproperties
{
	MaxDistance=60000.000000
	FadeInTime=0.000000
	FadeOutTime=6.750000
	CoronaSprite=BirthShock
	MaxCoronaSize=550.000000
	MinCoronaSize=500.000000
	CGlow=0.350000
	StartScaleTime=6.750000
	EndScaleTime=0.000000
	LifeSpan=6.750000
	
	lSpanCoef=1.000000
	WaveTex(0)=BirthWaveShock01
	WaveTex(1)=BirthWaveShock02
	WaveTex(2)=BirthWaveShock03
	WaveTex(3)=BirthWaveShock04
}
