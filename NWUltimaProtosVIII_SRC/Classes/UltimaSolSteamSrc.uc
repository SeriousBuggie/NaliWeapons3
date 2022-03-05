//////////////////////////////////////////////////////////////
//				Feralidragon (03-02-2014)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolSteamSrc expands NaliWEffects;

#exec MESH IMPORT MESH=UltimaSolSteamCrater ANIVFILE=MODELS\UltimaSolSteamCrater_a.3d DATAFILE=MODELS\UltimaSolSteamCrater_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaSolSteamCrater STRENGTH=0.35
#exec MESH ORIGIN MESH=UltimaSolSteamCrater X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=UltimaSolSteamCrater SEQ=All STARTFRAME=0 NUMFRAMES=32 RATE=31.0
#exec MESH SEQUENCE MESH=UltimaSolSteamCrater SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaSolSteamCrater SEQ=Pressurize STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=UltimaSolSteamCrater SEQ=BreakThrough STARTFRAME=9 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaSolSteamCrater SEQ=Explode STARTFRAME=19 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaSolSteamCrater SEQ=Crater STARTFRAME=31 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=UltimaSolSteamCrater MESH=UltimaSolSteamCrater
#exec MESHMAP SCALE MESHMAP=UltimaSolSteamCrater X=0.4 Y=0.4 Z=0.8

#exec MESHMAP SETTEXTURE MESHMAP=UltimaSolSteamCrater NUM=1 TEXTURE=UltimaSolOrbWallFragDefTex
#exec MESHMAP SETTEXTURE MESHMAP=UltimaSolSteamCrater NUM=2 TEXTURE=UltimaSolOrbWallFragDefTex

#exec AUDIO IMPORT NAME="UltimaSolSteamRelease01" FILE=SOUNDS\UltimaSolSteamRelease01.wav GROUP="UltimaSolFX"
#exec AUDIO IMPORT NAME="UltimaSolSteamRelease02" FILE=SOUNDS\UltimaSolSteamRelease02.wav GROUP="UltimaSolFX"
#exec AUDIO IMPORT NAME="UltimaSolSteamRelease03" FILE=SOUNDS\UltimaSolSteamRelease03.wav GROUP="UltimaSolFX"
#exec AUDIO IMPORT NAME="UltimaSolSteamRelease04" FILE=SOUNDS\UltimaSolSteamRelease04.wav GROUP="UltimaSolFX"


var() float SteamSndVol, SteamSndRadius;
var() sound SteamSnd[4];
var vector FloorNorm;

simulated function initSteam(float scale)
{
local NWWallTexDetector nwDec;
local Texture T;

	FloorNorm = vector(Rotation);
	DrawScale = scale / 10.f;
	PlaySound(SteamSnd[Rand(ArrayCount(SteamSnd))],, SteamSndVol,, SteamSndRadius);
	PlayAnim('All', 5.0, 0.0);
	SetTimer(0.1, True);
	
	nwDec = Spawn(Class'NWWallTexDetector');
	T = nwDec.AttachDecal(200);
	nwDec.Destroy();
	nwDec = None;
	if (T != None)
	{
		MultiSkins[1] = T;
		MultiSkins[2] = T;
	}
}

simulated function stopSteam()
{
	SetTimer(0.0, False);
}

simulated function Timer()
{
local UltimaSolarSteamSmkW USSSW;

	USSSW = Spawn(Class'UltimaSolarSteamSmkW');
	USSSW.initAftermathSmk(RandRange(0.75, 1.5), FloorNorm * DrawScale * 500, DrawScale, DrawScale * 10.f, RandRange(0.1, 0.5));
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=UltimaSolSteamCrater
	MultiSkins(1)=UltimaSolOrbWallFragDefTex
	MultiSkins(2)=UltimaSolOrbWallFragDefTex
	DrawScale=1.000000
	ScaleGlow=1.000000
	Physics=PHYS_None
	LifeSpan=8.000000
	Style=STY_Normal
	
	SteamSndVol=1.000000
	SteamSndRadius=1000.000000
	SteamSnd(0)=UltimaSolSteamRelease01
	SteamSnd(1)=UltimaSolSteamRelease02
	SteamSnd(2)=UltimaSolSteamRelease03
	SteamSnd(3)=UltimaSolSteamRelease04
}
