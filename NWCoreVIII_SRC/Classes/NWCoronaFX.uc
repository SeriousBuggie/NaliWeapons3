//////////////////////////////////////////////////////////////
//	Nali Weapons III Dynamic Corona/LensFlare
//				Feralidragon (14-06-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWCoronaFX expands NaliWActor config(NWConfig)
abstract;

var() float MaxDistance;			//Max distance where the corona is visible
var() float StartScaleTime, EndScaleTime;	//Time to scale up and down effect
var() float FadeInTime, FadeOutTime;		//Time to fade in and out effect
var() float EndScaleCoef, StartScaleCoef; 	//Scaling multiplier when appearing or dying
var() texture CoronaSprite;			//Corona texture
var() float MaxCoronaSize, MinCoronaSize;	//Corona scales
var() float CGlow;				//Corona scaleglow

const MovementDifMin = 0.000500;
const MovementDifMax = 0.004500;
const ProjOffset = 1.000000;
const MAPLIMIT = 65536.000000;

var(LensFlare) bool enableLensFlare;
var(LensFlare) float BackHeadTrace;
var(LensFlare) float TransitionDiv;
var(LensFlare) bool bFadeOutOnView;
var(LensFlare) bool bFixedOverAbsRayLength;
var(LensFlare) float AbsRayLength;	//Only applyable if bFixedOverAbsLength=True
struct NWLensFlare
{
	var() bool bEnableLens;
	var() float DistanceCoefCutOff;	//Cutting distance coeficient
	var() texture LensSprite;
	var() float MaxLensSize, MinLensSize;
	var() bool bAffectByCorona;
	var() float LensGlow;
	var actor LensA;
};

var(LensFlare) NWLensFlare LensFlareParts[16];

var(ClientConfig) globalconfig bool bCoronasCollisionDetail;
var() bool bForceNoColDetail, bForceColDetail;

//Dynamic corona settings
var() float CGlowMax, CGlowMin;
var() float DScaleCoefMax, DScaleCoefMin;

//Colored corona settings
var(ColorChannel) bool bColoredCorona;
var(ColorChannel) color CorColor;
var(ColorChannel) texture CTGreen, CTBlue;
var NWLensFlareObj CTG, CTB;

//internal
var PlayerPawn localPlayer;
var float CountA, CountB;
var bool bVisible;

var NWCorUpdaterFX localUpdater;
var Actor localViewTarget;
var float updateDelta;
var vector PosOffset;


simulated function PostBeginPlay()
{
local PlayerPawn PP;
local byte i;
	
	Texture = CoronaSprite;
	ScaleGlow = CGlow;
	bCoronasCollisionDetail = ((bCoronasCollisionDetail || bForceColDetail) && !bForceNoColDetail);
	
	if (Level.NetMode != NM_DedicatedServer) 
	{
		foreach AllActors(class'PlayerPawn', PP)
		{
			if (Viewport(PP.Player) != None)
			{
				localPlayer = PP;
				break;
			}
		}
		
		if (enableLensFlare)
		{
			for (i = 0; i < ArrayCount(LensFlareParts); i++)
			{
				if (LensFlareParts[i].bEnableLens)
				{
					if (Owner != None)
						LensFlareParts[i].LensA = Spawn(Class'NWLensFlareObj', Owner);
					else
						LensFlareParts[i].LensA = Spawn(Class'NWLensFlareObj', Self);
					LensFlareParts[i].LensA.Texture = LensFlareParts[i].LensSprite;
					LensFlareParts[i].LensA.ScaleGlow = LensFlareParts[i].LensGlow;
					
					if (LensFlareParts[i].DistanceCoefCutOff > 1.0)
						LensFlareParts[i].DistanceCoefCutOff = 1.0;
					else if (LensFlareParts[i].DistanceCoefCutOff < -1.0)
						LensFlareParts[i].DistanceCoefCutOff = -1.0;
				}
			}
		}
		
		if (bColoredCorona)
			SetColor(CorColor);
	}
	
	SetTimer(0.1, True);
	Timer();
}

simulated function SetColor(color cRGB)
{
local Actor CTOwner;

	bColoredCorona = True;
	CorColor = cRGB;
	if (Owner != None)
		CTOwner = Owner;
	else
		CTOwner = Self;
	
	if (CorColor.G > 0 && CTG == None && CTGreen != None)
	{
		CTG = Spawn(Class'NWLensFlareObj', CTOwner);
		CTG.Texture = CTGreen;
	}
	if (CorColor.B > 0 && CTB == None && CTBlue != None)
	{
		CTB = Spawn(Class'NWLensFlareObj', CTOwner);
		CTB.Texture = CTBlue;
	}
}

simulated function UpdateColor()
{
local Actor CTOwner;
local vector rLoc;

	if (!bColoredCorona)
		return;
		
	rLoc = getRealLocation();
	if (CTG != None)
	{
		CTG.ScaleGlow = (ScaleGlow * CorColor.G / 255.f);
		CTG.DrawScale = DrawScale;
		CTG.SpriteProjForward = SpriteProjForward;
		CTG.bHidden = bHidden;
		CTG.SetLocation(rLoc);
	}
	
	if (CTB != None)
	{
		CTB.ScaleGlow = (ScaleGlow * CorColor.B / 255.f);
		CTB.DrawScale = DrawScale;
		CTB.SpriteProjForward = SpriteProjForward;
		CTB.bHidden = bHidden;
		CTB.SetLocation(rLoc);
	}

	ScaleGlow *= (CorColor.R / 255.f);
}

simulated function vector getRealLocation()
{
	if (Physics == PHYS_Trailer && Owner != None)
	{
		if (bTrailerPrePivot && VSize(PrePivot) > 0)
			return (Owner.Location + PrePivot);
		else if (Mass != 0.0)
			return (Owner.Location + ((Mass*vect(-1,0,0)) >> Owner.Rotation));
	}
	return Location;
}

simulated function Timer()
{
local Actor A;
local vector HitLoc, HitNorm;
local vector camLoc;
local rotator camRot;
local Actor camActor;

	if (Level.NetMode != NM_DedicatedServer && localPlayer != None)
	{
		localPlayer.PlayerCalcView( camActor, camLoc, camRot);

		if (!bCoronasCollisionDetail)
			bVisible = FastTrace(camLoc, getRealLocation());
		else
		{
			bVisible = True;
			ForEach TraceActors(Class'Actor', A, HitLoc, HitNorm, camLoc, getRealLocation())
			{
				if (((A == Level) || (A.bBlockActors)) && A != localPlayer)
				{
					bVisible = False;
					break;
				}
			}
		}
	}
}


simulated function Tick(float DeltaTime)
{
local float SizeCoef, SizeDelta, dotRotView, curMovDif;
local vector VectorREF, VectorDELTA;
local float VLineMax, VLine;
local vector camLoc;
local rotator camRot;
local Actor camActor;
local vector realLoc;
local byte i;

	if (Level.NetMode != NM_DedicatedServer && localPlayer != None)
	{	
		//If has an updater
		if (localUpdater != None && DeltaTime != 0.5)
		{
			updateDelta = DeltaTime;
			return;
		}
		else if (DeltaTime == 0.5)
			DeltaTime = updateDelta;
		
		realLoc = getRealLocation();
		
		//Check ViewTarget for "no-lag" updates
		if ((localPlayer.ViewTarget != None || Physics == PHYS_Trailer || OldLocation != Location) && localUpdater == None)
		{
			if (localViewTarget == None)
				localViewTarget = localPlayer.ViewTarget;
			localUpdater = Spawn(Class'NWCorUpdaterFX');
			localUpdater.CorToUpdate = Self;
		}
		else if (localPlayer.ViewTarget != None && localViewTarget != localPlayer.ViewTarget && localUpdater != None)
		{
			localViewTarget = localPlayer.ViewTarget;
			localUpdater.Destroy();
			localUpdater = Spawn(Class'NWCorUpdaterFX');
			localUpdater.CorToUpdate = Self;
		}
		else if (localPlayer.ViewTarget == None && Physics != PHYS_Trailer && OldLocation == Location && localUpdater != None)
		{
			localViewTarget = None;
			localUpdater.Destroy();
			localUpdater = None;
		}
		
		localPlayer.PlayerCalcView( camActor, camLoc, camRot);

		VectorREF = Normal(realLoc - camLoc);
		VectorDELTA = vector(camRot);
		SizeCoef = VSize(camLoc - realLoc);
		
		SizeDelta = Abs(MaxCoronaSize - MinCoronaSize);
		DrawScale = Abs(MinCoronaSize) + (SizeCoef * SizeDelta / MaxDistance);
		
		//Fading and scaling effects control
		if (FadeInTime > 0 && CountA <= FadeInTime)
		{
			CountA += DeltaTime;
			ScaleGlow = CountA * CGlow / FadeInTime;
		}

		if (StartScaleTime > 0 && CountB <= StartScaleTime)
		{
			CountB += DeltaTime;
			DrawScale *= (CountB * StartScaleCoef / StartScaleTime);
		}

		if (LifeSpan > 0)
		{
			if (FadeOutTime > 0 && LifeSpan <= FadeOutTime)
				ScaleGlow = LifeSpan * CGlow / FadeOutTime;
			if (EndScaleTime > 0 && LifeSpan <= EndScaleTime)
				DrawScale *= (LifeSpan * EndScaleCoef / EndScaleTime);
		}
		else
		{
			if (CGlow > 0 && CGlowMax > 0 && CGlowMin > 0 && CGlowMax >= CGlowMin)
				ScaleGlow = FRand()*(CGlowMax-CGlowMin) + CGlowMin;
			if (DScaleCoefMax > 0 && DScaleCoefMin > 0 && DScaleCoefMax > DScaleCoefMin)
				DrawScale *= (FRand()*(DScaleCoefMax-DScaleCoefMin) + DScaleCoefMin);
		}
		
		bHidden = !bVisible || (SizeCoef > MaxDistance);
		
		if (!bHidden)
		{
			curMovDif = (MAPLIMIT - SizeCoef)*(MovementDifMax-MovementDifMin)/MAPLIMIT + MovementDifMin;
			dotRotView = (VectorREF dot VectorDELTA) - curMovDif;
			SizeCoef *= dotRotView;
			SpriteProjForward = FMax(0, SizeCoef - ProjOffset);
		}
		
		UpdateColor();
		
		//Update lensflares in case they are on here
		if (enableLensFlare)
		{
			for (i = 0; i < ArrayCount(LensFlareParts); i++)
			{
				if (LensFlareParts[i].LensA != None)
					UpdateLensFlare(i);
			}
		}
	}
}

simulated function UpdateLensFlare( byte i)
{
local float SizeCoef, SizeDelta, dotRotView, curMovDif;
local vector VectorREF, VectorDELTA;
local float VLineMax, VLine, PDist;
local vector camLoc;
local rotator camRot;
local Actor camActor;
local vector BackPoint, LensLoc;
local vector realLoc;
local float directViewCoef, fixedRaySize;


	if (Level.NetMode != NM_DedicatedServer && localPlayer != None && LensFlareParts[i].LensA != None)
		LensFlareParts[i].LensA.bHidden = bHidden;

	if (bHidden)
		return;

	if (Level.NetMode != NM_DedicatedServer && localPlayer != None && LensFlareParts[i].LensA != None)
	{
		localPlayer.PlayerCalcView( camActor, camLoc, camRot);
		realLoc = getRealLocation();
		
		directViewCoef = (Normal(realLoc - camLoc) dot vector(camRot));
		if (directViewCoef < 0)
			directViewCoef = 0;
		
		//LensFlare Calculation
		if (VSize(camLoc - realLoc) > BackHeadTrace)
			BackPoint.X = BackHeadTrace;
		else
			BackPoint.X = VSize(camLoc - realLoc);
		BackPoint = camLoc + (BackPoint >> camRot);
		if (bFixedOverAbsRayLength && VSize(camLoc - realLoc) > AbsRayLength)
		{
			fixedRaySize = VSize(camLoc - realLoc) - AbsRayLength;
			if (TransitionDiv > 0)
				PDist = AbsRayLength * (LensFlareParts[i].DistanceCoefCutOff + Abs(directViewCoef - 1)/TransitionDiv);
			else
				PDist = AbsRayLength * LensFlareParts[i].DistanceCoefCutOff;
			PDist += fixedRaySize;
		}
		else
		{
			if (TransitionDiv > 0)
				PDist = VSize(camLoc - realLoc) * (LensFlareParts[i].DistanceCoefCutOff + Abs(directViewCoef - 1)/TransitionDiv);
			else
				PDist = VSize(camLoc - realLoc) * LensFlareParts[i].DistanceCoefCutOff;
		}

		/*LensFlareParts[i].LensA.PrePivot = PDist * Normal(BackPoint - Location);
		LensLoc = LensFlareParts[i].LensA.PrePivot + Location;*/
		
		LensFlareParts[i].LensA.SetLocation(realLoc + PDist * Normal(BackPoint - realLoc));
		LensLoc = LensFlareParts[i].LensA.Location;
		
		//Distance>Size control + MaxDistance control + corona effect
		VectorREF = Normal(LensLoc - camLoc);
		VectorDELTA = vector(camRot);
		SizeCoef = VSize(camLoc - LensLoc);
		
		SizeDelta = Abs(LensFlareParts[i].MaxLensSize - LensFlareParts[i].MinLensSize);
		LensFlareParts[i].LensA.DrawScale = Abs(LensFlareParts[i].MinLensSize) + (SizeCoef * SizeDelta / MaxDistance);

		curMovDif = (MAPLIMIT - SizeCoef)*(MovementDifMax-MovementDifMin)/MAPLIMIT + MovementDifMin;
		dotRotView = (VectorREF dot VectorDELTA) - curMovDif;
		SizeCoef *= dotRotView;
		LensFlareParts[i].LensA.SpriteProjForward = FMax(0, SizeCoef - ProjOffset);

		if (LensFlareParts[i].bAffectByCorona)
			LensFlareParts[i].LensA.ScaleGlow = ScaleGlow * LensFlareParts[i].LensGlow / CGlow;
		
		if (bFadeOutOnView)
			LensFlareParts[i].LensA.ScaleGlow *= directViewCoef;
	}
}

simulated function Destroyed()
{
local byte i;

	if (enableLensFlare)
	{
		for (i = 0; i < ArrayCount(LensFlareParts); i++)
		{
			if (LensFlareParts[i].LensA != None)
				LensFlareParts[i].LensA.Destroy();
			LensFlareParts[i].LensA = None;
		}
	}
	
	if (localUpdater != None)
		localUpdater.Destroy();
	localUpdater = None;
	
	if (CTG != None)
		CTG.Destroy();
	CTG = None;
	
	if (CTB != None)
		CTB.Destroy();
	CTB = None;
	
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
	MaxDistance=4000.000000
	LifeSpan=8.000000
	StartScaleTime=0.000000
	EndScaleTime=0.000000
	FadeInTime=1.000000
	FadeOutTime=1.000000
	EndScaleCoef=1.000000
	StartScaleCoef=1.000000
	CoronaSprite=None
	MaxCoronaSize=5.000000
	MinCoronaSize=1.000000
	CGlow=1.500000
	bNetTemporary=True
	bFadeOutOnView=True
	BackHeadTrace=128.000000
	TransitionDiv=8.000000
}
