//////////////////////////////////////////////////////////////
//				Feralidragon (07-04-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTComebackFX expands NaliWEffects;

//Left Hand
#exec MESH IMPORT MESH=RTComebackFXL ANIVFILE=MODELS\RTComebackFX_a.3d DATAFILE=MODELS\RTComebackFX_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=RTComebackFXL STRENGTH=0
#exec MESH ORIGIN MESH=RTComebackFXL X=0 Y=0 Z=0 Yaw=128

//Right Hand
#exec MESH IMPORT MESH=RTComebackFXR ANIVFILE=MODELS\RTComebackFX_a.3d DATAFILE=MODELS\RTComebackFX_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTComebackFXR STRENGTH=0
#exec MESH ORIGIN MESH=RTComebackFXR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=RTComebackFXL SEQ=All STARTFRAME=0 NUMFRAMES=81
#exec MESH SEQUENCE MESH=RTComebackFXL SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTComebackFXL SEQ=ChangeToRazor STARTFRAME=0 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RTComebackFXL SEQ=ChangeToNormal STARTFRAME=8 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RTComebackFXL SEQ=Fire STARTFRAME=17 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=RTComebackFXL SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTComebackFXL SEQ=StillNormal STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTComebackFXL SEQ=StillRazor STARTFRAME=40 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTComebackFXL SEQ=SelectNormal STARTFRAME=48 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTComebackFXL SEQ=DownNormal STARTFRAME=42 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RTComebackFXL SEQ=SelectRazor STARTFRAME=61 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTComebackFXL SEQ=DownRazor STARTFRAME=55 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RTComebackFXL SEQ=SelectEmpty STARTFRAME=74 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTComebackFXL SEQ=DownEmpty STARTFRAME=68 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=RTComebackFXR SEQ=All STARTFRAME=0 NUMFRAMES=81
#exec MESH SEQUENCE MESH=RTComebackFXR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTComebackFXR SEQ=ChangeToRazor STARTFRAME=0 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RTComebackFXR SEQ=ChangeToNormal STARTFRAME=8 NUMFRAMES=9 RATE=8.0
#exec MESH SEQUENCE MESH=RTComebackFXR SEQ=Fire STARTFRAME=17 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=RTComebackFXR SEQ=StillEmpty STARTFRAME=37 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTComebackFXR SEQ=StillNormal STARTFRAME=38 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTComebackFXR SEQ=StillRazor STARTFRAME=40 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=RTComebackFXR SEQ=SelectNormal STARTFRAME=48 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTComebackFXR SEQ=DownNormal STARTFRAME=42 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RTComebackFXR SEQ=SelectRazor STARTFRAME=61 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTComebackFXR SEQ=DownRazor STARTFRAME=55 NUMFRAMES=7 RATE=30.0
#exec MESH SEQUENCE MESH=RTComebackFXR SEQ=SelectEmpty STARTFRAME=74 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=RTComebackFXR SEQ=DownEmpty STARTFRAME=68 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=RTComebackFXL MESH=RTComebackFXL
#exec MESHMAP SCALE MESHMAP=RTComebackFXL X=0.025 Y=0.025 Z=0.05

#exec MESHMAP NEW MESHMAP=RTComebackFXR MESH=RTComebackFXR
#exec MESHMAP SCALE MESHMAP=RTComebackFXR X=0.025 Y=0.025 Z=0.05

//TEAM PARTICLES
#exec TEXTURE IMPORT NAME=TeleFXRed FILE=CORONAS\TeleFXRed.bmp GROUP=TeleFXRed LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXBlue FILE=CORONAS\TeleFXBlue.bmp GROUP=TeleFXBlue LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXGreen FILE=CORONAS\TeleFXGreen.bmp GROUP=TeleFXGreen LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXYellow FILE=CORONAS\TeleFXYellow.bmp GROUP=TeleFXYellow LODSET=2

//DARK PARTICLES
#exec TEXTURE IMPORT NAME=TeleFXDark01 FILE=CORONAS\TeleFXDark01.bmp GROUP=TeleFXDark01 LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXDark02 FILE=CORONAS\TeleFXDark02.bmp GROUP=TeleFXDark02 LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXDark03 FILE=CORONAS\TeleFXDark03.bmp GROUP=TeleFXDark03 LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXDark04 FILE=CORONAS\TeleFXDark04.bmp GROUP=TeleFXDark04 LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXDark05 FILE=CORONAS\TeleFXDark05.bmp GROUP=TeleFXDark05 LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXDark06 FILE=CORONAS\TeleFXDark06.bmp GROUP=TeleFXDark06 LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXDark07 FILE=CORONAS\TeleFXDark07.bmp GROUP=TeleFXDark07 LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXDark08 FILE=CORONAS\TeleFXDark08.bmp GROUP=TeleFXDark08 LODSET=2


var() mesh FXLeft, FXRight;
var() texture TeamTex[4], NeutralTex[8];
var float FadeOutTime, CurFade;


simulated function initFX(float fadeTime, optional bool isTeam)
{
	FadeOutTime = fadeTime;
	CurFade = fadeTime;
	
	if (!isTeam)
	{
		Style = STY_Modulated;
		Texture = NeutralTex[0];
	}
	else
	{
		Style = STY_Translucent;
		Texture = TeamTex[0];
	}
}

simulated function setTeam(byte team)
{
	if (team < 4)
		Texture = TeamTex[team];
}

simulated function HandleMesh(bool bRightHand)
{
	if (bRightHand)
		Mesh = FXRight;
	else
		Mesh = FXLeft;
}

simulated function Tick(float Delta)
{
local float glow;

	if (FadeOutTime > 0 && CurFade > 0)
	{
		CurFade -= Delta;
		if (CurFade <= 0)
		{
			Destroy();
			return;
		}
		
		glow = CurFade * Default.ScaleGlow / FadeOutTime;
		if (Style == STY_Modulated)
			Texture = NeutralTex[Byte((Default.ScaleGlow - glow)/Default.ScaleGlow*(ArrayCount(NeutralTex)-1))];
		else
			Scaleglow = glow;
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=RTComebackFXL
	bHidden=True
	Style=STY_Translucent
	ScaleGlow=2.000000
	DrawScale=0.100000
	bUnlit=True
	bNetTemporary=False
	bParticles=True
	Texture=TeleFXRed
	
	FXLeft=RTComebackFXL
	FXRight=RTComebackFXR
	
	TeamTex(0)=TeleFXRed
	TeamTex(1)=TeleFXBlue
	TeamTex(2)=TeleFXGreen
	TeamTex(3)=TeleFXYellow
	
	NeutralTex(0)=TeleFXDark01
	NeutralTex(1)=TeleFXDark02
	NeutralTex(2)=TeleFXDark03
	NeutralTex(3)=TeleFXDark04
	NeutralTex(4)=TeleFXDark05
	NeutralTex(5)=TeleFXDark06
	NeutralTex(6)=TeleFXDark07
	NeutralTex(7)=TeleFXDark08
}
