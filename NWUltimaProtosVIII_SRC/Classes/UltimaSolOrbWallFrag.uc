//////////////////////////////////////////////////////////////
//				Feralidragon (15-01-2014)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolOrbWallFrag expands Projectile;

#exec TEXTURE IMPORT NAME=UltimaSolOrbWallFragDefTex FILE=SKINS\UltimaSolOrbWallFragDefTex.bmp GROUP=Skins LODSET=1


var() mesh WallFragMeshes[14];
var() float MinRotRate, MaxRotRate;
var() float MinDScale, MaxDScale;
var() float MinInitSpeed, MaxInitSpeed;
var UltimaSolWFOV OV;
var UltimaSolar UltSCenter;

simulated function PostBeginPlay()
{
	Mesh = WallFragMeshes[Rand(ArrayCount(WallFragMeshes))];
	initRotRate();
	SetTimer(0.1, True);
}

simulated function initWallFrag(UltimaSolar US, vector initDir, optional texture floorTex)
{
	UltSCenter = US;
	Velocity = initDir * RandRange(MinInitSpeed, MaxInitSpeed);
	DrawScale = RandRange(MinDScale, MaxDScale);
	if (floorTex != None)
		MultiSkins[1] = floorTex;
}

simulated function enableACol()
{
	SetCollisionSize(default.CollisionRadius * DrawScale, default.CollisionHeight * DrawScale);
	SetCollision(True, False, False);
}

simulated function disableACol()
{
	SetCollision(False, False, False);
	SetCollisionSize(0.0, 0.0);
}

simulated function HitWall(vector HitNormal, actor HitWall)
{
	initRotRate();
	Velocity = VSize(Velocity) * Normal(HitNormal*5 + VRand()) * 0.5;
}

simulated function Landed(vector HitNormal)
{
	HitWall(HitNormal, None);
}

simulated function Touch(Actor Other)
{
	if (UltimaSolOrbWallFrag(Other) != None)
		processFragHit(UltimaSolOrbWallFrag(Other));
}

simulated function Timer()
{
	if (UltSCenter == None || UltSCenter.bDeleteMe)
	{
		UltSCenter = None;
		Destroy();
		return;
	}
	UltSCenter.processWFragOrb(Self);
}

simulated function initRotRate()
{
	RotationRate.Pitch = int((Rand(2)*2-1)*RandRange(MinRotRate, MaxRotRate));
	RotationRate.Yaw = int((Rand(2)*2-1)*RandRange(MinRotRate, MaxRotRate));
	RotationRate.Roll = int((Rand(2)*2-1)*RandRange(MinRotRate, MaxRotRate));
}

simulated function processFragHit(UltimaSolOrbWallFrag Other);


simulated function Destroyed()
{
	if (OV != None)
		OV.Destroy();
	OV = None;
	Super.Destroyed();
}

simulated function processOverlay(float coef)
{
	if (OV == None)
	{
		OV = Spawn(Class'UltimaSolWFOV', Self);
		OV.Mesh = Mesh;
		OV.DrawScale = DrawScale;
	}
	OV.ScaleGlow = OV.default.ScaleGlow * coef;
	ScaleGlow = (1.f - coef);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=WallFrag01
	bNetTemporary=False
    Physics=PHYS_Falling
    RemoteRole=ROLE_SimulatedProxy
    LifeSpan=15.000000
    CollisionRadius=0.000000
    CollisionHeight=0.000000
    bCollideActors=False
    bBounce=True
    bFixedRotationDir=True
    NetPriority=1.400000
	MultiSkins(1)=UltimaSolOrbWallFragDefTex
	
	MinRotRate=200.000000
	MaxRotRate=6000.000000
	MinDScale=1.250000
	MaxDScale=4.500000
	MinInitSpeed=50.000000
	MaxInitSpeed=150.000000
	
	WallFragMeshes(0)=WallFrag01
	WallFragMeshes(1)=WallFrag02
	WallFragMeshes(2)=WallFrag03
	WallFragMeshes(3)=WallFrag04
	WallFragMeshes(4)=WallFrag05
	WallFragMeshes(5)=WallFrag06
	WallFragMeshes(6)=WallFrag07
	WallFragMeshes(7)=WallFrag08
	WallFragMeshes(8)=WallFrag09
	WallFragMeshes(9)=WallFrag10
	WallFragMeshes(10)=WallFrag11
	WallFragMeshes(11)=WallFrag12
	WallFragMeshes(12)=WallFrag13
	WallFragMeshes(13)=WallFrag14
}
