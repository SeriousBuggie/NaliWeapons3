//////////////////////////////////////////////////////////////
//				Feralidragon (30-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWCordNodePiece expands NWBodyPiece
abstract;

var() int MinNodes, MaxNodes;
var() float MinSegmentLength, MaxSegmentLength;
var() class<NWCordSegm> NWCordSegmClass, NWCordSegmStartClass, NWCordSegmEndClass;
var() bool bScaleAffectMass;

var bool bMasterNode;
var int nodesAmount;
var vector lastLoc;
var float segLength;
var vector curVelocity;
var int solveIterations;
var int ndIndex;

var NWCordSegm NodeSegm;
var NWCordNodePiece NextPiece, MasterPiece;
var NWCordAttachment NodeAttach;
var float globalDelta;


simulated function PostBeginPlay()
{
	lastLoc = Location;	
	Super.PostBeginPlay();
	SetPhysics(PHYS_None);
	SetCollision(Class'NWBloodyMess'.default.bCordCollideWithActors);
}

simulated function SetLifeSpan()
{
	if (bMasterNode)
		Super.SetLifeSpan();
}

simulated function setVelocity(vector newVel, optional float Delta)
{
	if (Delta > 0.0)
		lastLoc = (Location - newVel*Delta);
}

simulated function vector getVelocity(optional float Delta)
{
	if (Delta > 0.0)
		return ((Location - lastLoc) / Delta);
	return vect(0,0,0);
}

simulated function InitSize(float nScale)
{
	if (nScale <= 0.0)
		return;
	
	Super.InitSize(nScale);
	if (bMasterNode)
		segLength *= nScale;
	if (bScaleAffectMass)
		Mass = default.Mass * nScale;
}

simulated function InitMasterNode(optional vector vel, optional float timeSinceLastFrame, optional float nScale)
{
local int i;
local NWCordNodePiece nwCNP, oCNP;
local vector dir;


	bMasterNode = True;
	MasterPiece = Self;
	SetLifeSpan();
	nodesAmount = Rand(MaxNodes - MinNodes) + MinNodes;
	segLength = FRand()*(MaxSegmentLength - MinSegmentLength) + MinSegmentLength;
	solveIterations = Min(nodesAmount, Class'NWBloodyMess'.default.MaxCordIterations);
	oCNP = Self;
	if (timeSinceLastFrame > 0.0)
		setVelocity(vel, timeSinceLastFrame);
		
	if (nScale > 0.0)
		InitSize(nScale);
	
	for (i = 1; i <= nodesAmount; i++)
	{
		dir = oCNP.getSpawnDir(vector(oCNP.Rotation));
		nwCNP = Spawn(Class,,, oCNP.Location + dir*segLength, rotator(dir));
		if (nwCNP == None)
			break;
		nwCNP.InitSlaveNode(Self, segLength, i, nScale);
		oCNP.NextPiece = nwCNP;
		oCNP = nwCNP;
	}
	
	SpawnSegments();
	UpdateSegments();
	AddAttachments(0);
	InitNode(0);
}

simulated function vector getSpawnDir(vector curDir)
{
	return Normal(curDir);
}

simulated function InitSlaveNode(NWCordNodePiece pieceMaster, float sLength, optional int nIndex, optional float nScale)
{
	segLength = sLength;
	ndIndex = nIndex;
	MasterPiece = pieceMaster;
	lastLoc -= (pieceMaster.Location - pieceMaster.lastLoc);
	if (nScale > 0.0)
		InitSize(nScale);
	
	AddAttachments(nIndex);
	InitNode(nIndex);
}

simulated function InitNode(int index); //To implement on subclasses

simulated function AddAttachments(int index); //To implement on subclasses

simulated function SetGoreType(class<NWGoreCBoard> newGoreBoardClass)
{
	Super.SetGoreType(newGoreBoardClass);
	if (NodeSegm != None)
		NodeSegm.SetGoreType(newGoreBoardClass);
	if (NodeAttach != None)
		NodeAttach.SetGoreType(newGoreBoardClass);
	if (NextPiece != None)
		NextPiece.SetGoreType(newGoreBoardClass);
}

simulated function NWCordAttachment AddAttachment(class<NWCordAttachment> AttachClass)
{
local NWCordAttachment newAttach;

	if (AttachClass == None)
		return None;
	newAttach = Spawn(AttachClass);
	newAttach.NextAttachment = NodeAttach;
	newAttach.SetScale(fxScale);
	NodeAttach = newAttach;
	Mass += newAttach.Mass;
	return newAttach;
}

simulated function SpawnSegments()
{
	if (NWCordSegmClass != None && NextPiece != None)
	{
		if (bMasterNode && NWCordSegmStartClass != None)
			NodeSegm = Spawn(NWCordSegmStartClass);
		else if (NextPiece.NextPiece == None && NWCordSegmEndClass != None)
			NodeSegm = Spawn(NWCordSegmEndClass);
		else	
			NodeSegm = Spawn(NWCordSegmClass);
		NodeSegm.SetScale(fxScale);
		NextPiece.SpawnSegments();
	}
}

simulated function UpdateSegments()
{
	if (NodeSegm != None && NextPiece != None)
	{
		NodeSegm.UpdateSeg(Location, NextPiece.Location);
		NextPiece.UpdateSegments();
	}
}

simulated function Tick(float Delta)
{
local int i;

	globalDelta = Delta;
	if (Physics != PHYS_None)
		SetPhysics(PHYS_None);
	Super.Tick(Delta);
		
	if (bMasterNode)
	{
		UpdateAccel(Delta);
		for (i = 0; i < solveIterations; i++)
			UpdateConstraints();
		UpdateSegments();
	}
	
	if (NodeAttach != None)
		NodeAttach.UpdatePos(Location, Rotation);
}

simulated function UpdateAccel(float Delta)
{
local vector curLoc, gForce, vForce, fForce;
local float fFriction, gFriction;
local vector HitN, HitLoc;
local Actor A;

	curLoc = Location;
	if (bPhysForceUpt)
	{
		fFriction = 0.0;
		if (Region.Zone.bWaterZone)
			fFriction = FClamp(Region.Zone.ZoneFluidFriction/10, 0.0, 1.0);
		gFriction = FClamp(Region.Zone.ZoneGroundFriction/10, 0.0, 1.0);
		
		gForce = Region.Zone.ZoneGravity * Mass * Delta * Delta;
		vForce = Region.Zone.ZoneVelocity * Delta;
		fForce = (Location - lastLoc) + gForce + vForce;
		fForce -= (fFriction * fForce);
		A = Trace(HitLoc, HitN, Location + fForce + Normal(fForce)*(5.f + FMax(CollisionRadius, CollisionHeight)), Location, False);
		if (A != None)
			fForce -= (gFriction * fForce);
		MoveSmooth(fForce);
		if (A != None)
			SetWall(HitN, A, Delta);
		lastLoc = curLoc;
	}
	
	if (NextPiece != None)
		NextPiece.UpdateAccel(Delta);
}

simulated function UpdateSlidingPhysics(float Delta)
{
local vector curLoc;

	curLoc = Location;
	Super.UpdateSlidingPhysics(Delta);
	lastLoc = curLoc;
}

simulated function UpdateConstraints(optional NWCordNodePiece prevPiece, optional NWCordNodePiece antePrevPiece)
{
local float dist;
local vector vD, moveVel;

	if (prevPiece != None)
	{
		vD = (Location - prevPiece.Location);
		dist = VSize(vD);
		moveVel = vD / dist / 2 * (dist - segLength);
		if (prevPiece.bPhysForceUpt || prevPiece.bSlidingDown)
			prevPiece.MoveSmooth(moveVel);
		if (bPhysForceUpt || bSlidingDown)
			MoveSmooth(-moveVel);
	}
	
	if (NextPiece != None)
		NextPiece.UpdateConstraints(Self, prevPiece);
}

simulated function Destroyed()
{
	if (NextPiece != None)
		NextPiece.Destroy();
	NextPiece = None;
	
	if (NodeSegm != None)
		NodeSegm.Destroy();
	NodeSegm = None;
	
	if (NodeAttach != None)
		NodeAttach.Destroy();
	NodeAttach = None;
	
	Super.Destroyed();
}

simulated singular function HitWall(vector HitNormal, actor Wall)
{
	if (NextPiece != None && NextPiece.NextPiece != None)
		SetWall(HitNormal, Wall, globalDelta);
}

simulated singular function Landed(vector HitNormal)
{
	if (NextPiece != None && NextPiece.NextPiece != None)
		SetWall(HitNormal, None, globalDelta);
}

simulated singular function Touch(Actor Other)
{
	if (Other != None && (NWCordNodePiece(Other) == None || NWCordNodePiece(Other).MasterPiece != MasterPiece))
		lastLoc += (Other.Location - Other.OldLocation);
}

simulated function SpawnWaterFX(byte splashType, float ringSize, bool inWater, ZoneInfo WZone)
{
	Class'NWUtils'.static.SpawnWaterSplash(Self, splashType, inWater, WZone, ringSize,, Location, lastLoc);
}


defaultproperties
{
	Style=STY_Translucent
	MultiSkins(0)=TranslucInvis
	MultiSkins(1)=TranslucInvis
	MultiSkins(2)=TranslucInvis
	MultiSkins(3)=TranslucInvis
	MultiSkins(4)=TranslucInvis
	MultiSkins(5)=TranslucInvis
	MultiSkins(6)=TranslucInvis
	MultiSkins(7)=TranslucInvis
	Texture=TranslucInvis
	Skin=TranslucInvis
	LODBias=0.250000
	DrawScale=0.001000
	
	WallHitStopCoef=0.750000
	WallHitStopSpeed=25.000000
	
	LifeSpan=0.000000
	Mass=1.000000
	bOwnPhysics=True
	Physics=PHYS_None
}
