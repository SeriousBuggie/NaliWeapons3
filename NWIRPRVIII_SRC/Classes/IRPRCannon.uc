//////////////////////////////////////////////////////////////
//				Feralidragon (10-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCannon expands IRPRCTurretBase;

#exec MESH IMPORT MESH=IRPRCannon ANIVFILE=MODELS\IRPRCannon_a.3d DATAFILE=MODELS\IRPRCannon_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IRPRCannon STRENGTH=0.0
#exec MESH ORIGIN MESH=IRPRCannon X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=IRPRCannon SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=IRPRCannon SEQ=Opened STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRCannon SEQ=Closed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IRPRCannon SEQ=Opening STARTFRAME=1 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=IRPRCannon SEQ=Closing STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=IRPRCannon MESH=IRPRCannon
#exec MESHMAP SCALE MESHMAP=IRPRCannon X=0.3 Y=0.3 Z=0.6

#exec TEXTURE IMPORT NAME=Sk_IRPRCannon_01 FILE=SKINS\Sk_IRPRCannon_01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPRCannon NUM=1 TEXTURE=Sk_IRPRCannon_01

#exec TEXTURE IMPORT NAME=Sk_IRPRCannon_02 FILE=SKINS\Sk_IRPRCannon_02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IRPRCannon NUM=2 TEXTURE=Sk_IRPRCannon_02

#exec AUDIO IMPORT NAME="IRPRCBoxRotAmb" FILE=SOUNDS\IRPRCBoxRotAmb.wav GROUP="IRPRCBase"
#exec AUDIO IMPORT NAME="IRPRCLaserAmb" FILE=SOUNDS\IRPRCLaserAmb.wav GROUP="IRPRCBase"
#exec AUDIO IMPORT NAME="IRPRCLaserStart" FILE=SOUNDS\IRPRCLaserStart.wav GROUP="IRPRCBase"


var() float CannonHeight, CannonLength;
var() int PitchLimitDown, PitchLimitUp;
var float rotPitch, headRotPitch;
var IRPRCMegaBase IRMB;
var byte curVolume;

var() float PrepareGlowVariance, CTracesGlowVariance;
var() sound PrepareAmbSnd, FireAmbSnd, LaserFireStartSnd;

var IRPRCannonInnerLaser IRCIL1, IRCIL2;
var IRPRCannonOuterMetal IRCOM;
var IRPRCLaserLight IRCLL1, IRCLL2;
var IRPRCLaserFogLight IRCLFL;
var IRPRCLaserLoadLight IRCLLL;
var IRPRCLaserShake IRCLS;
var IRPRCLaserShakePassBy IRCLSBP[16];
var int IRCLSBPCurIndex;
var IRPRCCooldownSmkGen IRPCCSG;
var float prepareTotal, cooldownTotal, firingTotal;
var float prepareCount, cooldownCount, firingCount;
var float IRCOMLastGlow, IRCIL1LastGlow, IRCIL2LastGlow;
var bool isFiring, isPreparingFire;
var IRPRCannonTrace CTraces[128];
var int CTracePointer;
var float lastRotMoveAngDist, globalDelta;
var int tickCycle;

var(FX) float ExplFXMinSize, ExplFXMaxSize;
var(FX) float ExplFXMinGlow, ExplFXMaxGlow;
var(FX) float SmkFXMinRate, SmkFXMaxRate;
var(FX) float DecalFXMinRate, DecalFXMaxRate;
var(FX) float DebrisFXMinRate, DebrisFXMaxRate;
var float smkFXCount, decalFXCount, debrisFXCount;
var int fxTickCycle;


simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	headRotPitch = Rotation.Pitch;
	rotPitch = headRotPitch;
	curVolume = SoundVolume;
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		IRCIL1 = Spawn(Class'IRPRCannonInnerLaser', Self);
		IRCIL1.ScaleGlow = 0.0;
		IRCIL2 = Spawn(Class'IRPRCannonInnerC', Self);
		IRCIL2.ScaleGlow = 0.0;
		IRCOM = Spawn(Class'IRPRCannonOuterMetal', Self);
		IRCOM.ScaleGlow = 0.0;
	}
}

simulated function rotateTo(float hRotYaw, optional float hRotPitch)
{
	Super.rotateTo(hRotYaw, hRotPitch);
	headRotPitch = hRotPitch;
	if (headRotPitch < PitchLimitDown)
		headRotPitch = PitchLimitDown;
	else if (headRotPitch > PitchLimitUp)
		headRotPitch = PitchLimitUp;
	if (Abs(rotPitch - headRotPitch) > 32768)
		rotPitch += (Class'NWUtils'.static.getSign(headRotPitch - rotPitch)*65536);
}

simulated function adjustSyncRot(float hRotYaw, float cRotYaw, optional float hRotPitch, optional float cRotPitch)
{
	Super.adjustSyncRot(hRotYaw, cRotYaw, hRotPitch, cRotPitch);
	headRotPitch = hRotPitch;
	rotPitch = cRotPitch;
	if (headRotPitch < PitchLimitDown)
		headRotPitch = PitchLimitDown;
	else if (headRotPitch > PitchLimitUp)
		headRotPitch = PitchLimitUp;
}

simulated function Tick(float Delta)
{
local rotator R;
local bool isgrt;
local float oldRotPitch, oldRotYaw;
local int i;

	IRCLSBPCurIndex = 0;
	oldRotPitch = rotPitch;
	oldRotYaw = rotYaw;
	if (rotPitch != headRotPitch || rotYaw != headRotYaw)
		SoundVolume = curVolume;
	else
		SoundVolume = 0;

	Super.Tick(Delta);	
	if (rotPitch != headRotPitch)
	{
		isgrt = (headRotPitch > rotPitch);
		rotPitch += (Class'NWUtils'.static.getSign(headRotPitch - rotPitch) * rotAngRate * Delta);
		if ((headRotPitch > rotPitch) != isgrt)
			rotPitch = headRotPitch;
		R = Rotation;
		R.Pitch = int(rotPitch);
		SetRotation(R);
	}
	
	globalDelta = Delta;
	tickCycle++;
	lastRotMoveAngDist = Sqrt(((rotPitch - oldRotPitch)**2) + ((rotYaw - oldRotYaw)**2));
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (prepareCount > 0.0 && prepareTotal > 0.0)
		{
			prepareCount -= Delta;
			if (prepareCount <= 0.0)
				prepareCount = 0.0;
			PreparingFire((prepareTotal-prepareCount)/prepareTotal);
		}
		else if (cooldownCount > 0.0 && cooldownTotal > 0.0)
		{
			cooldownCount -= Delta;
			if (cooldownCount <= 0.0)
			{
				cooldownCount = 0.0;
				if (IRCOM != None)
					IRCOM.ScaleGlow = 0.0;
			}
			CoolingDown(cooldownCount/cooldownTotal);
		}
		else if (isPreparingFire && IRCLLL != None && !IRCLLL.bDeleteMe && IRCLLL.LifeSpan <= IRCLLL.FadeOutTime)
			IRCLLL.LifeSpan += IRCLLL.FadeOutTime;
		else if (isFiring && IRMB != None)
		{
			ResetBeams();
			IRMB.ProcessTraceLaser(Self);
			firingCount += Delta;
			if (IRCOM != None && firingTotal > 0.0)
			{
				IRCOM.ScaleGlow = IRCOM.default.ScaleGlow * firingCount/firingTotal;
				IRCOMLastGlow = IRCOM.ScaleGlow;
			}
		}
		
		
		if (IRCIL1 != None)
		{
			IRCIL1.SetLocation(Location);
			IRCIL1.SetRotation(Rotation);
			IRCIL1.PrePivot = PrePivot;
		}
		if (IRCIL2 != None)
		{
			IRCIL2.SetLocation(Location);
			IRCIL2.SetRotation(Rotation);
			IRCIL2.PrePivot = PrePivot;
		}
		if (IRCOM != None)
		{
			IRCOM.SetLocation(Location);
			IRCOM.SetRotation(Rotation);
			IRCOM.PrePivot = PrePivot;
		}
		
		if (IRCLL1 != None)
		{
			if (!IRCLL1.bDeleteMe)
				IRCLL1.SetLocation(Location + PrePivot + vector(Rotation)*CannonLength);
			else
				IRCLL1 = None;
		}
		if (IRCLL2 != None)
		{
			if (!IRCLL2.bDeleteMe)
				IRCLL2.SetLocation(Location + PrePivot + vector(Rotation)*CannonLength);
			else
				IRCLL2 = None;
		}
		if (IRCLFL != None)
		{
			if (!IRCLFL.bDeleteMe)
				IRCLFL.SetLocation(Location + PrePivot + vector(Rotation)*CannonLength);
			else
				IRCLFL = None;
		}
		if (IRCLLL != None)
		{
			if (!IRCLLL.bDeleteMe)
				IRCLLL.SetLocation(Location + PrePivot + vector(Rotation)*CannonLength);
			else
				IRCLLL = None;
		}
		
		for (i = IRCLSBPCurIndex; i < ArrayCount(IRCLSBP); i++)
		{
			if (IRCLSBP[i] != None)
				IRCLSBP[i].SetShakeDuration(0.0);
			IRCLSBP[i] = None;
		}
	}
}

simulated function OpenCannon(float t)
{
	PlayAnim('Opening', 1/t, 0.0);
}

simulated function CloseCannon(float t)
{
	PlayAnim('Closing', 1/t, 0.0);
	if (IRCLLL != None)
		IRCLLL.Destroy();
	IRCLLL = None;
	if (IRPCCSG != None)
		IRPCCSG.Destroy();
	IRPCCSG = None;
}


simulated function PreparingFire(float ratio)
{
	if (IRCIL1 != None)
	{
		IRCIL1.ScaleGlow = IRCIL1.default.ScaleGlow * ratio;
		IRCIL1.ScaleGlow += (IRCIL1.ScaleGlow * (FRand()*2-1) * PrepareGlowVariance);
		IRCIL1.SoundPitch = Byte(IRCIL1.default.SoundPitch * ratio);
		IRCIL1LastGlow = IRCIL1.ScaleGlow;
	}
	
	if (IRCIL2 != None)
	{
		IRCIL2.ScaleGlow = IRCIL2.default.ScaleGlow * ratio;
		IRCIL2.ScaleGlow += (IRCIL2.ScaleGlow * (FRand()*2-1) * PrepareGlowVariance);
		IRCIL2.SoundPitch = Byte(IRCIL2.default.SoundPitch * ratio);
		IRCIL2LastGlow = IRCIL2.ScaleGlow;
	}
}

simulated function CoolingDown(float ratio)
{
	if (IRCIL1 != None)
	{
		IRCIL1.ScaleGlow = IRCIL1LastGlow * ratio;
		IRCIL1.SoundPitch = Byte(IRCIL1.default.SoundPitch * ratio);
	}
	
	if (IRCIL2 != None)
	{
		IRCIL2.ScaleGlow = IRCIL2LastGlow * ratio;
		IRCIL2.SoundPitch = Byte(IRCIL2.default.SoundPitch * ratio);
	}
	
	if (IRCOM != None)
	{
		IRCOM.ScaleGlow = IRCOMLastGlow * ratio;
		if (IRPCCSG == None && ratio > 0.75 && IRCOM.ScaleGlow > 0.0)
			IRPCCSG = Spawn(Class'IRPRCCooldownSmkGen');
	}
	if (IRPCCSG != None)
	{
		if (ratio < 0.15)
		{
			IRPCCSG.Destroy();
			IRPCCSG = None;
		}
		else
		{
			IRPCCSG.SetLocation(Location + vector(Rotation)*CannonLength);
			IRPCCSG.SmokeDelay = IRPCCSG.default.SmokeDelay / ratio;
		}
	}
				
}


simulated function ClientPrepareFireLaser()
{
	if (isPreparingFire)
		return;
	
	SoundVolume = Byte(default.SoundVolume / 5.f);
	curVolume = SoundVolume;
	isFiring = False;
	isPreparingFire = True;
	if (Level.NetMode != NM_DedicatedServer && IRMB != None)
	{
		prepareTotal = IRMB.LaserPrepareTime;
		prepareCount = prepareTotal;
		if (IRCIL1 != None)
		{
			IRCIL1.AmbientSound = PrepareAmbSnd;
			IRCIL1.SoundPitch = 0;
		}
		if (IRCIL2 != None)
		{
			IRCIL2.AmbientSound = PrepareAmbSnd;
			IRCIL2.SoundPitch = 0;
		}
		
		IRCOMLastGlow = 0.0;
		IRCLLL = Spawn(Class'IRPRCLaserLoadLight');
		IRCLLL.LifeSpan = IRMB.LaserPrepareTime + IRCLLL.FadeOutTime;
		IRCLLL.FadeInTime = IRMB.LaserPrepareTime;
	}
}

simulated function ClientStartFireLaser(float ActiveTime)
{
	isFiring = True;
	isPreparingFire = False;
	SoundVolume = 0;
	curVolume = SoundVolume;
	firingTotal = ActiveTime;
	if (Level.NetMode != NM_DedicatedServer && IRCIL1 != None && IRCIL2 != None)
	{
		IRCIL1.AmbientSound = FireAmbSnd;
		IRCIL1.SoundPitch = Byte(FMin(IRCIL1.default.SoundPitch*2, 255));
		IRCIL2.AmbientSound = FireAmbSnd;
		IRCIL2.SoundPitch = Byte(FMin(IRCIL2.default.SoundPitch*2, 255));
		IRCLL1 = Spawn(Class'IRPRCLaserLight');
		IRCLL1.LifeSpan = ActiveTime + IRCLL1.FadeOutTime;
		IRCLL2 = Spawn(Class'IRPRCLaserLightLine');
		IRCLL2.LifeSpan = ActiveTime + IRCLL2.FadeOutTime;
		IRCLFL = Spawn(Class'IRPRCLaserFogLight');
		IRCLFL.LifeSpan = ActiveTime + IRCLFL.FadeOutTime;
		
		PlayLoudSound(LaserFireStartSnd);
		IRCLS = Spawn(Class'IRPRCLaserShake');
		if (IRMB != None)
			IRCLS.SetShakeDuration(IRMB.ActiveTime);
		Spawn(Class'IRPRCLaserShakeInit');
	}
}

simulated function PlayLoudSound(sound S)
{
	if (S != None)
	{
		PlaySound(S, SLOT_None, 100.0, True, 7500.0);
		PlaySound(S, SLOT_Interface, 100.0, True, 7500.0);
		PlaySound(S, SLOT_Misc, 100.0, True, 7500.0);
		PlaySound(S, SLOT_Talk, 100.0, True, 7500.0);
	}
}

simulated function ClientStopFireLaser()
{
local int i;

	if (!isPreparingFire && !isFiring)
		return;
	
	firingCount = 0.0;
	isFiring = False;
	isPreparingFire = False;
	ResetBeams();
	SoundVolume = default.SoundVolume;
	curVolume = SoundVolume;
	if (Level.NetMode != NM_DedicatedServer && IRMB != None)
	{
		cooldownTotal = IRMB.LaserCooldownTime;
		cooldownCount = cooldownTotal;
		if (IRCIL1 != None)
		{
			IRCIL1.AmbientSound = PrepareAmbSnd;
			IRCIL1.SoundPitch = 0;
		}
		if (IRCIL2 != None)
		{
			IRCIL2.AmbientSound = PrepareAmbSnd;
			IRCIL2.SoundPitch = 0;
		}
	}
	
	if (IRCLL1 != None)
		IRCLL1.LifeSpan = IRCLL1.FadeOutTime;
	if (IRCLL2 != None)
		IRCLL2.LifeSpan = IRCLL2.FadeOutTime;
	if (IRCLFL != None)
		IRCLFL.LifeSpan = IRCLFL.FadeOutTime;
	if (IRCLS != None)
		IRCLS.SetShakeDuration(0.0);
		
	for (i = 0; i < ArrayCount(IRCLSBP); i++)
	{
		if (IRCLSBP[i] != None)
			IRCLSBP[i].SetShakeDuration(0.0);
	}
}

simulated function ResetBeams()
{
local int i;

	CTracePointer = 0;
	for (i = 0; i < ArrayCount(CTraces); i++)
	{
		if (CTraces[i] != None)
		{
			CTraces[i].bHidden = True;
			CTraces[i].ScaleGlow = (CTraces[i].default.ScaleGlow + (FRand()*2-1)*CTraces[i].default.ScaleGlow*CTracesGlowVariance);
		}
	}
}


simulated function ClientProcessOther(Actor Other, vector HitLocation, vector HitNormal, vector StartTrace, optional bool isBackTrace)
{
local float f, sf, tLength, TraceSize, DistLeftover, DistSpawn;
local int NumPoints, n;
local IRPRCLaserExplFX irprLEFX;

	f = (lastRotMoveAngDist / rotAngRate);

	//Explosions
	irprLEFX = Spawn(Class'IRPRCLaserExplFX',,, HitLocation + HitNormal);
	irprLEFX.DrawScale = RandRange(ExplFXMinSize, ExplFXMaxSize);
	irprLEFX.ScaleGlow = RandRange(ExplFXMinGlow, ExplFXMaxGlow);
	
	//Smoke
	if (fxTickCycle != tickCycle)
		smkFXCount += globalDelta;
	if (f > 0)
		sf = 1.f/SmkFXMaxRate;
	else
		sf = 1.f/SmkFXMinRate;
	if (smkFXCount >= sf)
	{
		smkFXCount -= sf;
		Spawn(Class'IRPRCLaserWSmkFX',,, HitLocation + HitNormal);
		Spawn(Class'IRPRCLaserBSmkFX',,, HitLocation + HitNormal);
	}	
	
	//Debris
	if (fxTickCycle != tickCycle)
		debrisFXCount += globalDelta;
	sf = 1.f/(RandRange(DebrisFXMinRate, DebrisFXMaxRate));
	if (debrisFXCount >= sf)
	{
		debrisFXCount -= sf;
		Spawn(Class'IRPRCLaserWallParts',,, HitLocation + HitNormal, rotator(HitNormal));
	}
	
	//Decals
	if (fxTickCycle != tickCycle)
		decalFXCount += globalDelta;
	if (f > 0)
		sf = 1.f/DecalFXMaxRate;
	else
		sf = 1.f/DecalFXMinRate;
	if (decalFXCount >= sf)
	{
		decalFXCount -= sf;
		Spawn(Class'IRPRCLaserDecal',,, HitLocation + HitNormal, rotator(HitNormal));
	}
	
	//Shake
	if (IRCLSBPCurIndex < ArrayCount(IRCLSBP))
	{
		if (IRCLSBP[IRCLSBPCurIndex] == None || IRCLSBP[IRCLSBPCurIndex].bDeleteMe)
		{
			IRCLSBP[IRCLSBPCurIndex] = Spawn(Class'IRPRCLaserShakePassBy');
			if (IRMB != None)
				IRCLSBP[IRCLSBPCurIndex].SetShakeDuration(IRMB.ActiveTime);
		}
		IRCLSBP[IRCLSBPCurIndex].SetLocation(HitLocation + HitNormal);
		IRCLSBP[IRCLSBPCurIndex].CenterLoc = IRCLSBP[IRCLSBPCurIndex].Location;
		IRCLSBPCurIndex++;
	}
	
	
	fxTickCycle = tickCycle;
	if (isBackTrace || CTracePointer >= ArrayCount(CTraces))
		return;
	
	//Laser
	TraceSize = VSize(StartTrace - HitLocation);
	tLength = class'IRPRCannonTrace'.default.TraceLength;
	NumPoints = Int(TraceSize / tLength);
	if ((ArrayCount(CTraces) - CTracePointer) < (NumPoints - 1))
		NumPoints = Abs(ArrayCount(CTraces) - CTracePointer) - 1;
	DistLeftover = TraceSize - (NumPoints * tLength);
	for (n = 0; n <= NumPoints; n++)
	{
		DistSpawn = n * tLength + tLength/2;
		if (n == NumPoints)
			DistSpawn -= ((tLength - DistLeftover)/2);
		if (CTraces[CTracePointer] == None || CTraces[CTracePointer].bDeleteMe)
			CTraces[CTracePointer] = Spawn(Class'IRPRCannonTrace');
		if (CTraces[CTracePointer] != None)
		{
			CTraces[CTracePointer].SetRotation(Rotation);
			CTraces[CTracePointer].SetLocation(StartTrace + DistSpawn*Normal(HitLocation - StartTrace));
			if (n == NumPoints)
				CTraces[CTracePointer].SetupLength(DistLeftover);
			else
				CTraces[CTracePointer].SetupLength(tLength);
			CTraces[CTracePointer].bHidden = False;
		}
		CTracePointer++;
	}
}


simulated function Destroyed()
{
local int i;

	for (i = 0; i < ArrayCount(CTraces); i++)
	{
		if (CTraces[i] != None)
			CTraces[i].Destroy();
		CTraces[i] = None;
	}
	
	for (i = 0; i < ArrayCount(IRCLSBP); i++)
	{
		if (IRCLSBP[i] != None)
			IRCLSBP[i].Destroy();
		IRCLSBP[i] = None;
	}

	if (IRCIL1 != None)
		IRCIL1.Destroy();
	if (IRCIL2 != None)
		IRCIL2.Destroy();
	if (IRCOM != None)
		IRCOM.Destroy();
	if (IRCLL1 != None)
		IRCLL1.Destroy();
	if (IRCLL2 != None)
		IRCLL2.Destroy();
	if (IRCLS != None)
		IRCLS.Destroy();
	if (IRPCCSG != None)
		IRPCCSG.Destroy();
	if (IRCLLL != None)
		IRCLLL.Destroy();
	if (IRCLFL != None)
		IRCLFL.Destroy();
		
	IRCIL1 = None;
	IRCIL2 = None;
	IRCLL1 = None;
	IRCLL2 = None;
	IRCLS = None;
	IRCOM = None;
	IRPCCSG = None;
	IRCLLL = None;
	IRCLFL = None;
	
	Super.Destroyed();
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IRPRCannon
	Texture=IRPRMetal
	AmbientSound=IRPRCBoxRotAmb
	SoundVolume=255
	SoundRadius=192
	SoundPitch=32
	AnimSequence=Closed
	
	CannonHeight=68.000000
	CannonLength=272.000000
	PitchLimitUp=8000
	PitchLimitDown=-6500
	
	PrepareGlowVariance=0.550000
	CTracesGlowVariance=0.700000
	PrepareAmbSnd=IRPRCLaserAmb
	FireAmbSnd=IRPRCLaserAmb
	LaserFireStartSnd=IRPRCLaserStart
	
	ExplFXMinSize=0.500000
	ExplFXMaxSize=1.500000
	ExplFXMinGlow=1.000000
	ExplFXMaxGlow=2.000000
	SmkFXMinRate=2.000000
	SmkFXMaxRate=100.000000
	DecalFXMinRate=1.000000
	DecalFXMaxRate=50.000000
	DebrisFXMinRate=1.000000
	DebrisFXMaxRate=10.000000
}
