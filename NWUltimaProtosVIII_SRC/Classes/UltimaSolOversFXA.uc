//////////////////////////////////////////////////////////////
//				Feralidragon (02-02-2014)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolOversFXA expands TheOversColoredFX;

#exec MESH IMPORT MESH=UltimaSolOversFXA ANIVFILE=MODELS\UltimaSolOversFXA_a.3d DATAFILE=MODELS\UltimaSolOversFXA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaSolOversFXA STRENGTH=0
#exec MESH ORIGIN MESH=UltimaSolOversFXA X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UltimaSolOversFXA SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=UltimaSolOversFXA SEQ=Fluid STARTFRAME=0 NUMFRAMES=20 RATE=19.0

#exec MESHMAP NEW MESHMAP=UltimaSolOversFXA MESH=UltimaSolOversFXA
#exec MESHMAP SCALE MESHMAP=UltimaSolOversFXA X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=UltimaSolOversLava FILE=Effects\UltimaSolOversLava.bmp GROUP=Effects


var() bool bSpawnFlr;
var() int FlrFXMin, FlrFXMax;
var() float FlrFXMinSpeed, FlrFXMaxSpeed;
var() float FlrFXMinScale, FlrFXMaxScale;
var() float FlrFXRate;

var() int DebFXMin, DebFXMax;
var() float DebFXMinSpeed, DebFXMaxSpeed;
var() float DebFXMinScale, DebFXMaxScale;
var() float DebFXMinRadius, DebFXMaxRadius;

var UltimaSolOversFXC FlrFXList;
var UltimaSolOversFXE DebFXList;
var float FlrFXCount;

simulated function PostBeginPlay()
{
	LoopAnim('Fluid', 5.0);
	SpawnDebFX();
	Super.PostBeginPlay();
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && bSpawnFlr)
	{
		FlrFXCount += Delta;
		if (FlrFXCount >= (1/FlrFXRate))
		{
			FlrFXCount = 0;
			SpawnFlrFX();
		}
	}
	Super.Tick(Delta);
}

simulated function SpawnFlrFX()
{
local int i, n;
local UltimaSolOversFXC USOFX;

	n = int(RandRange(FlrFXMin, FlrFXMax));
	for (i = 0; i < n; i++)
	{
		USOFX = Spawn(Class'UltimaSolOversFXC');
		if (USOFX != None)
		{
			USOFX.FXMaster = Self;
			if (FlrFXList != None)
			{
				USOFX.NextFX = FlrFXList;
				FlrFXList.PrevFX = USOFX;
			}
			FlrFXList = USOFX;
			USOFX.Vel = VRand()*RandRange(FlrFXMinSpeed, FlrFXMaxSpeed);
			USOFX.DrawScale = RandRange(FlrFXMinScale, FlrFXMaxScale);
		}
	}
}

simulated function SpawnDebFX()
{
local int i, n;
local UltimaSolOversFXE USOFX;

	n = int(RandRange(DebFXMin, DebFXMax));
	for (i = 0; i < n; i++)
	{
		USOFX = Spawn(Class'UltimaSolOversFXE',,, Location + VRand()*RandRange(DebFXMinRadius, DebFXMaxRadius));
		if (USOFX != None)
		{
			USOFX.initOversFXE(Self, RandRange(DebFXMinScale, DebFXMaxScale), FRand()*65536.f, RandRange(DebFXMinSpeed, DebFXMaxSpeed), RotRand(True)/8);
			if (DebFXList != None)
			{
				USOFX.NextFX = DebFXList;
				DebFXList.PrevFX = USOFX;
			}
			DebFXList = USOFX;
		}
	}
}

simulated function UpdateCoords(vector newLoc, rotator newRot)
{
	if (DebFXList != None)
		DebFXList.UpdateCoords(newLoc, newRot);
	if (FlrFXList != None)
		FlrFXList.UpdateCoords(newLoc, newRot);
	Super.UpdateCoords(newLoc, newRot);
}

simulated function renderOnCanvas(canvas Canvas)
{
	if (DebFXList != None)
		DebFXList.renderOnCanvas(Canvas);
	if (FlrFXList != None)
		FlrFXList.renderOnCanvas(Canvas);
	Super.renderOnCanvas(Canvas);
}

simulated function Destroyed()
{
	if (FlrFXList != None)
		FlrFXList.SetDestroy();
	FlrFXList = None;
	
	if (DebFXList != None)
		DebFXList.SetDestroy();
	DebFXList = None;
	
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=UltimaSolOversFXA
	bUnlit=True
	MultiSkins(1)=UltimaSolOversLava
	Style=STY_Normal
	
	renderOnTop=False
	DrawScale=0.075000
	ScaleGlow=2.000000
	LifeSpan=6.000000

	fadeInTime=0.000000
	fadeOutTime=0.000000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=0)
	RRate1=(Pitch=0)
	RRate2=(Yaw=7000)
	
	bSpawnFlr=True
	FlrFXMin=8
	FlrFXMax=16
	FlrFXMinSpeed=2.000000
	FlrFXMaxSpeed=6.000000
	FlrFXMinScale=0.015000
	FlrFXMaxScale=0.085000
	FlrFXRate=10.000000
	
	DebFXMin=30
	DebFXMax=60
	DebFXMinSpeed=100.000000
	DebFXMaxSpeed=16000.000000
	DebFXMinScale=0.700000
	DebFXMaxScale=3.000000
	DebFXMinRadius=2.000000
	DebFXMaxRadius=7.000000
}
