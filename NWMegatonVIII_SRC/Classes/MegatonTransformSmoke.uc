//////////////////////////////////////////////////////////////
//				Feralidragon (21-08-2011)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////

class MegatonTransformSmoke expands NaliTrail;

#exec MESH IMPORT MESH=MegatonTransformSmoke ANIVFILE=MODELS\MegatonTransformSmoke_a.3d DATAFILE=MODELS\MegatonTransformSmoke_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=MegatonTransformSmoke X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MegatonTransformSmoke SEQ=All STARTFRAME=0 NUMFRAMES=60
#exec MESH SEQUENCE MESH=MegatonTransformSmoke SEQ=Openned STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonTransformSmoke SEQ=Closed STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonTransformSmoke SEQ=Openning STARTFRAME=29 NUMFRAMES=31 RATE=30.0
#exec MESH SEQUENCE MESH=MegatonTransformSmoke SEQ=Closing STARTFRAME=0 NUMFRAMES=30 RATE=29.0

#exec MESHMAP NEW MESHMAP=MegatonTransformSmoke MESH=MegatonTransformSmoke
#exec MESHMAP SCALE MESHMAP=MegatonTransformSmoke X=0.5696 Y=0.5696 Z=1.1392


var() float MaxDrawScale;
var() texture SmokeTex[4];


simulated function PostBeginPlay()
{
local byte i;

	for (i = 0; i < 8; i++)
		MultiSkins[i] = SmokeTex[Rand(ArrayCount(SmokeTex))];
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		ScaleGlow = LifeSpan * default.ScaleGlow / default.LifeSpan;
		DrawScale = (default.LifeSpan-LifeSpan) * (MaxDrawScale-default.DrawScale) / default.LifeSpan + default.DrawScale;
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MegatonTransformSmoke
	bParticles=True
	bRandomFrame=True
	Texture=Texture'Botpack.utsmoke.us8_a00'
	bNetTemporary=True
	LifeSpan=0.500000
	bAnimByOwner=True
	DrawScale=0.125000
	MaxDrawScale=0.300000
	bUnlit=True
	ScaleGlow=2.000000
	Style=STY_Translucent
	
	SmokeTex(0)=Texture'Botpack.utsmoke.us8_a00'
	SmokeTex(1)=Texture'Botpack.utsmoke.US3_A00'
	SmokeTex(2)=Texture'Botpack.utsmoke.us2_a00'
	SmokeTex(3)=Texture'Botpack.utsmoke.us1_a00'
}
