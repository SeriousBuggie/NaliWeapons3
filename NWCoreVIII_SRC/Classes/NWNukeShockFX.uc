//////////////////////////////////////////////////////////////
//	Nali Weapons III Nuke Shock LOCAL effect
//				Feralidragon (14-06-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWNukeShockFX expands NaliWActor
abstract;

const EULER = 2.7182818284590452;
const GAUSSIAN_C = 0.185000;

enum EFOVCurve
{
	FOVC_Linear,
	FOVC_Quadratic,
	FOVC_Trigno,
	FOVC_Gaussian,
};

struct NukeFXStruct
{
	var() bool bActive;
	
	var() bool bDistanceBased;	//Be time or distance based (delay and duration)
	var() float TimeDelay;	//Time delay
	var() float TimeDuration;	//Time duration
	var() float DistOffsetMin, DistOffsetMax;	//Distance offset
	var() float MinMufflingDist;
	
	var() vector BlurNoise;
	var() vector Shake;
	var() float ShakeRate;
	var float ShakeDeltaCount;
	var vector CurrentShake, OldShake;
	var() bool bRisingShake;
	var() bool bMuffledShake;
	var() bool bFadeShakeOnDistance;
	var() float ShakeDistance;
	var bool bShaked;
	
	var() sound AmbSound;
	var() byte StartVolume, EndVolume;
	var() byte StartPitch, EndPitch;
	var() bool bMuffledAmb;
	var() float NegMinTimeDelay;
	var NaliAmbWeapSnd ShockAmbObj;
	
	var() sound HitSound, MufHitSound;
	var() bool bMuffledHit;
	var() bool bInterruptOtherSnd;
	var bool bPlayedSound;
	
	var() vector FlashAmount;
	var() bool bMuffledFlash;
	var() float FlashScale;
	var bool bFlashed;
	
	var() bool bAffectFOV;
	var() int FOVDistortion;
	var() EFOVCurve FOVDistortionType;
	var() float FOVRiseFactor;
	var() bool bMuffledFOV;
	var bool bFOVAffected;
	
	var() bool bSpawnFX;
	var() bool bMuffledSpawnFX;
	var bool bSpawnedFX;
};

var() NukeFXStruct NukeFX[8];
var() float FullTime, FullSize;
var() bool bAutoLifeSpan;

var PlayerPawn localPlayer;
var vector CenterLoc;
var float LifeCount;
var vector VTgtLocOld[8], VTgtLocNew[8];
var bool enableShakeFX;

simulated function PostBeginPlay()
{
local PlayerPawn PP;
local NWClientAuto CA;
local byte i;
	
	if (bAutoLifeSpan)
		LifeSpan = FullTime;
	else
		LifeCount = FullTime;
	
	CenterLoc = Location;
	if (Level.NetMode != NM_DedicatedServer) 
	{
		foreach AllActors(class'PlayerPawn', PP)
		{
			if (Viewport(PP.Player) != None)
			{
				localPlayer = PP;
				SetOwner(PP);
				break;
			}
		}
		
		foreach AllActors(Class'NWClientAuto', CA)
		{
			enableShakeFX = CA.enableShakeFX;
			break;
		}
	}
}

simulated function Tick(float Delta)
{
local vector camLoc;
local rotator camRot;
local Actor camActor;
local byte i;
local float timeInterval, shockDistLevel, shockSize, shockInterval, distInterval;
local bool bMuffled;
local float FXScale, RealScale;
local float finalFOV;
local int fxFOV;
local bool bValid;

local vector locMin, locMax;
local vector shk, noise;
local byte vol, pit;
local sound sndP;
local bool bValidShake, bValidAmbSnd, bValidFOVAffect;
local bool bOwnerMuffled;


	if (localPlayer != None && Level.NetMode != NM_DedicatedServer)
	{
		if (!bAutoLifeSpan) 
			LifeCount -= Delta;
		localPlayer.PlayerCalcView(camActor, camLoc, camRot);
		SetLocation(camLoc);
		
		if (bAutoLifeSpan)
			timeInterval = FullTime - LifeSpan;
		else
			timeInterval = FullTime - LifeCount;
		shockSize = timeInterval * FullSize / FullTime;
		bOwnerMuffled = !FastTrace(camLoc, CenterLoc);
		
		for (i = 0; i < ArrayCount(NukeFX); i++)
		{
			if (NukeFX[i].bActive)
			{
				locMin = camLoc + Normal(camLoc - CenterLoc) * NukeFX[i].DistOffsetMin;
				locMax = camLoc + Normal(camLoc - CenterLoc) * NukeFX[i].DistOffsetMax;
				bMuffled = bOwnerMuffled && (VSize(camLoc - CenterLoc)>NukeFX[i].MinMufflingDist);
				
				distInterval = VSize(locMax - locMin);
				shockInterval = VSize(locMin - CenterLoc);
				if (NukeFX[i].DistOffsetMin < 0 && VSize(camLoc - CenterLoc) < Abs(NukeFX[i].DistOffsetMin))
					shockInterval = -shockInterval;
				shockDistLevel = distInterval + shockInterval;
				
				bValid = False;
				
				if (!NukeFX[i].bDistanceBased && timeInterval >= NukeFX[i].TimeDelay && timeInterval <= (NukeFX[i].TimeDelay + NukeFX[i].TimeDuration) && NukeFX[i].TimeDuration > 0)
				{
					FXScale = (timeInterval - NukeFX[i].TimeDelay) / NukeFX[i].TimeDuration;
					bValid = True;
				}
				else if (NukeFX[i].bDistanceBased && VSize(camLoc - CenterLoc) <= FullSize && shockSize >= shockInterval && shockSize <= shockDistLevel)
				{
					FXScale = (shockSize - shockInterval) / distInterval;
					bValid = True;
				}
				else
					ResetFXElement(i);
				
				bValidShake = bValid && enableShakeFX && (bAutoLifeSpan || (LifeCount < 0 && NukeFX[i].bShaked) || LifeCount >= 0);
				bValidAmbSnd = bValid && (bAutoLifeSpan || (LifeCount < 0 && NukeFX[i].ShockAmbObj != None) || LifeCount >= 0);
				bValidFOVAffect = bValid && (bAutoLifeSpan || (LifeCount < 0 && NukeFX[i].bFOVAffected) || LifeCount >= 0);
				if (!bAutoLifeSpan && LifeCount < 0)
					bValid = False;
				
				if (bValid || bValidShake || bValidAmbSnd || bValidFOVAffect)
				{
					
					//========================= Shake =============================================
					if (bValidShake && (VSize(NukeFX[i].BlurNoise) > 0 || VSize(NukeFX[i].Shake) > 0) && NukeFX[i].ShakeRate > 0 && 
					((NukeFX[i].bFadeShakeOnDistance && VSize(camLoc - CenterLoc) <= NukeFX[i].ShakeDistance) || !NukeFX[i].bFadeShakeOnDistance))
					{
						if (NukeFX[i].bRisingShake) RealScale = FXScale;
						else RealScale = 1 - FXScale;
						
						//Noise / blur
						noise.X = (2*FRand()-1) * NukeFX[i].BlurNoise.X * RealScale;
						noise.Y = (2*FRand()-1) * NukeFX[i].BlurNoise.Y * RealScale;
						noise.Z = (2*FRand()-1) * NukeFX[i].BlurNoise.Z * RealScale;
						
						//Shake
						if (NukeFX[i].ShakeDeltaCount <= 0)
						{
							NukeFX[i].ShakeDeltaCount = 1 / NukeFX[i].ShakeRate;
							
							NukeFX[i].OldShake = NukeFX[i].CurrentShake;
							NukeFX[i].CurrentShake.X = (2*FRand()-1) * NukeFX[i].Shake.X * RealScale;
							NukeFX[i].CurrentShake.Y = (2*FRand()-1) * NukeFX[i].Shake.X * RealScale;
							NukeFX[i].CurrentShake.Z = (2*FRand()-1) * NukeFX[i].Shake.X * RealScale;
						}
						else
							NukeFX[i].ShakeDeltaCount -= Delta;
						
						shk = (NukeFX[i].OldShake + (NukeFX[i].CurrentShake - NukeFX[i].OldShake)) * (1/NukeFX[i].ShakeRate - NukeFX[i].ShakeDeltaCount) * NukeFX[i].ShakeRate; 
						
						if (bMuffled && NukeFX[i].bMuffledShake)
						{
							noise /= 2;
							shk /= 2;
						}
						
						if (NukeFX[i].bFadeShakeOnDistance)
						{
							noise *= ((NukeFX[i].ShakeDistance - VSize(camLoc - CenterLoc)) / NukeFX[i].ShakeDistance);
							shk *= ((NukeFX[i].ShakeDistance - VSize(camLoc - CenterLoc)) / NukeFX[i].ShakeDistance);
						}
						
						if (localPlayer.ViewTarget == None)
						{
							if (localPlayer.IsInState('CheatFlying') || localPlayer.Physics == PHYS_Falling)
								localPlayer.WalkBob = ((shk + noise) >> camRot);
							else
								localPlayer.WalkBob += ((shk + noise) >> camRot);
							if (localPlayer.Physics == PHYS_Walking && VSize(localPlayer.WalkBob) >= FMax(localPlayer.CollisionRadius, localPlayer.CollisionHeight))
								localPlayer.WalkBob = FMax(localPlayer.CollisionRadius, localPlayer.CollisionHeight)*Normal(localPlayer.WalkBob);
						}
						else if (Level.NetMode == NM_StandAlone || localPlayer.ViewTarget.Physics == PHYS_None)
						{
							if (VSize(VTgtLocOld[i]) > 0)
								localPlayer.ViewTarget.Move(VTgtLocOld[i] - VTgtLocNew[i]);
							
							VTgtLocOld[i] = localPlayer.ViewTarget.Location;
							localPlayer.ViewTarget.Move(((shk + noise) >> camRot));
							VTgtLocNew[i] = localPlayer.ViewTarget.Location;
						}
						
						NukeFX[i].bShaked = True;
					}
					
					//========================= Ambient Sound ==========================================
					if (bValidAmbSnd && NukeFX[i].AmbSound != None)
					{
						if (NukeFX[i].ShockAmbObj == None)
						{
							NukeFX[i].ShockAmbObj = Spawn(Class'NaliAmbShockSnd',,, camLoc, camRot);
							NukeFX[i].ShockAmbObj.AmbientSound = NukeFX[i].AmbSound;
						}
						else
						{
							NukeFX[i].ShockAmbObj.SetLocation(camLoc);
							NukeFX[i].ShockAmbObj.SetRotation(camRot);
						}
						
						if (NukeFX[i].StartVolume > NukeFX[i].EndVolume)
							vol = Byte(NukeFX[i].EndVolume + (NukeFX[i].StartVolume - NukeFX[i].EndVolume)*(1 - FXScale));
						else
							vol = Byte(NukeFX[i].StartVolume + (NukeFX[i].EndVolume - NukeFX[i].StartVolume)*FXScale);
							
						if (NukeFX[i].StartPitch > NukeFX[i].EndPitch)
							pit = Byte(NukeFX[i].EndPitch + (NukeFX[i].StartPitch - NukeFX[i].EndPitch)*(1 - FXScale));
						else
							pit = Byte(NukeFX[i].StartPitch + (NukeFX[i].EndPitch - NukeFX[i].StartPitch)*FXScale);
						
						if (bMuffled && NukeFX[i].bMuffledAmb)
							vol = vol / 2;
						
						if (shockInterval < 0 && timeInterval < NukeFX[i].NegMinTimeDelay)
							vol = Byte(vol * timeInterval/NukeFX[i].NegMinTimeDelay);
						
						NukeFX[i].ShockAmbObj.SoundVolume = vol;
						NukeFX[i].ShockAmbObj.SoundPitch = pit;
					}
					
					//========================= FOV Affecting ==========================================
					if (bValidFOVAffect && NukeFX[i].bAffectFOV && 
					(((localPlayer.VolumeRadius & 1) == 0 && localPlayer.DefaultFOV == localPlayer.default.DefaultFOV) || NukeFX[i].bFOVAffected))
					{
						if (!bMuffled || !NukeFX[i].bMuffledFOV)
						{
							if ((localPlayer.VolumeRadius & 1) == 0)
							{
								localPlayer.VolumeRadius = localPlayer.VolumeRadius | 1;
								NukeFX[i].bFOVAffected = True;
							}
							
							finalFOV = NukeFX[i].FOVDistortion;
							if (NukeFX[i].FOVDistortionType == FOVC_Linear)
							{
								if (FXScale <= NukeFX[i].FOVRiseFactor)
									finalFOV *= (FXScale / NukeFX[i].FOVRiseFactor);
								else
									finalFOV *= ((1 - FXScale) / (1 - NukeFX[i].FOVRiseFactor));
							}
							else if (NukeFX[i].FOVDistortionType == FOVC_Quadratic)
							{
								if (FXScale <= NukeFX[i].FOVRiseFactor)
									finalFOV *= ((FXScale / NukeFX[i].FOVRiseFactor) ** 2);
								else
									finalFOV *= (((1 - FXScale) / (1 - NukeFX[i].FOVRiseFactor)) ** 2);
							}
							else if (NukeFX[i].FOVDistortionType == FOVC_Trigno)
							{
								if (FXScale <= NukeFX[i].FOVRiseFactor)
									finalFOV *= Sin((FXScale / NukeFX[i].FOVRiseFactor)*Pi/2);
								else
									finalFOV *= Sin(((1 - FXScale) / (1 - NukeFX[i].FOVRiseFactor))*Pi/2);
							}
							else if (NukeFX[i].FOVDistortionType == FOVC_Gaussian)
							{
								if (FXScale <= NukeFX[i].FOVRiseFactor)
									finalFOV *= (EULER**(-(((NukeFX[i].FOVRiseFactor - FXScale) / NukeFX[i].FOVRiseFactor)**2)/GAUSSIAN_C));
								else
									finalFOV *= (EULER**(-(((FXScale - NukeFX[i].FOVRiseFactor) / (1 - NukeFX[i].FOVRiseFactor))**2)/GAUSSIAN_C));
							}
							
							finalFOV *= getFOVFactor(i);
							fxFOV = Min(179, Max(10, localPlayer.default.DefaultFOV + finalFOV));
							localPlayer.DefaultFOV = fxFOV;
							localPlayer.DesiredFOV = fxFOV;
						}
						else if (NukeFX[i].bFOVAffected)
						{
							localPlayer.VolumeRadius = localPlayer.VolumeRadius & 254;
							localPlayer.DefaultFOV = localPlayer.default.DefaultFOV;
							localPlayer.DesiredFOV = localPlayer.DefaultFOV;
							NukeFX[i].bFOVAffected = False;
						}
					}

					
					if (bValid)
					{
						//========================= Play Sound ==========================================
						if (NukeFX[i].HitSound != None && !NukeFX[i].bPlayedSound)
						{
							if (bMuffled && NukeFX[i].bMuffledHit && NukeFX[i].MufHitSound != None)
								sndP = NukeFX[i].MufHitSound;
							else
								sndP = NukeFX[i].HitSound;
							
							//localPlayer.ClientPlaySound(sndP, NukeFX[i].bInterruptOtherSnd);
							PlaySound(sndP, SLOT_None, 32.0, NukeFX[i].bInterruptOtherSnd);
							PlaySound(sndP, SLOT_Interface, 32.0, NukeFX[i].bInterruptOtherSnd);
							PlaySound(sndP, SLOT_Misc, 32.0, NukeFX[i].bInterruptOtherSnd);
							PlaySound(sndP, SLOT_Talk, 32.0, NukeFX[i].bInterruptOtherSnd);
							NukeFX[i].bPlayedSound = True;
						}
						
						//========================= Flash ==========================================
						if (VSize(NukeFX[i].FlashAmount) > 0 && NukeFX[i].FlashScale > 0 && !NukeFX[i].bFlashed && (!bMuffled || !NukeFX[i].bMuffledFlash))
						{
							localPlayer.ClientFlash( NukeFX[i].FlashScale, 1000*NukeFX[i].FlashAmount);
							NukeFX[i].bFlashed = True;
						}
						
						//========================= Spawn FX ==========================================
						if (NukeFX[i].bSpawnFX && !NukeFX[i].bSpawnedFX && (!bMuffled || !NukeFX[i].bMuffledSpawnFX))
						{
							SpawnFX(i, camLoc, camRot);
							NukeFX[i].bSpawnedFX = True;
						}
					}
				}
			}
		}
	}
}

simulated function SpawnFX(byte i, vector Loc, rotator Rot);	//Implement in subclasses for bSpawnFX=True

simulated function float getFOVFactor(byte i)
{
	return 1.f;
}

simulated function ResetFXElement(byte i)
{
	NukeFX[i].bPlayedSound = False;
	NukeFX[i].bFlashed = False;
	NukeFX[i].bSpawnedFX = False;
	
	if (NukeFX[i].ShockAmbObj != None)
	{
		NukeFX[i].ShockAmbObj.Destroy();
		NukeFX[i].ShockAmbObj = None;
	}
	
	if (NukeFX[i].bShaked)
	{
		if (localPlayer != None)
			localPlayer.WalkBob = vect(0,0,0);
		NukeFX[i].bShaked = False;
	}
	
	if (NukeFX[i].bFOVAffected)
	{
		if (localPlayer != None)
		{
			localPlayer.VolumeRadius = localPlayer.VolumeRadius & 254;
			localPlayer.DefaultFOV = localPlayer.default.DefaultFOV;
			localPlayer.DesiredFOV = localPlayer.DefaultFOV;
		}
		
		NukeFX[i].bFOVAffected = False;
	}
}

simulated function Destroyed()
{
local byte i;

	for (i = 0; i < ArrayCount(NukeFX); i++)
		ResetFXElement(i);
	
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Sprite
	Style=STY_Translucent
	bUnlit=True
	Texture=TranslucInvis
	RemoteRole=ROLE_SimulatedProxy
	CollisionHeight=0.000000
	CollisionRadius=0.000000
	Mass=0.000000
	bNetTemporary=False
	LifeSpan=50.000000
	SoundRadius=64
	enableShakeFX=True
	
	bAutoLifeSpan=True
}
