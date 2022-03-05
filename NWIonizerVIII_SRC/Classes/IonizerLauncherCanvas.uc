//////////////////////////////////////////////////////////////
//				Feralidragon (14-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerLauncherCanvas expands NaliWActor;

#exec MESH IMPORT MESH=IonizerLauncherCanvas ANIVFILE=MODELS\IonizerLauncherCanvas_a.3d DATAFILE=MODELS\IonizerLauncherCanvas_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonizerLauncherCanvas STRENGTH=0
#exec MESH ORIGIN MESH=IonizerLauncherCanvas X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonizerLauncherCanvas SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerLauncherCanvas SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonizerLauncherCanvas MESH=IonizerLauncherCanvas
#exec MESHMAP SCALE MESHMAP=IonizerLauncherCanvas X=1.2 Y=1.2 Z=2.4

#exec TEXTURE IMPORT NAME=IonLauncherCanvasGreen_01 FILE=SKINS\IonLauncherCanvasGreen_01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonizerLauncherCanvas NUM=1 TEXTURE=IonLauncherCanvasGreen_01

#exec TEXTURE IMPORT NAME=IonLauncherCanvasGreen_02 FILE=SKINS\IonLauncherCanvasGreen_02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonizerLauncherCanvas NUM=2 TEXTURE=IonLauncherCanvasGreen_02

#exec TEXTURE IMPORT NAME=IonLauncherCanvasRed_01 FILE=SKINS\IonLauncherCanvasRed_01.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=IonLauncherCanvasRed_02 FILE=SKINS\IonLauncherCanvasRed_02.bmp GROUP=Skins LODSET=2


var() texture CanvasRedSkin1, CanvasRedSkin2;
var() texture CanvasGreenSkin1, CanvasGreenSkin2;
var() float PulseFreq, MinGlow, MaxGlow;
var() float LauncherRadius;
var float timeCount;

simulated function SetIndicativeColor(bool bGreen)
{
	if (bGreen)
	{
		MultiSkins[1] = CanvasGreenSkin1;
		MultiSkins[2] = CanvasGreenSkin2;
	}
	else
	{
		MultiSkins[1] = CanvasRedSkin1;
		MultiSkins[2] = CanvasRedSkin2;
	}
}

simulated function Tick(float Delta)
{
	timeCount += Delta;
	ScaleGlow = (sin(PulseFreq*timeCount*PI/2)+1) * (MaxGlow-MinGlow)/2 + MinGlow;
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonizerLauncherCanvas
	RemoteRole=ROLE_None
	bHidden=True
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=2.000000
	
	CanvasGreenSkin1=IonLauncherCanvasGreen_01
	CanvasGreenSkin2=IonLauncherCanvasGreen_02
	CanvasRedSkin1=IonLauncherCanvasRed_01
	CanvasRedSkin2=IonLauncherCanvasRed_02
	PulseFreq=3.000000
	MaxGlow=3.000000
	MinGlow=0.750000
	
	LauncherRadius=259.000000
}
