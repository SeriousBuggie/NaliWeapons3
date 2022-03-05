//////////////////////////////////////////////////////////////
//				Feralidragon (20-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonRocketBaseCloud expands IonRocketSmokeFX;

#exec MESH IMPORT MESH=IonRocketBaseCloud ANIVFILE=MODELS\IonRocketBaseCloud_a.3d DATAFILE=MODELS\IonRocketBaseCloud_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonRocketBaseCloud STRENGTH=0.1
#exec MESH ORIGIN MESH=IonRocketBaseCloud X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonRocketBaseCloud SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=IonRocketBaseCloud SEQ=PlayRevolve STARTFRAME=0 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=IonRocketBaseCloud SEQ=LoopRevolve STARTFRAME=0 NUMFRAMES=40 RATE=39.0

#exec MESHMAP NEW MESHMAP=IonRocketBaseCloud MESH=IonRocketBaseCloud
#exec MESHMAP SCALE MESHMAP=IonRocketBaseCloud X=0.3 Y=0.3 Z=0.6

var() bool bWhiteSmoke;
var() float FadeInTime, FadeOutTime;
var() float MinDrawScale;
var() byte CloudDetail;

var byte chosenTex[8];
var byte LastNSmk;

replication
{
	unreliable if (Role == ROLE_Authority)
		chosenTex;
}

simulated function PostBeginPlay()
{
local byte i;

	if (CloudDetail == 0)
		return;
	CloudDetail = Min(8, CloudDetail);
	
	if (bWhiteSmoke)
	{
		if (FadeInTime > 0)
			ScaleGlow = 0.0;
		for (i = 0; i < CloudDetail; i++)
			MultiSkins[i] = SmkWhiteTex[Rand(ArrayCount(SmkWhiteTex))];
	}
	else
	{
		DrawScale = 0.1;
		AssignBlackSmoke();
	}
}

function AssignBlackSmoke()
{
local byte i;

	for (i = 0; i < 8; i++)
	{
		if (FadeInTime > 0)
		{
			chosenTex[i] = Rand(ArrayCount(SmkBlackHTex));
			MultiSkins[i] = SmkBlackHTex[chosenTex[i]];
		}
		else
		{
			chosenTex[i] = Rand(ArrayCount(SmkBlackATex));
			ChangeBlackSmoke(Byte(ScaleGlow * 8));
		}
	}
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan-LifeSpan) * (Default.DrawScale - MinDrawScale) / Default.LifeSpan + MinDrawScale;
		
		if (bWhiteSmoke)
		{
			if ((Default.LifeSpan-LifeSpan) <= FadeInTime && FadeInTime > 0)
				ScaleGlow = (Default.LifeSpan-LifeSpan) * Default.ScaleGlow / FadeInTime;
			else if (LifeSpan <= FadeOutTime && FadeOutTime > 0)
				ScaleGlow = LifeSpan * Default.ScaleGlow / FadeOutTime;
		}
		else
		{
			if ((Default.LifeSpan-LifeSpan) <= FadeInTime && FadeInTime > 0)
				ChangeBlackSmoke(Byte((Default.LifeSpan-LifeSpan) * 8.0 / FadeInTime));
			else if (LifeSpan <= FadeOutTime && FadeOutTime > 0)
				ChangeBlackSmoke(Byte(LifeSpan * 8.0 / FadeOutTime));
		}
	}
}

function ChangeBlackSmoke(byte n)
{
local byte i;
	
	if (n == LastNSmk)
		return;
	LastNSmk = n;

	for (i = 0; i < CloudDetail; i++)
	{
		if (n >= 7)
			MultiSkins[i] = SmkBlackATex[chosenTex[i]];
		else if (n == 6)
			MultiSkins[i] = SmkBlackBTex[chosenTex[i]];
		else if (n == 5)
			MultiSkins[i] = SmkBlackCTex[chosenTex[i]];
		else if (n == 4)
			MultiSkins[i] = SmkBlackDTex[chosenTex[i]];
		else if (n == 3)
			MultiSkins[i] = SmkBlackETex[chosenTex[i]];
		else if (n == 2)
			MultiSkins[i] = SmkBlackFTex[chosenTex[i]];
		else if (n == 1)
			MultiSkins[i] = SmkBlackGTex[chosenTex[i]];
		else
			MultiSkins[i] = SmkBlackHTex[chosenTex[i]];
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=IonRocketBaseCloud
	Style=STY_Translucent
	DrawScale=10.000000
	MinDrawScale=2.000000
	bUnlit=True
	Texture=NukeWSmk01
	bNetTemporary=False
	bParticles=True
	bRandomFrame=True
	ScaleGlow=0.650000
	
	bAnimByOwner=True
	LifeSpan=12.000000
	
	bWhiteSmoke=True
	FadeInTime=0.500000
	FadeOutTime=5.000000
	
	CloudDetail=8
}
