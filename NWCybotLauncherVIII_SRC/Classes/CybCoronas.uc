//////////////////////////////////////////////////////////////
//				Feralidragon (01-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybCoronas expands NaliWEffects
abstract;

#exec TEXTURE IMPORT NAME=CoreCenterRed FILE=Coronas\CoreCenterRed.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=CoreCenterBlue FILE=Coronas\CoreCenterBlue.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=CoreCenterGreen FILE=Coronas\CoreCenterGreen.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=CoreCenterYellow FILE=Coronas\CoreCenterYellow.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=CoreRingRed FILE=Coronas\CoreRingRed.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=CoreRingBlue FILE=Coronas\CoreRingBlue.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=CoreRingGreen FILE=Coronas\CoreRingGreen.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=CoreRingYellow FILE=Coronas\CoreRingYellow.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=EyeRed FILE=Coronas\EyeRed.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=EyeBlue FILE=Coronas\EyeBlue.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=EyeGreen FILE=Coronas\EyeGreen.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=EyeYellow FILE=Coronas\EyeYellow.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=LaserPntRed FILE=Coronas\LaserPntRed.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=LaserPntBlue FILE=Coronas\LaserPntBlue.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=LaserPntGreen FILE=Coronas\LaserPntGreen.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=LaserPntYellow FILE=Coronas\LaserPntYellow.bmp GROUP=Coronas FLAGS=2

#exec TEXTURE IMPORT NAME=CoreCenterRedTiny FILE=Coronas\CoreCenterRedTiny.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=CoreCenterBlueTiny FILE=Coronas\CoreCenterBlueTiny.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=CoreCenterGreenTiny FILE=Coronas\CoreCenterGreenTiny.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=CoreCenterYellowTiny FILE=Coronas\CoreCenterYellowTiny.bmp GROUP=Coronas FLAGS=2


var() texture Eyes[4];
var() texture CoreCenterTex[4];
var() texture CoreCenterTexTiny[4];
var() byte CoreCenterVertex;

var() texture CoreRingTex[4];
var() byte CoreRingVertex;

var() float FlickerMaxGlow, FlickerMinGlow;
var bool bFlicker;

var() float fadeInTime;
var float fadeInCount;
var bool bFadedIn, bFadeOut;

var() bool bTiny;

replication
{
	reliable if (Role == ROLE_Authority)
		bFadeOut;
}

simulated function SetTeam(byte team, optional byte texFlags, optional Actor aOwner, optional bool flicker)
{
	if (team > 3) team = 0;
	
	if (texFlags != 2)
	{
		if (bTiny)
			MultiSkins[CoreCenterVertex] = CoreCenterTexTiny[team];
		else
			MultiSkins[CoreCenterVertex] = CoreCenterTex[team];
	}
	
	if (texFlags != 1)
		MultiSkins[CoreRingVertex] = CoreRingTex[team];
	
	bFlicker = flicker;
	
	if (aOwner != None)
		DrawScale = aOwner.DrawScale;
}

simulated function SetTeamExtras(byte team, optional byte texFlags, optional Actor aOwner, optional bool flicker);

simulated function Tick(float DeltaTime)
{
	if (bFadeOut)
	{
		fadeInCount -= (DeltaTime / fadeInTime);
		if (fadeInCount <= 0.0)
		{
			Destroy();
			return;
		}
		
		if (Level.NetMode != NM_DedicatedServer)
			ScaleGlow = Default.ScaleGlow * fadeInCount;
	}
	else if (Level.NetMode != NM_DedicatedServer)
	{
		if (!bFadedIn)
		{
			fadeInCount += (DeltaTime / fadeInTime);
			ScaleGlow = Default.ScaleGlow * fadeInCount;
			if (fadeInCount >= fadeInTime)
			{
				ScaleGlow = Default.ScaleGlow;
				bFadedIn = True;
			}
		}
		else if (bFlicker)
			ScaleGlow = FRand()*(FlickerMaxGlow - FlickerMinGlow) + FlickerMinGlow;
	}
}

defaultproperties
{
    DrawType=DT_Mesh
	bParticles=True
	bRandomFrame=True
	bUnlit=True
	Scaleglow=1.500000
	Style=STY_Translucent
	DrawScale=1.000000
	
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	bTrailerPrePivot=True
	bAnimByOwner=True
	LifeSpan=0.000000
	Mass=0.000000
	
	Texture=CoreCenterRed
	
	CoreCenterTex(0)=CoreCenterRed
	CoreCenterTex(1)=CoreCenterBlue
	CoreCenterTex(2)=CoreCenterGreen
	CoreCenterTex(3)=CoreCenterYellow
	CoreRingTex(0)=CoreRingRed
	CoreRingTex(1)=CoreRingBlue
	CoreRingTex(2)=CoreRingGreen
	CoreRingTex(3)=CoreRingYellow
	Eyes(0)=EyeRed
	Eyes(1)=EyeBlue
	Eyes(2)=EyeGreen
	Eyes(3)=EyeYellow
	
	CoreCenterTexTiny(0)=CoreCenterRedTiny
	CoreCenterTexTiny(1)=CoreCenterBlueTiny
	CoreCenterTexTiny(2)=CoreCenterGreenTiny
	CoreCenterTexTiny(3)=CoreCenterYellowTiny
	
	FlickerMinGlow=0.850000
	FlickerMaxGlow=1.650000
	fadeInTime=1.000000
}
