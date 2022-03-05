//////////////////////////////////////////////////////////////
//				Feralidragon (25-12-2013)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarAmbSoundElectro expands NWNukeShockFX;

#exec AUDIO IMPORT NAME="SolarBirthSndLoop" FILE=SOUNDS\SolarBirthSndLoop.wav GROUP="Solar"

simulated function PreBeginPlay()
{
local byte i;

	for (i = 3; i <= 5; i++)
		NukeFX[i] = NukeFX[i-3];
	Super.PreBeginPlay();
}

defaultproperties
{
	FullTime=64.000000
	FullSize=60000.000000
	
	NukeFX(0)=(bActive=True,bDistanceBased=False,TimeDelay=2.500000,TimeDuration=1.500000)
	NukeFX(0)=(AmbSound=Sound'SolarBirthSndLoop',StartVolume=0,EndVolume=255,StartPitch=48,EndPitch=48)
	
	NukeFX(1)=(bActive=True,bDistanceBased=False,TimeDelay=4.000000,TimeDuration=55.500000)
	NukeFX(1)=(AmbSound=Sound'SolarBirthSndLoop',StartVolume=255,EndVolume=255,StartPitch=48,EndPitch=48)
	
	NukeFX(2)=(bActive=True,bDistanceBased=False,TimeDelay=59.500000,TimeDuration=3.000000)
	NukeFX(2)=(AmbSound=Sound'SolarBirthSndLoop',StartVolume=255,EndVolume=0,StartPitch=48,EndPitch=48)
}
