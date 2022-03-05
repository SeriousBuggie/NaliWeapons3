//////////////////////////////////////////////////////////////
//				Feralidragon (21-08-2011)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////

class MegatonAtom expands NaliWEffects;

#exec TEXTURE IMPORT NAME=MegatonAtomRed FILE=Coronas\MegatonAtomRed.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=MegatonAtomBlue FILE=Coronas\MegatonAtomBlue.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=MegatonAtomGreen FILE=Coronas\MegatonAtomGreen.bmp GROUP=Coronas FLAGS=2
#exec TEXTURE IMPORT NAME=MegatonAtomYellow FILE=Coronas\MegatonAtomYellow.bmp GROUP=Coronas FLAGS=2

var() texture AtomTex[4];
var() float FadeTime;

var MegatonAtomParticles MAtomPrts[4];
var MegatonAtomDecay MAtomDecay1, MAtomDecay2;
var texture OldTexture;
var float OldScaleGlow, OldDrawScale;

var bool bDestroySelf;
var float fadeCount;
var MegatonDeploy MOwner;

replication
{
	reliable if (Role == ROLE_Authority)
		bDestroySelf, MOwner;
}

simulated function PostBeginPlay()
{
local byte i;

	if (Level.NetMode != NM_DedicatedServer)
	{
		OldTexture = Texture;
		OldScaleGlow = ScaleGlow;
		OldDrawScale = DrawScale;
		MAtomDecay1 = Spawn(Class'MegatonAtomDecay', Self,,, rot(0,0,0));
		MAtomDecay2 = Spawn(Class'MegatonAtomDecay', Self,,, rot(0,0,32768));
		
		for (i = 0; i < ArrayCount(MAtomPrts); i++)
			MAtomPrts[i] = Spawn(Class'MegatonAtomParticles', Self,,, RotRand(True));
	}
	
	if (Role == ROLE_Authority)
		MOwner = MegatonDeploy(Owner);
}

function SetTeam(byte n)
{
	if (n >= ArrayCount(AtomTex))
		n = 0;
	
	Texture = AtomTex[n];
}

function SetDestroy()
{
	bDestroySelf = True;
	SetTimer(FadeTime, False);
}

simulated function Timer()
{
	Destroy();
}

simulated function Tick(float Delta)
{
local byte i;
local float f;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (!bDestroySelf && fadeCount < FadeTime)
		{
			fadeCount += Delta;
			if (fadeCount > FadeTime)
				fadeCount = FadeTime;
			ScaleGlow = fadeCount * default.ScaleGlow / FadeTime;
			DrawScale = fadeCount * default.DrawScale / FadeTime;
		}
		else if (bDestroySelf && fadeCount > 0.0)
		{
			fadeCount -= Delta;
			if (fadeCount < 0)
				fadeCount = 0;
			ScaleGlow = fadeCount * default.ScaleGlow / FadeTime;
			DrawScale = fadeCount * default.DrawScale / FadeTime;
		}
		
		if (OldTexture != Texture)
		{
			OldTexture = Texture;
			if (MAtomDecay1 != None)
				MAtomDecay1.Texture = Texture;
			if (MAtomDecay2 != None)
				MAtomDecay2.Texture = Texture;
			for (i = 0; i < ArrayCount(MAtomPrts); i++)
			{
				if (MAtomPrts[i] != None)
					MAtomPrts[i].Texture = Texture;
			}
		}
		
		if (ScaleGlow != OldScaleGlow)
		{
			OldScaleGlow = ScaleGlow;
			if (MAtomDecay1 != None)
				MAtomDecay1.ScaleGlow = ScaleGlow;
			if (MAtomDecay2 != None)
				MAtomDecay2.ScaleGlow = ScaleGlow;
			for (i = 0; i < ArrayCount(MAtomPrts); i++)
			{
				if (MAtomPrts[i] != None)
					MAtomPrts[i].ScaleGlow = ScaleGlow;
			}
		}
		
		if (DrawScale != OldDrawScale)
		{
			OldDrawScale = DrawScale;
			f = DrawScale / default.DrawScale;
			if (MAtomDecay1 != None)
				MAtomDecay1.DrawScale = MAtomDecay1.default.DrawScale * f;
			if (MAtomDecay2 != None)
				MAtomDecay2.DrawScale = MAtomDecay2.default.DrawScale * f;
			for (i = 0; i < ArrayCount(MAtomPrts); i++)
			{
				if (MAtomPrts[i] != None)
					MAtomPrts[i].DrawScale = MAtomPrts[i].default.DrawScale * f;
			}
		}
		
		if (MOwner != None && MOwner.Location != MOwner.OldLocation)
		{
			SetLocation(MOwner.Location);
			if (MAtomDecay1 != None)
				MAtomDecay1.SetLocation(Location);
			if (MAtomDecay2 != None)
				MAtomDecay2.SetLocation(Location);
			for (i = 0; i < ArrayCount(MAtomPrts); i++)
			{
				if (MAtomPrts[i] != None)
					MAtomPrts[i].SetLocation(Location);
			}
		}
	}
}

simulated function Destroyed()
{
local byte i;
	
	if (MAtomDecay1 != None)
		MAtomDecay1.Destroy();
	if (MAtomDecay2 != None)
		MAtomDecay2.Destroy();
	for (i = 0; i < ArrayCount(MAtomPrts); i++)
	{
		if (MAtomPrts[i] != None)
			MAtomPrts[i].Destroy();
		MAtomPrts[i] = None;
	}
	
	MAtomDecay1 = None;
	MAtomDecay2 = None;

	Super.Destroyed();
}

defaultproperties
{
    DrawType=DT_Sprite
	Texture=MegatonAtomRed
	bUnlit=True
	ScaleGlow=1.800000
	Style=STY_Translucent
	SpriteProjForward=0.000000
	
	bNetTemporary=False
	Lifespan=0.000000
	DrawScale=0.180000
	
	AtomTex(0)=MegatonAtomRed
	AtomTex(1)=MegatonAtomBlue
	AtomTex(2)=MegatonAtomGreen
	AtomTex(3)=MegatonAtomYellow
	
	FadeTime=1.000000
}
