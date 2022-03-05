//////////////////////////////////////////////////////////////
//				Feralidragon (24-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearMushFX expands NuclearFX
abstract;

var() float MinLifeSpan, MaxLifeSpan;
var float LifeCount, MaxLifeCount;
var() byte FXMode;

var() float FadeInTime, FadeOutTime;
var() bool bSpawnNext;

var() class<NuclearMushFX> ClassMode1, ClassMode2, ClassMode3;
var byte fxSet, texSet;
var byte LastNSmk;

var float MyDelay, delayCount;

replication
{
	reliable if (Role == ROLE_Authority)
		fxSet, MaxLifeCount, MyDelay;
	unreliable if (Role == ROLE_Authority)
		texSet;
}

simulated function PostBeginPlay()
{
	if (FXMode != 2)
		ScaleGlow = 0.0;
		
	if (FXMode == 0)
		bParticles = True;
	else
		DrawScale = 0.01;
}

function setFX(byte localFxSet, optional float apDelay, optional byte texSetting, optional float maxlife)
{
local NuclearMushFX nextFX;

	fxSet = Min(7, localFxSet);
	
	if (texSetting == 0)
		texSet = Rand(ArrayCount(ExplBallTexA));
	else
		texSet = Min(ArrayCount(ExplBallTexA), texSetting) - 1;
	
	if (FXMode == 3)
		MaxLifeCount = maxlife + FRand()*(MaxLifeSpan - MinLifeSpan) + MinLifeSpan;
	else if (maxlife > 0)
		MaxLifeCount = maxlife;
	else
		MaxLifeCount = FRand()*(MaxLifeSpan - MinLifeSpan) + MinLifeSpan;
	
	if (apDelay > 0)
		MyDelay = apDelay;
	
	if (FXMode == 0)
	{
		if (bSpawnNext)
		{
			nextFX = Spawn(ClassMode1);
			nextFX.setFX(fxSet, MaxLifeCount + apDelay - FadeOutTime, texSet);
		}
		
		if (apDelay <= 0)
			MultiSkins[fxSet] = ExplBallTexA[texSet];
	}
	else if (FXMode == 1)
	{
		if (bSpawnNext)
		{
			nextFX = Spawn(ClassMode2);
			nextFX.setFX(fxSet, MaxLifeCount + apDelay - FadeOutTime, texSet);
		}
		
		if (apDelay <= 0)
			MultiSkins[fxSet] = ExplBallTexB[texSet];
	}
	else if (FXMode == 2)
	{
		nextFX = Spawn(ClassMode3);
		nextFX.setFX(fxSet, apDelay, texSet, MaxLifeCount);
		
		if (apDelay <= 0)
			MultiSkins[fxSet] = SmkBlackHTex[texSet];
	}
	else if (FXMode == 3 && apDelay <= 0)
		MultiSkins[fxSet] = SmkWhiteTex[texSet];
}

simulated function ActivateFX()
{
	if (FXMode == 0)
		MultiSkins[fxSet] = ExplBallTexA[texSet];
	else if (FXMode == 1)
		MultiSkins[fxSet] = ExplBallTexB[texSet];
	else if (FXMode == 2)
		MultiSkins[fxSet] = SmkBlackHTex[texSet];
	else if (FXMode == 3)
		MultiSkins[fxSet] = SmkWhiteTex[texSet];
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = Default.DrawScale;
		bParticles = True;
	}
}

simulated function Tick(float Delta)
{
local int perfoLevel;

	if (MyDelay > 0 && delayCount >= 0)
	{
		if (delayCount < MyDelay)
		{
			delayCount += Delta;
			return;
		}
		
		delayCount = -1;
		ActivateFX();
	}
	
	if (LifeCount > MaxLifeCount && MaxLifeCount > 0)
		LifeCount = MaxLifeCount;
	
	LifeCount -= Delta;
	
	if (LifeCount <= 0)
	{
		Destroy();
		return;
	}
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (Class'NuclearExplosionLevelD'.default.enableFXSmartPerformance)
		{
			perfoLevel = Class'NWUtils'.static.getFrameRateLevel(Level, Delta);
			if (perfoLevel < 0 && (perfoLevel * -1.6) > fxSet && fxSet < 5)
			{
				Destroy();
				return;
			}
		}
		
		if (FXMode != 2)
		{
			if ((MaxLifeCount-LifeCount) <= FadeInTime)
				ScaleGlow = (MaxLifeCount-LifeCount) * Default.ScaleGlow / FadeInTime;
			else
				ScaleGlow = LifeCount * Default.ScaleGlow / (MaxLifeCount-FadeInTime);
		}
		else
		{
			if ((MaxLifeCount-LifeCount) <= FadeInTime)
				ChangeBlackSmoke(Byte((MaxLifeCount-LifeCount) * 8.0 / FadeInTime));
			else
				ChangeBlackSmoke(Byte(LifeCount * 8.0 / (MaxLifeCount-FadeInTime)));
		}
	}
}

simulated function ChangeBlackSmoke(byte i)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (i == LastNSmk)
			return;
		LastNSmk = i;
		
		if (i >= 7)
			MultiSkins[fxSet] = SmkBlackATex[texSet];
		else if (i == 6)
			MultiSkins[fxSet] = SmkBlackBTex[texSet];
		else if (i == 5)
			MultiSkins[fxSet] = SmkBlackCTex[texSet];
		else if (i == 4)
			MultiSkins[fxSet] = SmkBlackDTex[texSet];
		else if (i == 3)
			MultiSkins[fxSet] = SmkBlackETex[texSet];
		else if (i == 2)
			MultiSkins[fxSet] = SmkBlackFTex[texSet];
		else if (i == 1)
			MultiSkins[fxSet] = SmkBlackGTex[texSet];
		else
			MultiSkins[fxSet] = SmkBlackHTex[texSet];
	}
}

defaultproperties
{
    DrawType=DT_Mesh
	Style=STY_Translucent
	DrawScale=11.250000
	ScaleGlow=1.500000
	bUnlit=True
	bMeshEnviroMap=True
	Texture=TranslucInvis
	bRandomFrame=True
	LifeCount=1000.000000
	
	bNetTemporary=True
}
