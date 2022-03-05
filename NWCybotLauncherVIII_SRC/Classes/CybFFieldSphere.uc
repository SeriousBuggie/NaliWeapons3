//////////////////////////////////////////////////////////////
//				Feralidragon (20-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybFFieldSphere expands NaliFullMeshFX;

#exec MESH IMPORT MESH=CybFFieldSphere ANIVFILE=MODELS\CybFFieldSphere_a.3d DATAFILE=MODELS\CybFFieldSphere_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybFFieldSphere STRENGTH=0.15
#exec MESH ORIGIN MESH=CybFFieldSphere X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybFFieldSphere SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybFFieldSphere SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybFFieldSphere MESH=CybFFieldSphere
#exec MESHMAP SCALE MESHMAP=CybFFieldSphere X=0.5 Y=0.5 Z=1.0

#exec TEXTURE IMPORT NAME=FFieldLaserFXRed FILE=Coronas\FFieldLaserFXRed.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=FFieldLaserFXBlue FILE=Coronas\FFieldLaserFXBlue.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=FFieldLaserFXGreen FILE=Coronas\FFieldLaserFXGreen.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=FFieldLaserFXYellow FILE=Coronas\FFieldLaserFXYellow.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=CybFFieldSphere NUM=1 TEXTURE=FFieldLaserFXRed

#exec TEXTURE IMPORT NAME=FFieldLineFXRed FILE=Coronas\FFieldLineFXRed.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=FFieldLineFXBlue FILE=Coronas\FFieldLineFXBlue.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=FFieldLineFXGreen FILE=Coronas\FFieldLineFXGreen.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=FFieldLineFXYellow FILE=Coronas\FFieldLineFXYellow.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=CybFFieldSphere NUM=2 TEXTURE=FFieldLineFXRed

#exec TEXTURE IMPORT NAME=FFieldFadeFXRed FILE=Coronas\FFieldFadeFXRed.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=FFieldFadeFXBlue FILE=Coronas\FFieldFadeFXBlue.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=FFieldFadeFXGreen FILE=Coronas\FFieldFadeFXGreen.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=FFieldFadeFXYellow FILE=Coronas\FFieldFadeFXYellow.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=CybFFieldSphere NUM=3 TEXTURE=FFieldFadeFXRed

#exec AUDIO IMPORT NAME="CybFFieldAmb" FILE=SOUNDS\CybFFieldAmb.wav GROUP="Loop"


const SphericalMeshRadius = 480.000000;

var() texture FieldLaserFX[4], FieldLineFX[4], FieldFX[4];
var() float RegenRate;
var() float MaxDrawScale;
var float CurDrawScale;
var bool bFirstDone;

var() byte LightFXHue[4];
var() sound FieldHitSnd;

var name BounceList[32];
var bool bInvertLists;
var int maxBounceClasses;

replication
{
	reliable if (Role == ROLE_Authority)
		BounceList, bInvertLists, maxBounceClasses;
}

function PreBeginPlay()
{
local byte i;

	Super.PreBeginPlay();
	for (i = 0; i < ArrayCount(BounceList); i++)
		BounceList[i] = Class'CybotLauncher'.default.FFieldBounceList[i];
	bInvertLists = Class'CybotLauncher'.default.bInvertListsProcessing;
	LoadLists();
}

simulated function PostBeginPlay()
{
	CurDrawScale = MaxDrawScale;
	SetTimer(0.025, True);
	
	Super.PostBeginPlay();
}

function LoadLists()
{
local int i;

	maxBounceClasses = ArrayCount(BounceList);
	if (Class'CybotLauncher'.default.bOptimizeLists)
	{
		for (i = 0; i < ArrayCount(BounceList); i++)
		{
			if (BounceList[i] == '')
			{
				maxBounceClasses = i;
				break;
			}
		}
	}
}

simulated function SetTeam(byte team)
{
	if (team > 3) team = 0;
	
	MultiSkins[1] = FieldLaserFX[team];
	MultiSkins[2] = FieldLineFX[team];
	MultiSkins[3] = FieldFX[team];
	LightHue = LightFXHue[team];
}

simulated function Tick(float Delta)
{
	Super.Tick(Delta);
	if (Delta == 0.5)
		return;
	
	if (Cybot(Owner) != None)
	{
		if (DrawScale < CurDrawScale)
		{
			if (CurDrawScale < MaxDrawScale)
			{
				DrawScale = CurDrawScale;
				CurDrawScale = MaxDrawScale;
			}
			else
			{
				if (bFirstDone)
					DrawScale += (RegenRate*Delta);
				else
					DrawScale += (RegenRate*Delta*5);
			}
		}
		else if (DrawScale > CurDrawScale)
		{
			if (CurDrawScale < MaxDrawScale)
				DrawScale -= (RegenRate*Delta*12.5);
			else
			{
				DrawScale = CurDrawScale;
				bFirstDone = True;
			}
		}
	}
	
	if (Level.NetMode != NM_DedicatedServer && Owner != None)
		SetRotation(Owner.Rotation);
}

simulated function Timer()
{
local Projectile P;

	ForEach VisibleCollidingActors(Class'Projectile', P, FMax(1.0,DrawScale*SphericalMeshRadius), CentralLoc)
	{
		if ((Normal(P.Velocity) dot Normal(Location - P.Location)) >= 0 && P.Tag != Name)
		{
			if ((P.default.LifeSpan - P.LifeSpan) > 0.1 || P.default.LifeSpan == 0)
			{
				SpawnFX(P);
				if (IsBounceable(P))
				{
					P.HitWall(Normal(P.Location - Location), Self);
					if (VSize(P.Velocity) < 150.0)
						P.Velocity += Normal(P.Location - Location)*450;
				}
				else
					P.Explode(P.Location, Normal(P.Location - Location));
			}
			else
				P.Tag = Name;
		}
	}
}

simulated function bool IsBounceable(Actor A)
{
local int i;

	if (A == None)
		return False;

	if (bInvertLists)
	{
		for (i = maxBounceClasses-1; i >= 0; i--)
		{
			if (BounceList[i] != '' && A.IsA(BounceList[i]))
				return True;
		}
	}
	else
	{
		for (i = 0; i < maxBounceClasses; i++)
		{
			if (BounceList[i] != '' && A.IsA(BounceList[i]))
				return True;
		}
	}
	return False;
}

function SpawnFX(Projectile P)
{
local CybFFieldHitFX fx;
local vector v;

	if (P != None)
	{
		Spawn(Class'CybFFieldTarget', Owner,, P.Location);
		v = Normal(P.Location - Location) * FMax(1.0,DrawScale*SphericalMeshRadius);
		fx = Spawn(Class'CybFFieldHitFX', Owner,, Location + v);
		if (Cybot(Owner) != None)
		{
			if (P.Damage == 0)
				fx.SetTeam(Cybot(Owner).myTeam,, Self,, v);
			else
				fx.SetTeam(Cybot(Owner).myTeam, FMax(0.1, P.Damage/15), Self,, v);
		}
		
		if (FieldHitSnd != None)
			PlaySound(FieldHitSnd,,10.0,, SphericalMeshRadius*3.5);
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybFFieldSphere
	
	bUnlit=True
	Scaleglow=1.500000
	Style=STY_Translucent
	DrawScale=1.000000
	
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Physics=PHYS_None
	LifeSpan=0.000000
	Mass=0.000000
	
	FieldLaserFX(0)=FFieldLaserFXRed
	FieldLaserFX(1)=FFieldLaserFXBlue
	FieldLaserFX(2)=FFieldLaserFXGreen
	FieldLaserFX(3)=FFieldLaserFXYellow
	
	FieldLineFX(0)=FFieldLineFXRed
	FieldLineFX(1)=FFieldLineFXBlue
	FieldLineFX(2)=FFieldLineFXGreen
	FieldLineFX(3)=FFieldLineFXYellow
	
	FieldFX(0)=FFieldFadeFXRed
	FieldFX(1)=FFieldFadeFXBlue
	FieldFX(2)=FFieldFadeFXGreen
	FieldFX(3)=FFieldFadeFXYellow
	
	RegenRate=0.100000
	MaxDrawScale=1.000000
	FieldHitSnd=CybFFieldHitSnd
	
	AmbientSound=CybFFieldAmb
	SoundRadius=128
	SoundVolume=255
	
	LightType=LT_Steady
	LightRadius=32
	LightEffect=LE_FastWave
	LightBrightness=100
	LightHue=0
	LightSaturation=0
	
	LightFXHue(0)=0
	LightFXHue(1)=170
	LightFXHue(2)=85
	LightFXHue(3)=42
	
	RadiusView=480.000000
	bAffectByDrawScale=True
}
