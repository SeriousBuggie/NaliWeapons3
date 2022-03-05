//////////////////////////////////////////////////////////////
//				Feralidragon (19-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerLauncherLight expands NaliWEffects;

#exec TEXTURE IMPORT NAME=IonLauncherLightRed FILE=Coronas\IonLauncherLightRed.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=IonLauncherLightBlue FILE=Coronas\IonLauncherLightBlue.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=IonLauncherLightGreen FILE=Coronas\IonLauncherLightGreen.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=IonLauncherLightYellow FILE=Coronas\IonLauncherLightYellow.bmp GROUP=Coronas FLAGS=2

var() float PulseFreq, MinGlow, MaxGlow;
var() texture LightsTex[4];
var float timeCount;

function SetTeam(byte team)
{
	if (team > 3)
		team = 0;
	Texture = LightsTex[team];
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		timeCount += Delta;
		ScaleGlow = (sin(PulseFreq*timeCount*PI/2)+1) * (MaxGlow-MinGlow)/2 + MinGlow;
	}
}

defaultproperties
{
	DrawType=DT_Sprite
	LifeSpan=0.000000
	bNetTemporary=False
	Style=STY_Translucent
	bUnlit=True
	Texture=IonLauncherLightRed
	
	SpriteProjForward=32.000000
	DrawScale=1.000000
	PulseFreq=2.000000
	MinGlow=0.000000
	MaxGlow=2.000000
	
	LightsTex(0)=IonLauncherLightRed
	LightsTex(1)=IonLauncherLightBlue
	LightsTex(2)=IonLauncherLightGreen
	LightsTex(3)=IonLauncherLightYellow
}
