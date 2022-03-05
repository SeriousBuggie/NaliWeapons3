//////////////////////////////////////////////////////////////
//				Feralidragon (04-04-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTTranslocateTrailFX expands NaliWEffects;

var() texture Neutral[8];
var() float FadeInTime;
var float MaxGlow, MaxScale;
var byte modulTexF;

simulated function initFX(Mesh M, name ASeq, float AFrame, float DScale, float MGlow, optional bool bNeutral)
{
	Mesh = M;
	AnimSequence = ASeq;
	AnimFrame = AFrame;
	DrawScale = DScale;
	MaxScale = DScale;
	MaxGlow = MGlow;
	if (bNeutral)
	{
		Style = STY_Modulated;
		SetTex(Texture'ModulInvis');
	}
}

simulated function SetTex(texture Tex, optional bool changeJTexOnly, optional byte j)
{
local byte i;

	if (changeJTexOnly && j < 9)
	{
		if (j < 8)
			MultiSkins[j] = Tex;
		else if (Tex != None)
			Texture = Tex;
	}
	else
	{
		for (i = 0; i < ArrayCount(MultiSkins); i++)
			MultiSkins[i] = Tex;
		Texture = Tex;
	}
}

simulated function SetModulTexFlag(byte flag)
{
	modulTexF = (modulTexF | Byte(2**flag));
}

simulated function bool GetModulTexFlag(byte flag)
{
	return ((modulTexF & Byte(2**flag)) > 0);
}

simulated function Tick(float Delta)
{
local float revLifeSpan, glow, Oglow;
local byte i;

	if (Level.NetMode != NM_DedicatedServer)
	{	
		revLifeSpan = Default.LifeSpan - LifeSpan;
		if (FadeInTime > 0 && revLifeSpan <= FadeInTime)
			glow = revLifeSpan * MaxGlow / FadeInTime;
		else
		{
			glow = LifeSpan * MaxGlow / (Default.LifeSpan - FadeInTime);
			DrawScale = MaxScale * (glow/MaxGlow);
		}
		
		if (Style == STY_Modulated)
		{
			Oglow = Class'RTTranslocateFX'.default.ScaleGlow;
			for (i = 0; i < ArrayCount(MultiSkins); i++)
			{
				if (GetModulTexFlag(i))
					SetTex(Neutral[Byte((Oglow - glow)/Oglow*(ArrayCount(Neutral)-1))], True, i);
			}
		}
		else
			ScaleGlow = glow;
	}
}


defaultproperties
{
    DrawType=DT_Mesh
    Mesh=LodMesh'UnrealShare.WoodenBoxM'
	bParticles=True
	bRandomFrame=True
	bUnlit=True
	bNetTemporary=True
	Texture=TranslucInvis
	Style=STY_Translucent
	
	LifeSpan=2.100000
	ScaleGlow=2.000000
	FadeInTime=0.100000
	
	Neutral(0)=TeleFXDark01
	Neutral(1)=TeleFXDark02
	Neutral(2)=TeleFXDark03
	Neutral(3)=TeleFXDark04
	Neutral(4)=TeleFXDark05
	Neutral(5)=TeleFXDark06
	Neutral(6)=TeleFXDark07
	Neutral(7)=TeleFXDark08
}
