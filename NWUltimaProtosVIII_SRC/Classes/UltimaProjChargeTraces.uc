//////////////////////////////////////////////////////////////
//				Feralidragon (02-10-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProjChargeTraces expands NaliWEffects;

#exec TEXTURE IMPORT NAME=UltimaChargeTrace01 FILE=CORONAS\UltimaChargeTrace01.bmp GROUP=Coronas LODSET=2 FLAGS=2
#exec TEXTURE IMPORT NAME=UltimaChargeTrace02 FILE=CORONAS\UltimaChargeTrace02.bmp GROUP=Coronas LODSET=2 FLAGS=2

#exec MESH IMPORT MESH=UltimaProjChargeTraces ANIVFILE=MODELS\UltimaProjChargeTraces_a.3d DATAFILE=MODELS\UltimaProjChargeTraces_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaProjChargeTraces STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProjChargeTraces X=0 Y=0 Z=0 Yaw=128

#exec MESH SEQUENCE MESH=UltimaProjChargeTraces SEQ=All STARTFRAME=0 NUMFRAMES=35
#exec MESH SEQUENCE MESH=UltimaProjChargeTraces SEQ=ChargeComplete STARTFRAME=0 NUMFRAMES=35 RATE=34.0
#exec MESH SEQUENCE MESH=UltimaProjChargeTraces SEQ=ChargeStart STARTFRAME=0 NUMFRAMES=16 RATE=15.0
#exec MESH SEQUENCE MESH=UltimaProjChargeTraces SEQ=ChargeEnd STARTFRAME=15 NUMFRAMES=20 RATE=19.0

#exec MESHMAP NEW MESHMAP=UltimaProjChargeTraces MESH=UltimaProjChargeTraces
#exec MESHMAP SCALE MESHMAP=UltimaProjChargeTraces X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=UltimaProjChargeTraces NUM=1 TEXTURE=UltimaChargeTrace01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProjChargeTraces NUM=2 TEXTURE=UltimaChargeTrace01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProjChargeTraces NUM=3 TEXTURE=UltimaChargeTrace01

#exec MESH IMPORT MESH=UltimaProjChargeTracesR ANIVFILE=MODELS\UltimaProjChargeTraces_a.3d DATAFILE=MODELS\UltimaProjChargeTraces_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=UltimaProjChargeTracesR STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProjChargeTracesR X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=UltimaProjChargeTracesR SEQ=All STARTFRAME=0 NUMFRAMES=35
#exec MESH SEQUENCE MESH=UltimaProjChargeTracesR SEQ=ChargeComplete STARTFRAME=0 NUMFRAMES=35 RATE=34.0
#exec MESH SEQUENCE MESH=UltimaProjChargeTracesR SEQ=ChargeStart STARTFRAME=0 NUMFRAMES=16 RATE=15.0
#exec MESH SEQUENCE MESH=UltimaProjChargeTracesR SEQ=ChargeEnd STARTFRAME=15 NUMFRAMES=20 RATE=19.0

#exec MESHMAP NEW MESHMAP=UltimaProjChargeTracesR MESH=UltimaProjChargeTracesR
#exec MESHMAP SCALE MESHMAP=UltimaProjChargeTracesR X=0.3 Y=0.3 Z=0.6

#exec MESHMAP SETTEXTURE MESHMAP=UltimaProjChargeTracesR NUM=1 TEXTURE=UltimaChargeTrace01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProjChargeTracesR NUM=2 TEXTURE=UltimaChargeTrace01
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProjChargeTracesR NUM=3 TEXTURE=UltimaChargeTrace01


var() float fadeInTime, fadeOutTime;
var() texture RandTex[3];

var actor refActor;
var bool hasOwnRotation;

simulated function PostBeginPlay()
{
local byte i;

	PlayAnim('ChargeComplete', 1/Default.LifeSpan, 0.0);
	for (i = 1; i < 4; i++)
		MultiSkins[i] = RandTex[Rand(ArrayCount(RandTex))];
}

simulated function setActor(bool bLeft, actor ref, optional float dScale, optional bool hasOwnRot)
{
	if (bLeft)
		Mesh = Mesh'UltimaProjChargeTraces';
	refActor = ref;
	if (dScale > 0.0)
		DrawScale = dScale;
	hasOwnRotation = hasOwnRot;
}

simulated function Tick(float Delta)
{
local rotator R;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if ((Default.LifeSpan - LifeSpan) <= fadeInTime)
			Scaleglow = (Default.LifeSpan - LifeSpan) * Default.Scaleglow / fadeInTime;
		else if (LifeSpan <= fadeOutTime)
			Scaleglow = LifeSpan * Default.Scaleglow / fadeOutTime;
		
		if (refActor != None)
		{
			SetLocation(refActor.Location);
			if (!hasOwnRotation)
			{
				R = refActor.Rotation;
				R.Roll = Rotation.Roll;
				SetRotation(R);
			}
		}
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=UltimaProjChargeTracesR
	
	bUnlit=True
	LifeSpan=0.850000
	DrawScale=1.50000
	ScaleGlow=1.750000
	Style=STY_Translucent
	
	RandTex(0)=UltimaChargeTrace01
	RandTex(1)=UltimaChargeTrace02
	RandTex(2)=UltimaChargeTrace01
	
	fadeInTime=0.500000
	fadeOutTime=0.100000
}
