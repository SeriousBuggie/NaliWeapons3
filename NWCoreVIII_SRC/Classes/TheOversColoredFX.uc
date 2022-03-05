//////////////////////////////////////////////////////////////
//				Feralidragon (03-05-2013)
//
// NW3 CORE 1.00
//////////////////////////////////////////////////////////////

class TheOversColoredFX expands NaliWEffects
abstract;


var() color FXColor;
var() float FlickerFactorMax, FlickerFactorMin;
var() float ScaleVarianceMax, ScaleVarianceMin;
var() float fadeInTime, fadeOutTime;
var() float scaleInTime, scaleOutTime;
var bool isSlave;

var() bool enableScaling, updateCoordsOnServer, renderOnTop;
var() float DrawScaleStart;
var TheOversColoredFX slaveLayerG, slaveLayerB;

var() texture TextureG, TextureB, MultiSkinsG[8], MultiSkinsB[8];

var() bool enableRot, enableOffset;
var() rotator StartingRot, RRate1, RRate2;
var() vector OffsetStart, OffsetActive, OffsetEnd;
var() float OffsetTimeStart, OffsetTimeEnd;
var() vector MainTPOffset;

var rotator curRot1, curRot2;
var vector curOffset;
var float PawnEyeHeight, BaseDScale, BaseSGlow;


replication
{
	reliable if (Role == ROLE_Authority)
		FXColor;
	unreliable if (Role == ROLE_Authority)
		PawnEyeHeight;
}


simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = 0.0;
	BaseDScale = default.DrawScale;
	BaseSGlow = default.ScaleGlow;
	Super.PostBeginPlay();
}

simulated function Tick(float Delta)
{
local float L, f;
local byte i;
local vector nLoc;
local rotator nRot;
local Pawn P;

	P = Pawn(Owner);
	if (Role == ROLE_Authority && P != None)
		PawnEyeHeight = Pawn(Owner).EyeHeight;

	if (!isSlave && Level.NetMode != NM_DedicatedServer)
	{
		//Position update
		if (P != None)
		{
			nRot = P.Rotation;
			nLoc = P.Location + ((PawnEyeHeight*vect(0,0,1) + P.CollisionRadius*vect(1,0,0) + MainTPOffset) >> nRot);
			UpdateCoords(nLoc + (curOffset >> nRot), rTurn(rTurn(rTurn(nRot, StartingRot), curRot1), curRot2));
		}
		if (DrawType == DT_Mesh)
			UpdateAnim();
	
		//Glow
		L = Default.LifeSpan - LifeSpan;
		f = FRand()*(FlickerFactorMax-FlickerFactorMin) + FlickerFactorMin;
		if (L <= fadeInTime)
			ScaleGlow = L * BaseSGlow / fadeInTime;
		else if (Lifespan <= fadeOutTime)
			ScaleGlow = LifeSpan * BaseSGlow / fadeOutTime;
		else
			ScaleGlow = BaseSGlow;
		ScaleGlow *= f;
		
		//Scaling
		if (enableScaling)
		{
			f = FRand()*(ScaleVarianceMax-ScaleVarianceMin) + ScaleVarianceMin;
			if (L <= scaleInTime)
				DrawScale = L * (BaseDScale - DrawScaleStart) / scaleInTime + DrawScaleStart;
			else if (LifeSpan <= scaleOutTime)
				DrawScale = LifeSpan * (BaseDScale - DrawScaleStart) / scaleOutTime + DrawScaleStart;
			else
				DrawScale = BaseDScale;
			DrawScale *= f;
		}
		
		//Rotation
		if (enableRot)
		{
			curRot1 += (RRate1 * Delta);
			curRot2 += (RRate2 * Delta);
		}
		
		//Offset
		if (enableOffset)
		{
			if (L <= OffsetTimeStart)
				curOffset = L * (OffsetActive - OffsetStart) / OffsetTimeStart + OffsetStart;
			else if (LifeSpan <= OffsetTimeEnd)
				curOffset = LifeSpan * (OffsetActive - OffsetEnd) / OffsetTimeEnd + OffsetEnd;
			else
				curOffset = OffsetActive;
		}
		
		//Color and update slaves
		if (FXColor.G > 0 && slaveLayerG == None)
		{
			slaveLayerG = Spawn(Class, Owner);
			slaveLayerG.isSlave = True;
			slaveLayerG.Texture = TextureG;
			if (DrawType == DT_Mesh)
			{
				for (i = 0; i < ArrayCount(MultiSkins); i++)
					slaveLayerG.MultiSkins[i] = MultiSkinsG[i];
			}
		}
		if (FXColor.B > 0 && slaveLayerB == None)
		{
			slaveLayerB = Spawn(Class, Owner);
			slaveLayerB.isSlave = True;
			slaveLayerB.Texture = TextureB;
			if (DrawType == DT_Mesh)
			{
				for (i = 0; i < ArrayCount(MultiSkins); i++)
					slaveLayerB.MultiSkins[i] = MultiSkinsB[i];
			}
		}
		
		if (slaveLayerG != None)
		{
			slaveLayerG.DrawScale = DrawScale;
			slaveLayerG.ScaleGlow = (FXColor.G/255.f) * Scaleglow;
		}
		if (slaveLayerB != None)
		{
			slaveLayerB.DrawScale = DrawScale;
			slaveLayerB.ScaleGlow = (FXColor.B/255.f) * Scaleglow;
		}
		ScaleGlow *= (FXColor.R/255.f);
	}
}

simulated function rotator rTurn(rotator rBase, rotator rHeadTo)
{
	return Class'NWUtils'.static.rTurn(rBase, rHeadTo);
}

simulated function setColor(color cRGB)
{
	FXColor = cRGB;
}

simulated function renderOnCanvas(canvas Canvas)
{
	if (ScaleGlow > 0.0)
		Canvas.DrawActor(Self, False, renderOnTop);
	if (slaveLayerG != None && !slaveLayerG.bDeleteMe && slaveLayerG.ScaleGlow > 0.0)
		Canvas.DrawActor(slaveLayerG, False, renderOnTop);
	if (slaveLayerB != None && !slaveLayerB.bDeleteMe && slaveLayerB.ScaleGlow > 0.0)
		Canvas.DrawActor(slaveLayerB, False, renderOnTop);
}

simulated function UpdateCoords(vector newLoc, rotator newRot)
{
	if (!updateCoordsOnServer && Level.NetMode == NM_DedicatedServer)
		return;

	if (ScaleGlow > 0.0)
	{
		SetLocation(newLoc);
		SetRotation(newRot);
	}
	if (slaveLayerG != None && !slaveLayerG.bDeleteMe && slaveLayerG.ScaleGlow > 0.0)
	{
		slaveLayerG.SetLocation(newLoc);
		slaveLayerG.SetRotation(newRot);
	}
	if (slaveLayerB != None && !slaveLayerB.bDeleteMe && slaveLayerB.ScaleGlow > 0.0)
	{
		slaveLayerB.SetLocation(newLoc);
		slaveLayerB.SetRotation(newRot);
	}
}

simulated function UpdateAnim()
{
	if (slaveLayerG != None && !slaveLayerG.bDeleteMe && slaveLayerG.ScaleGlow > 0.0)
	{
		slaveLayerG.AnimSequence = AnimSequence;
		slaveLayerG.AnimFrame = AnimFrame;
	}
	if (slaveLayerB != None && !slaveLayerB.bDeleteMe && slaveLayerB.ScaleGlow > 0.0)
	{
		slaveLayerB.AnimSequence = AnimSequence;
		slaveLayerB.AnimFrame = AnimFrame;
	}
}

simulated function Destroyed()
{
	if (slaveLayerG != None)
		slaveLayerG.Destroy();
	if (slaveLayerB != None)
		slaveLayerB.Destroy();
	
	slaveLayerG = None;
	slaveLayerB = None;
	
	Super.Destroyed();
}


defaultproperties
{
    DrawType=DT_Sprite
	bUnlit=True
	LifeSpan=0.000000
	DrawScale=1.000000
	ScaleGlow=2.500000
	Style=STY_Translucent
	bNetTemporary=False
	SpriteProjForward=0.000000
	bAlwaysRelevant=True
	
	FXColor=(R=255,G=0,B=0)
	FlickerFactorMax=1.000000
	FlickerFactorMin=1.000000
	ScaleVarianceMax=1.000000
	ScaleVarianceMin=1.000000
	
	MainTPOffset=(X=6.00000,Z=-3.50000,Y=2.500000)
}
