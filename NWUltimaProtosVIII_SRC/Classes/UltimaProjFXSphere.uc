//////////////////////////////////////////////////////////////
//				Feralidragon (01-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProjFXSphere expands NaliWEffects;

#exec AUDIO IMPORT NAME="UltimaProjAmb" FILE=SOUNDS\UltimaProjAmb.wav GROUP="UltimaProtosProj"
#exec AUDIO IMPORT NAME="UltimaProjBurst" FILE=SOUNDS\UltimaProjBurst.wav GROUP="UltimaProtosProj"

#exec OBJ LOAD FILE=Textures\UltimaEnergyFX.utx PACKAGE=NWUltimaProtosVIII_SRC.FX

var() float ChargeGrowthRate, ChargeGrowthOutburstRate;
var() float ChargeTracesRate;
var() float ChargeLightningsRate, MaxLightningsDist, ChargeStartingLightningsRate, MaxStartingLightningsDist;
var() byte LightningShotTries, LightningStartingShotTries;
var() byte transHue[2];
var() float changeHueRate[2];
var() float LightFadeInTime, LightDyeOutTime;

var TournamentWeapon weaponOwner;
var byte curStage;
var float outburstTime;
var float chargeTraceTCount, chargeLightningsTCount;
var byte targetHue;
var float fHue;
var bool isDying;
var float lastDrawS, lastGlow;
var byte lastSndVol;

var UltimaProjElectricStart startFXElectric[7];
var UltimaProjLightStart lightFXStart, lightFXStartFP, lightFXMain, lightFXMainFP, lightFXLensFP, lightFXLensMFP;

var rotator AimRotation;

replication
{
	reliable if (Role == ROLE_Authority)
		weaponOwner;
	unreliable if (Role == ROLE_Authority)
		AimRotation;
}

function setWeaponOwner(TournamentWeapon W)
{
	weaponOwner = W;
}

simulated function vector ServerDrawOffset()
{
local vector PVOffset;

	if (weaponOwner == None || Instigator == None)
		return vect(0,0,0);
	
	PVOffset = weaponOwner.default.PlayerViewOffset;
	PVOffset.Y = Abs(PVOffset.Y);
	return ((PVOffset>>AimRotation) + Instigator.BaseEyeHeight*vect(0,0,1));
}

simulated function Tick(float Delta)
{
local rotator R;
local float L;
local vector DrawOffset;

	if (weaponOwner != None && !weaponOwner.bDeleteMe && Instigator != None && !Instigator.bDeleteMe && Instigator.Health > 0 && !Instigator.bHidden)
	{
		if (Level.NetMode != NM_StandAlone && Role == ROLE_Authority)
			AimRotation = Instigator.ViewRotation;
		
		if (Level.NetMode == NM_StandAlone || Instigator.ViewRotation != rot(0,0,0))
		{
			R = Instigator.ViewRotation;
			DrawOffset = weaponOwner.CalcDrawOffset();
		}
		else
		{
			R = AimRotation;
			DrawOffset = ServerDrawOffset();
		}
		
		R.Roll = Rotation.Roll;
		SetRotation(R);
		SetLocation(Instigator.Location + DrawOffset + (weaponOwner.FireOffset >> R));
		L = Default.LifeSpan - LifeSpan;
		
		DrawScale += (ChargeGrowthRate*Delta);
		if (L >= 1.4)
			ScaleGlow = L-1.4;
		
		if ((L>=0 && curStage==0) || (L>=0.4 && curStage==1) || (L>=1.4 && curStage==2) || (L>=4.4 && curStage==3) || (L>=6.4 && curStage==4))
		{
			if (Level.NetMode != NM_DedicatedServer)
				SpawnStageFX(curStage, R, Location);
			if (curStage==3 || curStage==4)
			{
				outburstTime = 0.2;
				PlayStageSound(0);
			}
				
			curStage++;
		}
		
		if (L <= LightFadeInTime)
		{
			LightBrightness = Byte(L*255/LightFadeInTime);
			SoundVolume = Byte(L*255/LightFadeInTime);
		}
			
		if (targetHue < ArrayCount(transHue))
		{
			if (LightHue != transHue[targetHue])
			{
				if (transHue[targetHue] > LightHue)
					fHue += (changeHueRate[targetHue]*Delta);
				else
					fHue -= (changeHueRate[targetHue]*Delta);
				LightHue = Byte(fHue);
			}
			else
			{
				fHue = transHue[targetHue];
				targetHue++;
			}
		}
		
		if (outburstTime > 0.0)
		{
			outburstTime -= Delta;
			DrawScale += (ChargeGrowthOutburstRate*Delta);
			if (outburstTime <= 0.0 && Role == ROLE_Authority)
				Spawn(Class'UltimaProjBurstShake');
		}
		
		SoundPitch = Byte(64 + DrawScale*960);
		
		if (Level.NetMode != NM_DedicatedServer)
			UpdateFX(Delta, R, Location, L);
	}
	else if (Default.LifeSpan-LifeSpan > 0.5)
	{
		if (!isDying)
		{
			isDying = True;
			weaponOwner = None;
			Instigator = None;
			LifeSpan = LightDyeOutTime;
			lastDrawS = DrawScale;
			lastGlow = ScaleGlow;
			lastSndVol = SoundVolume;
		}
	
		DrawScale = LifeSpan * lastDrawS / LightDyeOutTime;
		ScaleGlow = LifeSpan * lastGlow / LightDyeOutTime;
		SoundPitch = Byte(64 + DrawScale*960);
		SoundVolume = Byte(LifeSpan * lastSndVol / LightDyeOutTime);
		
		if (lightFXMain != None)
			lightFXMain.DrawScale = DrawScale * 5;
	}
		
}

function PlayStageSound(byte sn)
{
	if (sn == 0)
		PlaySound(Sound'UltimaProjBurst',, 10.0,, 1200.0);
}

simulated function UpdateFX(float Delta, rotator R, vector Loc, float stgTime)
{
local byte i;
local rotator newR;
local UltimaProjChargeTraces utrace;

	for (i = 0; i < ArrayCount(startFXElectric); i++)
	{
		if (startFXElectric[i] != None)
		{
			startFXElectric[i].SetLocation(Loc);
			newR = R;
			newR.Roll = startFXElectric[i].Rotation.Roll;
			startFXElectric[i].SetRotation(newR);
		}
	}
	
	if (lightFXStart != None)
	{
		lightFXStart.SetLocation(Loc);
		if (lightFXStartFP != None)
		{
			lightFXStartFP.SetLocation(Loc);
			lightFXStartFP.ScaleGlow = lightFXStart.ScaleGlow / 5;
			lightFXStartFP.DrawScale = lightFXStart.DrawScale;
		}
	}
	
	if (lightFXMain != None)
	{
		lightFXMain.SetLocation(Loc);
		lightFXMain.DrawScale = DrawScale * 5;
		if (stgTime >= 6.0)
			lightFXMain.DrawScale += ((stgTime - 6.0)/4);
		
		if (lightFXMainFP != None)
		{
			lightFXMainFP.SetLocation(Loc);
			lightFXMainFP.ScaleGlow = lightFXMain.ScaleGlow / 7.5;
			lightFXMainFP.DrawScale = lightFXMain.DrawScale;
		}
	}
	
	if (lightFXLensFP != None)
		lightFXLensFP.SetLocation(Loc);
	if (lightFXLensMFP != None)
		lightFXLensMFP.SetLocation(Loc);
		
	if (stgTime >= 1.4 && stgTime < 7.15) //Changed 6.15 to 7.15 to get more trace fx time
	{
		chargeTraceTCount += Delta;
		if (chargeTraceTCount >= 1/ChargeTracesRate)
		{
			chargeTraceTCount = 0;
			newR = RotRand(True);
			utrace = Spawn(Class'UltimaProjChargeTraces',,, Loc, newR);
			utrace.setActor(PlayerPawn(Instigator) != None && PlayerPawn(Instigator).Handedness == 1, Self, DrawScale*100, True);
		}
	}
	
	if (stgTime >= 5.0 && stgTime < 6.4)
	{
		chargeLightningsTCount += Delta;
		if (chargeLightningsTCount >= 1/ChargeStartingLightningsRate)
		{
			chargeLightningsTCount = 0;
			SpawnLightning(Loc, MaxStartingLightningsDist, LightningStartingShotTries);
		}
	}
	else if (stgTime >= 6.4 && stgTime < 7.4)
	{
		chargeLightningsTCount += Delta;
		if (chargeLightningsTCount >= 1/ChargeLightningsRate)
		{
			chargeLightningsTCount = 0;
			SpawnLightning(Loc, MaxLightningsDist, LightningShotTries);
		}
	}
}

simulated function SpawnLightning(vector Loc, float maxDist, byte tries)
{
local UltimaProjLightning ltrace;
local Actor A;
local vector HitNorm, HitLoc, Start, End, HitLocFinal, HitNormFinal;
local NukeElectricExpl nExpl;
local float Dist;
local byte i;

	for (i = 0; i < tries; i++)
	{
		Start = Loc;
		End = Loc + vector(RotRand())*maxDist;
		A = Trace(HitLoc, HitNorm, End, Start, False);
		if (A != None && (VSize(HitLoc-Loc)>VSize(HitLocFinal-Loc) || VSize(HitLocFinal)==0))
		{
			HitLocFinal = HitLoc;
			HitNormFinal = HitNorm;
		}
	}
	
	if (VSize(HitLocFinal) != 0)
	{
		Dist = VSize(HitNormFinal - Loc);
		ltrace = Spawn(Class'UltimaProjLightning',,, Loc, rotator(HitLocFinal - Loc));
		ltrace.SetLightning(Self, HitLocFinal);
		nExpl = Spawn(Class'NukeElectricExpl',,, HitLocFinal + HitNormFinal);
		nExpl.SetScale(Dist/48.0);
		
		Spawn(Class'UltimaDebrisParts', Self,, HitLocFinal + HitNormFinal, rotator(HitNormFinal));
		Spawn(Class'UltimaLightningDecal', Self,, HitLocFinal + HitNormFinal, rotator(HitNormFinal));
	}
}

simulated function SpawnStageFX(byte stg, rotator R, vector Loc)
{
local byte i;
local rotator newR;

	if (stg == 0)
	{
		for (i = 0; i < ArrayCount(startFXElectric); i++)
		{
			newR = R;
			newR.Roll = i*(65536/ArrayCount(startFXElectric)) - (32768/ArrayCount(startFXElectric));
			startFXElectric[i] = Spawn(Class'UltimaProjElectricStart',,, Loc, newR);
			startFXElectric[i].setMeshHandedness(PlayerPawn(Instigator) != None && PlayerPawn(Instigator).Handedness == 1);
		}
	}
	else if (stg == 1)
	{
		lightFXStart = Spawn(Class'UltimaProjLightStart',,, Loc);
		if (PlayerPawn(Instigator) != None)
		{
			lightFXStartFP = Spawn(Class'UltimaProjLightStart', Instigator,, Loc);
			lightFXStartFP.SetRenderSlave(True);
			lightFXLensFP = Spawn(Class'UltimaProjLightLens', Instigator,, Loc);
			lightFXLensFP.SetRenderSlave();
		}
	}
	else if (stg == 2)
	{
		lightFXMain = Spawn(Class'UltimaProjLightMain',,, Loc);
		if (PlayerPawn(Instigator) != None)
		{
			lightFXMainFP = Spawn(Class'UltimaProjLightMain', Instigator,, Loc);
			lightFXMainFP.SetRenderSlave(True);
			lightFXLensMFP = Spawn(Class'UltimaProjLightLensM', Instigator,, Loc);
			lightFXLensMFP.SetRenderSlave();
		}
	}
}

simulated function Destroyed()
{
local byte i;

	for (i = 0; i < ArrayCount(startFXElectric); i++)
	{
		if (startFXElectric[i] != None)
			startFXElectric[i].Destroy();
		startFXElectric[i] = None;
	}
	
	if (lightFXStart != None)
		lightFXStart.Destroy();
	if (lightFXStartFP != None)
		lightFXStartFP.Destroy();
	if (lightFXMain != None)
		lightFXMain.Destroy();
	if (lightFXMainFP != None)
		lightFXMainFP.Destroy();
	if (lightFXLensFP != None)
		lightFXLensFP.Destroy();
	if (lightFXLensMFP != None)
		lightFXLensMFP.Destroy();
		
	lightFXStart = None;
	lightFXStartFP = None;
	lightFXMain = None;
	lightFXMainFP = None;
	lightFXLensFP = None;
	lightFXLensMFP = None;
	
	Super.Destroyed();
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=NuclearNucleusSphereLevel05
	MultiSkins(1)=HotterHeatFX
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	bGameRelevant=True
	bReplicateInstigator=True
	bUnlit=True
	
	LifeSpan=8.000000
	DrawScale=0.00100
	ScaleGlow=0.000000
	Style=STY_Translucent
	
	AmbientSound=UltimaProjAmb
	SoundRadius=48
	SoundPitch=64
	SoundVolume=0
	
	ChargeGrowthRate=0.005000
	ChargeGrowthOutburstRate=0.100000
	ChargeTracesRate=10.000000
	ChargeLightningsRate=25.000000
	MaxLightningsDist=1500.000000
	LightningShotTries=3
	LightningStartingShotTries=4
	ChargeStartingLightningsRate=4.000000
	MaxStartingLightningsDist=300.000000
	
	LightType=LT_Steady
	LightBrightness=0
	LightSaturation=127
	LightRadius=16
	LightHue=170
	fHue=170
	transHue(0)=128
	changeHueRate(0)=30.000000
	transHue(1)=0
	changeHueRate(1)=64.000000
	
	LightFadeInTime=1.000000
	LightDyeOutTime=2.000000
}
