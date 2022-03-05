//////////////////////////////////////////////////////////////
// Blood explosion FX main class
//				Feralidragon (27-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBloodExplFX expands NaliWEffects
abstract;

var() float BaseColSize;
var() class<NWGoreCBoard> GoreBoardClass;

var() texture ExplTransRedTexA[7], ExplTransRedTexB[7], ExplTransRedTexC[7], ExplTransRedTexD[7];
var() texture ExplModRedTexA[7], ExplModRedTexB[7], ExplModRedTexC[7], ExplModRedTexD[7];
var() texture ExplTransGreenTexA[7], ExplTransGreenTexB[7], ExplTransGreenTexC[7], ExplTransGreenTexD[7];
var() texture ExplModGreenTexA[7], ExplModGreenTexB[7], ExplModGreenTexC[7], ExplModGreenTexD[7];

var() bool bFadeOut;
var() float ScaleInTime, ScaleOutTime, FinalOutScale;
var() bool bAnimatedTex;
var() byte StartingTexIndex;

var() bool bSpawnPieces;

var byte TexR, curT;
var float tCount;
var NWBloodyMess BloodyMessMut;
var bool hasInitServer, hasInitClient;
var float fxScale;
var string goreIDs;
var name DmgType;
var rotator VictimRot;
var vector VictimLoc;
var bool bDestroyOld;
var float MaxLifeSpan;


replication
{
	reliable if (Role == ROLE_Authority)
		fxScale, GoreBoardClass, BloodyMessMut, hasInitServer, goreIDs, DmgType, VictimRot, VictimLoc, bDestroyOld, MaxLifeSpan;
}


simulated function PostBeginPlay()
{
	if (Role == ROLE_Authority)
		MaxLifeSpan = default.LifeSpan;
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (Style == STY_Modulated)
			Texture = Texture'ModulInvis';
		else if (Style == STY_Translucent)
			Texture = Texture'TranslucInvis';
	}
}

simulated function InitBloodFX(name newDmgType, Actor newVictim, optional class<NWGoreCBoard> newGoreBoardClass, 
optional NWBloodyMess newBloodyMessMut, optional string newGoreIDs, optional bool destroyOld, optional float lSpanMult)
{
	if (newGoreBoardClass != None)
		GoreBoardClass = newGoreBoardClass;
	if (newBloodyMessMut != None)
		BloodyMessMut = newBloodyMessMut;
	goreIDs = newGoreIDs;
	DmgType = newDmgType;
	bDestroyOld = destroyOld;
	
	if (newVictim != None)
	{
		VictimRot = newVictim.Rotation;
		VictimLoc = newVictim.Location;
		if (newDmgType == 'Decapitated')
			fxScale = newVictim.CollisionHeight / BaseColSize;
		else
			fxScale = FMax(newVictim.CollisionRadius, newVictim.CollisionHeight) / BaseColSize;
		DrawScale *= fxScale;
	}
	if (Role == ROLE_Authority)
	{
		hasInitServer = True;
		if (lSpanMult > 0.0)
		{
			MaxLifeSpan = default.LifeSpan * lSpanMult;
			LifeSpan = MaxLifeSpan;
		}
	}
}

simulated function InitBloodFXBySize(float colR, float colH, optional class<NWGoreCBoard> newGoreBoardClass)
{
	if (newGoreBoardClass != None)
		GoreBoardClass = newGoreBoardClass;
	fxScale = FMax(colR, colH) / BaseColSize;
	DrawScale *= fxScale;
	hasInitServer = True;	
}


simulated function MakeSound()
{
	if (EffectSound1 != None)
		PlaySound(EffectSound1,, SndVol*fxScale,, SndRadius*fxScale);
}

simulated function Tick(float Delta)
{
local int i;
local float maxScale, fOutScale;

	if (Level.NetMode != NM_DedicatedServer && hasInitServer)
	{
		if (!hasInitClient)
		{
			TexR = Rand(4);
			SetTexture(StartingTexIndex);
			LifeSpan = MaxLifeSpan;
		}
		
		if (MaxLifeSpan > 0.0)
		{
			if (bAnimatedTex)
			{
				tCount += Delta;
				if (tCount >= MaxLifeSpan/ArrayCount(ExplTransRedTexA))
				{
					tCount -= (MaxLifeSpan/ArrayCount(ExplTransRedTexA));
					curT++;
					SetTexture(curT);
				}
			}
			
			if (bFadeOut)
				ScaleGlow = LifeSpan * default.ScaleGlow / MaxLifeSpan;
			if (ScaleInTime > 0.0 || ScaleOutTime > 0.0)
			{
				maxScale = default.DrawScale * fxScale;
				fOutScale = FinalOutScale * fxScale;
				if ((MaxLifeSpan-LifeSpan) < ScaleInTime)
					DrawScale = (MaxLifeSpan-LifeSpan) * maxScale / ScaleInTime;
				else if (LifeSpan < ScaleOutTime)
					DrawScale = LifeSpan * (maxScale - fOutScale) / ScaleOutTime + fOutScale;
				else
					DrawScale = maxScale;
			}
			
			if (!hasInitClient && fxScale > 0.0)
			{
				MakeSound();
				if (bSpawnPieces && BloodyMessMut != None)
					BloodyMessMut.ProcessClientGore(Delta, DmgType, Self, goreIDs, GoreBoardClass, VictimRot, VictimLoc, bDestroyOld);
			}
		}
		
		hasInitClient = True;
	}
	
	Super.Tick(Delta);
}

simulated function SetTexture(byte i)
{
	Texture = GoreBoardClass.static.GetExplTexture(i, TexR, Style == STY_Modulated);
}

defaultproperties
{
	EffectSound1=None
	LifeSpan=0.350000
	DrawType=DT_Sprite
	Style=STY_Translucent
	Texture=BloodExplRedTransA01
	
	BaseColSize=39.000000
	GoreBoardClass=Class'NWGoreCBoard'
}
