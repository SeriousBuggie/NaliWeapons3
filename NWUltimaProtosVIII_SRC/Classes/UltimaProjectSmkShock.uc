//////////////////////////////////////////////////////////////
//				Feralidragon (15-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProjectSmkShock expands NaliWEffects;

#exec MESH IMPORT MESH=UltimaProjectSmkShock ANIVFILE=MODELS\UltimaProjectSmkShock_a.3d DATAFILE=MODELS\UltimaProjectSmkShock_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=UltimaProjectSmkShock STRENGTH=0.15
#exec MESH ORIGIN MESH=UltimaProjectSmkShock X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UltimaProjectSmkShock SEQ=All STARTFRAME=0 NUMFRAMES=24
#exec MESH SEQUENCE MESH=UltimaProjectSmkShock SEQ=FullFX STARTFRAME=0 NUMFRAMES=24 RATE=23.0
#exec MESH SEQUENCE MESH=UltimaProjectSmkShock SEQ=FXa STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=UltimaProjectSmkShock SEQ=FXb STARTFRAME=5 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=UltimaProjectSmkShock SEQ=FXc STARTFRAME=11 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=UltimaProjectSmkShock SEQ=FXd STARTFRAME=17 NUMFRAMES=6 RATE=5.0

#exec MESHMAP NEW MESHMAP=UltimaProjectSmkShock MESH=UltimaProjectSmkShock
#exec MESHMAP SCALE MESHMAP=UltimaProjectSmkShock X=0.5 Y=0.5 Z=1.0

#exec TEXTURE IMPORT NAME=UltimaSmk FILE=CORONAS\UltimaSmk.bmp GROUP=Coronas LODSET=2 FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProjectSmkShock NUM=1 TEXTURE=UltimaSmk


var() float FadeInTime, FadeOutTime;
var() float MaxRotRate, MinRotRate;
var float rotRate;

simulated function PostBeginPlay()
{
local rotator R;

	PlayAnim('FullFX', 1/Default.LifeSpan, 0.0);
	R = Rotation;
	R.Roll = Rand(16384)*4;
	SetRotation(R);
	rotRate = FRand()*(MaxRotRate - MinRotRate) + MinRotRate;
	if (FRand() > 0.5)
		rotRate *= -1;
	RotationRate.Roll = rotRate;
}

simulated function Tick(float Delta)
{
local float L;

	if (Level.NetMode != NM_DedicatedServer)
	{
		L = Default.Lifespan - LifeSpan;
		if (L <= FadeInTime)
			ScaleGlow = L * Default.Lifespan / FadeInTime;
		else if (LifeSpan <= FadeOutTime)
			ScaleGlow = LifeSpan * Default.Lifespan / FadeOutTime;
		
		if (rotRate > 0)
			RotationRate.Roll = LifeSpan * (rotRate - MinRotRate) / Default.LifeSpan + MinRotRate;
		else
			RotationRate.Roll = LifeSpan * (rotRate + MinRotRate) / Default.LifeSpan - MinRotRate;
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=UltimaProjectSmkShock
	bUnlit=True
	Style=STY_Translucent
	DrawScale=1.000000
	ScaleGlow=1.000000
	LifeSpan=3.500000
	bNetTemporary=True
	
	bFixedRotationDir=True
	Physics=PHYS_Rotating
	
	FadeInTime=0.500000
	FadeOutTime=3.000000
	MaxRotRate=120000.000000
	MinRotRate=40000.000000
}
