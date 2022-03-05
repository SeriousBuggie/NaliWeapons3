//////////////////////////////////////////////////////////////
//				Feralidragon (08-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerGndIceAge expands FreezerGndSmallIceAge;

var() sound AppearSnd;

var() float IceCrystRate;
var() float IceCrystMinDist, IceCrystMaxDist, IceCrystMaxHeight;
var() int IceCrystAmountMax;
var() float IceCrystMaxScale, IceCrystMinScale;
var vector lastIceCrystPoints[16], lastIceCrystNormals[16];
var int lastIceCryst;


function PreBeginPlay()
{
	Super.PreBeginPlay();
	
	if (Class'Freezer'.default.OversurrectionLifeTime > 0.0)
		IceAgeTime = Class'Freezer'.default.OversurrectionLifeTime;
	if (Class'Freezer'.default.OversurrectionCrystRate > 0.0)
		IceCrystRate = Class'Freezer'.default.OversurrectionCrystRate;
	if (Class'Freezer'.default.OversurrectionCrystMinDist > 0.0)
		IceCrystMinDist = Class'Freezer'.default.OversurrectionCrystMinDist;
	if (Class'Freezer'.default.OversurrectionCrystMaxDist > 0.0)
		IceCrystMaxDist = Class'Freezer'.default.OversurrectionCrystMaxDist;
	if (Class'Freezer'.default.OversurrectionCrystMaxAmount > 0.0)
		IceCrystAmountMax = Class'Freezer'.default.OversurrectionCrystMaxAmount;
}

simulated function InitIceAge()
{
	Super.InitIceAge();
	DoSound(AppearSnd);
}

function SetScale(float dScale);
simulated function SetupScaling();

simulated function CloneAmbSoundTo(actor A)
{
	if (A == None)
		return;
	A.AmbientSound = AmbientSound;
	A.SoundVolume = SoundVolume;
	A.SoundRadius = SoundRadius;
	A.SoundPitch = SoundPitch;
}

function DoSound(sound Snd)
{
	if (Snd != None)
		PlaySound(Snd,, 100,, 10000);
}

function DoMegaSound(sound Snd)
{
	if (Snd != None)
	{
		PlaySound(Snd, SLOT_None, 100,, 10000);
		PlaySound(Snd, SLOT_Misc, 100,, 10000);
	}
}

simulated function Timer()
{
local int i, locInd;
local vector hLoc, pLoc, pNorm, rLoc, rhLoc, rrLoc;
local vector HitLoc, HitNorm, hHitLoc, hHitNorm;
local actor A, hA;
local float rhMax;

	if (IceAgeState == ISS_Idle)
	{
		Super.Timer();
		SetTimer(1/IceCrystRate, False);
	}
	else if (IceAgeState >= ISS_Pressurizing && IceAgeState <= ISS_IceAging)
	{
		if (Role == ROLE_Authority)
		{
			for (i = 0; i < IceCrystAmountMax; i++)
			{
				//Get origin point and orientation
				locInd = Rand(ArrayCount(lastIceCrystPoints) + 1);
				if (locInd == ArrayCount(lastIceCrystPoints) || lastIceCrystPoints[locInd] == vect(0,0,0))
				{
					pLoc = Location;
					pNorm = vector(Rotation);
				}
				else
				{
					pLoc = lastIceCrystPoints[locInd];
					pNorm = lastIceCrystNormals[locInd];
				}
				
				//Evaluate space
				pLoc += pNorm;
				hLoc = pLoc + IceCrystMaxHeight * pNorm;
				A = Trace(HitLoc, HitNorm, hLoc, pLoc, False);
				if (A != None)
					hLoc = HitLoc + HitNorm;
					
				rLoc = getRandomRadialPosOffset(IceCrystMaxDist, rotator(pNorm), IceCrystMinDist);
				rhMax = Sqrt((IceCrystMaxDist**2) - (VSize(rLoc)**2));
				rrLoc = hLoc + rLoc;
				A = Trace(HitLoc, HitNorm, rrLoc, hLoc, False);
				if (A != None)
					rrLoc = HitLoc + HitNorm;
				
				rhLoc = rrLoc;
				if (FRand() > 0.75)
					rhLoc += (pNorm * rhMax);
				else
					rhLoc -= (pNorm * rhMax);
				hA = Trace(hHitLoc, hHitNorm, rhLoc, rrLoc, False);
				if (hA != None)
				{
					rhLoc = hHitLoc + hHitNorm;
					if (FRand() > 0.35)
					{
						SpawnSmallIceAge(hHitLoc + hHitNorm, hHitNorm, hHitNorm.Z < 0.7);
						lastIceCrystPoints[lastIceCryst % ArrayCount(lastIceCrystPoints)] = hHitLoc;
						lastIceCrystNormals[lastIceCryst % ArrayCount(lastIceCrystNormals)] = hHitNorm;
						lastIceCryst++;
						continue;
					}
				}
					
				//Direct radial approach
				A = Trace(HitLoc, HitNorm, hLoc + Normal((rrLoc + (rhLoc - rrLoc)*FRand()) - hLoc)*IceCrystMaxDist, hLoc, False);
				if (A != None)
				{
					SpawnSmallIceAge(HitLoc + HitNorm, HitNorm, HitNorm.Z < 0.7);
					lastIceCrystPoints[lastIceCryst % ArrayCount(lastIceCrystPoints)] = HitLoc;
					lastIceCrystNormals[lastIceCryst % ArrayCount(lastIceCrystNormals)] = HitNorm;
					lastIceCryst++;
				}
				else if (hA != None)
				{
					SpawnSmallIceAge(hHitLoc + hHitNorm, hHitNorm, hHitNorm.Z < 0.7);
					lastIceCrystPoints[lastIceCryst % ArrayCount(lastIceCrystPoints)] = hHitLoc;
					lastIceCrystNormals[lastIceCryst % ArrayCount(lastIceCrystNormals)] = hHitNorm;
					lastIceCryst++;
				}
			}
		}
		
		SetTimer(1/IceCrystRate, False);
	}
}

function SpawnSmallIceAge(vector Loc, vector Norm, optional bool bHide)
{
local FreezerGndSmallIceAge fgsia;
local rotator R;

	R = rotator(Norm);
	R.Roll = Int(FRand()*65536 - 32768);
	if (bHide)
		fgsia = Spawn(Class'FreezerGndSmallIceAgeHidden',,, Loc, R);
	else
		fgsia = Spawn(Class'FreezerGndSmallIceAge',,, Loc, R);
	fgsia.SetScale(RandRange(IceCrystMinScale, IceCrystMaxScale));
}

simulated function AnimEnd()
{
local rotator R;
local FreezerIceAgeCloudMaster master;

	if (IceAgeState == ISS_Pressurizing)
	{
		IceAgeState = ISS_BreakingThrough;
		PlayAnim('BreakThrough', 1/BreakThroughTime, 0.0);
		SetTimer(1/IceCrystRate, False);
		if (Level.NetMode != NM_DedicatedServer)
			Spawn(Class'FreezerBreakShake');
	}
	else if (IceAgeState == ISS_BreakingThrough)
	{
		IceAgeState = ISS_Exploding;
		PlayAnim('Explode', 1/ExplodeTime, 0.0);
		SetTimer(1/IceCrystRate, False);
		DoMegaSound(ExplodeSnd);
		AmbientSound = None;
		if (Level.NetMode != NM_DedicatedServer)
		{
			Spawn(Class'FreezerGndExplCor');
			FrIceCryst = Spawn(Class'FreezerIceCrystal');
			FrIceCryst.Rise(ExplodeTime);
			Spawn(Class'FreezeIceAgeWallParts');
			
			FrIceGnd = Spawn(Class'FreezerIceGround');
			FrIceGnd.Rise(IceGroundTime);
		}
		CloneAmbSoundTo(FrGndIce);
	}
	else if (IceAgeState == ISS_Exploding)
	{
		IceAgeState = ISS_IceAging;
		TweenAnim('Crater', 0.01);
		SetTimer(1/IceCrystRate, False);
		
		if (FrGndIce != None)
		{
			FrGndIce.MultiSkins[1] = MultiSkins[1];
			FrGndIce.Style = Style;
			FrGndIce.bUnlit = bUnlit;
			FrGndIce.ScaleGlow = ScaleGlow;
		}
		
		if (FrGndIceGlow != None)
			FrGndIceGlow.Destroy();
		if (FrGndSideOV != None)
			FrGndSideOV.Destroy();
		FrGndSideOV = None;
		FrGndIceGlow = None;

		if (Level.NetMode != NM_DedicatedServer)
		{
			R = Rotation;
			R.Roll = Rand(16384)*4;
			master = Spawn(Class'FreezerIceAgeCloudMaster',,,, R);
			Spawn(Class'FreezerIceAgeCloud', master,,, R);
		}
	}
	else if (IceAgeState == ISS_Dying)
	{
		Destroy();
		return;
	}
	tCount = 0.0;
}

defaultproperties
{
	SoundVolume=255
	SoundRadius=255
	SoundPitch=64
	
	IdleTime=2.000000
	DrawScale=2.500000
	PressureTime=1.500000
	BreakThroughTime=0.500000
	ExplodeTime=0.500000
	IceAgeTime=15.000000
	DyingTime=10.000000
	
	AppearSnd=FreezerGndEnter
	
	IceCrystRate=1.250000
	IceCrystAmountMax=4
	IceCrystMinDist=600.000000
	IceCrystMaxDist=2000.000000
	IceCrystMaxHeight=256.000000
	IceCrystMinScale=0.250000
	IceCrystMaxScale=2.500000
	
	IceGroundTime=5.000000
	IceGroundPrepTime=7.000000
	IceGroundFadeOutTime=5.000000
}
