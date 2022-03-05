//////////////////////////////////////////////////////////////
//				Feralidragon (24-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanOversFXB expands TheOversColoredFX;

var() Mesh RndMesh[4];
var VulcanOversFXC vGlow;
var vector startActiveOffset;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		Mesh = RndMesh[Rand(ArrayCount(RndMesh))];
		vGlow = Spawn(Class'VulcanOversFXC');
		startActiveOffset = VSize(OffsetActive) * VRand() * vect(1,1,0.065);
		RRate2.Yaw = int(RRate2.Yaw * (FRand()*2-1));
		RRate2.Roll = int(RRate2.Roll * (FRand()*2-1));
	}
	Super.PostBeginPlay();
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		OffsetActive = (startActiveOffset >> curRot2);
	Super.Tick(Delta);
}

simulated function UpdateCoords(vector newLoc, rotator newRot)
{
	Super.UpdateCoords(newLoc, newRot);
	if (vGlow != None)
		vGlow.UpdateCoords(newLoc, newRot);
}

simulated function renderOnCanvas(canvas Canvas)
{
	Super.renderOnCanvas(Canvas);
	if (vGlow != None)
		vGlow.renderOnCanvas(Canvas);
}

simulated function Destroyed()
{
	if (vGlow != None)
		vGlow.Destroy();
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=LodMesh'Botpack.chunkM'
	bUnlit=True
	Texture=VulcanProjSk
	MultiSkins(1)=VulcanProjSk
	Style=STY_Normal
	
	renderOnTop=False
	DrawScale=0.025000
	ScaleGlow=1.500000
	LifeSpan=6.000000

	fadeInTime=0.000000
	fadeOutTime=0.000000
	
	enableScaling=True
	scaleInTime=0.200000
	scaleOutTime=0.100000
	
	enableRot=True
	StartingRot=(Pitch=0)
	RRate1=(Pitch=24000)
	RRate2=(Yaw=55000,Roll=3500)
	
	enableOffset=True
	OffsetActive=(Y=3.500000)
	
	RndMesh(0)=LodMesh'Botpack.chunkM'
	RndMesh(1)=LodMesh'Botpack.chunk2M'
	RndMesh(2)=LodMesh'Botpack.chunk3M'
	RndMesh(3)=LodMesh'Botpack.chunk4M'
}
