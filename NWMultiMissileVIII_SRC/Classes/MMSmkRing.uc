//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MMSmkRing expands NaliWEffects;

#exec MESH IMPORT MESH=SmkRing ANIVFILE=MODELS\SmkRing_a.3d DATAFILE=MODELS\SmkRing_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=SmkRing STRENGTH=0.25
#exec MESH ORIGIN MESH=SmkRing X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=SmkRing SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=SmkRing SEQ=Compress STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=SmkRing SEQ=Expand STARTFRAME=1 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=SmkRing MESH=SmkRing
#exec MESHMAP SCALE MESHMAP=SmkRing X=3.0 Y=3.0 Z=6.0

#exec TEXTURE IMPORT NAME=Smoke_01 FILE=SMOKE\Smoke_01.bmp GROUP=Smoke FLAGS=2
#exec TEXTURE IMPORT NAME=Smoke_02 FILE=SMOKE\Smoke_02.bmp GROUP=Smoke FLAGS=2
#exec TEXTURE IMPORT NAME=Smoke_03 FILE=SMOKE\Smoke_03.bmp GROUP=Smoke FLAGS=2
#exec TEXTURE IMPORT NAME=Smoke_04 FILE=SMOKE\Smoke_04.bmp GROUP=Smoke FLAGS=2
#exec TEXTURE IMPORT NAME=Smoke_05 FILE=SMOKE\Smoke_05.bmp GROUP=Smoke FLAGS=2
#exec TEXTURE IMPORT NAME=Smoke_06 FILE=SMOKE\Smoke_06.bmp GROUP=Smoke FLAGS=2
#exec TEXTURE IMPORT NAME=Smoke_07 FILE=SMOKE\Smoke_07.bmp GROUP=Smoke FLAGS=2

var() float ExpandRate;
var() name AnimType;
var() texture smk[7];

simulated function Tick( float DeltaTime)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
		DrawScale = (Default.LifeSpan - LifeSpan) * Default.DrawScale / Default.LifeSpan;
	}
}

simulated function PostBeginPlay()
{
local int i;

	for (i = 0; i < 8; i++)
		MultiSkins[i] = smk[Rand(7)];
	PlayAnim(AnimType, ExpandRate);
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=SmkRing
	DrawScale=10.000000
	ScaleGlow=1.500000
	LifeSpan=0.350000
	bParticles=True
	bRandomFrame=True
	Texture=Smoke_01
	MultiSkins(0)=Smoke_01
	MultiSkins(1)=Smoke_02
	MultiSkins(2)=Smoke_03
	MultiSkins(3)=Smoke_04
	MultiSkins(4)=Smoke_05
	MultiSkins(5)=Smoke_06
	MultiSkins(6)=Smoke_07
	MultiSkins(7)=Smoke_03
	smk(0)=Smoke_01
	smk(1)=Smoke_02
	smk(2)=Smoke_03
	smk(3)=Smoke_04
	smk(4)=Smoke_05
	smk(5)=Smoke_06
	smk(6)=Smoke_07
	Style=STY_Translucent
	ExpandRate=0.900000
	AnimType=Expand
}
