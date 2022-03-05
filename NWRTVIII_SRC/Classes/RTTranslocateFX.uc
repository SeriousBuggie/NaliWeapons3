//////////////////////////////////////////////////////////////
//				Feralidragon (04-04-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTTranslocateFX expands NaliWEffects;

//TEAM PARTICLES
#exec TEXTURE IMPORT NAME=TeleFXRed FILE=CORONAS\TeleFXRed.bmp GROUP=TeleFXRed LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXBlue FILE=CORONAS\TeleFXBlue.bmp GROUP=TeleFXBlue LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXGreen FILE=CORONAS\TeleFXGreen.bmp GROUP=TeleFXGreen LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXYellow FILE=CORONAS\TeleFXYellow.bmp GROUP=TeleFXYellow LODSET=2

//DARK PARTICLES
#exec TEXTURE IMPORT NAME=TeleFXDark01 FILE=CORONAS\TeleFXDark01.bmp GROUP=TeleFXDark01 LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXDark02 FILE=CORONAS\TeleFXDark02.bmp GROUP=TeleFXDark02 LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXDark03 FILE=CORONAS\TeleFXDark03.bmp GROUP=TeleFXDark03 LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXDark04 FILE=CORONAS\TeleFXDark04.bmp GROUP=TeleFXDark04 LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXDark05 FILE=CORONAS\TeleFXDark05.bmp GROUP=TeleFXDark05 LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXDark06 FILE=CORONAS\TeleFXDark06.bmp GROUP=TeleFXDark06 LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXDark07 FILE=CORONAS\TeleFXDark07.bmp GROUP=TeleFXDark07 LODSET=2
#exec TEXTURE IMPORT NAME=TeleFXDark08 FILE=CORONAS\TeleFXDark08.bmp GROUP=TeleFXDark08 LODSET=2


var() texture Neutral[8], TTex[4];
var() int TrailCount;
var() float TrailMaxDistance;
var() class<RTTranslocateTrailFX> TrailClass;

var byte Team;
var float TrailRCount;
var name ReplAnimSeq;
var float ReplAnimFrame;
var texture MyTex[8];
var vector TrailDir;


replication
{
	reliable if (Role == ROLE_Authority)
		Team, MyTex, TrailDir;
	unreliable if (Role == ROLE_Authority)
		ReplAnimSeq, ReplAnimFrame;
}

simulated function PostNetBeginPlay()
{
	Super.PostNetBeginPlay();
	AnimSequence = ReplAnimSeq;
	AnimFrame = ReplAnimFrame;
}

function initFX(Mesh M, name ASeq, float AFrame, vector dir, optional bool isTeam, optional byte myteam)
{
local byte i;

	if (isTeam)
	{
		Team = myteam;
		if (Team > 3)
			Team = 0;
	}
	else
	{
		Style = STY_Modulated;
		SetTex(Texture'ModulInvis');
	}
	
	Mesh = M;
	ReplAnimSeq = ASeq;
	ReplAnimFrame = AFrame;
	AnimSequence = ReplAnimSeq;
	AnimFrame = ReplAnimFrame;
	TrailDir = Normal(dir);
	
	for (i = 0; i < ArrayCount(MultiSkins); i++)
	{
		if (isTeam)
			SetVirtualTex(TTex[Team], True, i);
		else
			SetVirtualTex(Neutral[0], True, i);
	}
}

simulated function SetTex(texture Tex, optional bool changeJTexOnly, optional byte j)
{
local byte i;

	if (changeJTexOnly && j < 9)
	{
		if (j < 8)
			MultiSkins[j] = Tex;
		else if (Tex != None)
			Texture = Tex;
	}
	else
	{
		for (i = 0; i < ArrayCount(MultiSkins); i++)
			MultiSkins[i] = Tex;
		if (Tex != None)
			Texture = Tex;
	}
}

simulated function SetVirtualTex(texture Tex, optional bool changeJTexOnly, optional byte j)
{
local byte i;

	if (changeJTexOnly && j < 8)
		MyTex[j] = Tex;
	else
	{
		for (i = 0; i < ArrayCount(MyTex); i++)
			MyTex[i] = Tex;
	}
}

simulated function Tick(float Delta)
{
local float revLifeSpan, glow, trailLife;
local byte i;
local int perfoLevel;
local RTTranslocateTrailFX RTFX;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (Class'RT'.default.enableTeleportFXSmartPerformance)
		{
			perfoLevel = Class'NWUtils'.static.getFrameRateLevel(Level, Delta);
			if (perfoLevel < 0 && FRand()>0.75)
			{
				Destroy();
				return;
			}
		}
	
		revLifeSpan = Default.LifeSpan - LifeSpan;
		glow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
		DrawScale = Default.DrawScale * (glow / Default.ScaleGlow);
			
		if (TrailMaxDistance > 0 && TrailCount > 0 && TrailClass != None)
		{
			TrailRCount += Delta;
			trailLife = Default.LifeSpan;
			if (TrailRCount >= trailLife/TrailCount)
			{
				TrailRCount = 0.0;
				RTFX = Spawn(TrailClass,,, Location + TrailDir*(TrailMaxDistance*(revLifeSpan/trailLife)));
				if (RTFX != None)
				{
					RTFX.initFX(Mesh, AnimSequence, AnimFrame, DrawScale, glow, (Style == STY_Modulated));
					RTFX.SetTex(Texture);
					for (i = 0; i < 4; i++)
					{
						if (Style == STY_Modulated)
							RTFX.SetModulTexFlag(Rand(ArrayCount(MultiSkins)));
						else
							RTFX.SetTex(MyTex[i], True, Rand(ArrayCount(MultiSkins)));
					}
				}
			}
		}
	}
}


defaultproperties
{
    DrawType=DT_Mesh
    Mesh=LodMesh'UnrealShare.WoodenBoxM'
	bParticles=True
	bRandomFrame=True
	bUnlit=True
	bNetTemporary=True
	Texture=TranslucInvis
	Style=STY_Translucent
	
	LifeSpan=0.300000
	DrawScale=0.850000
	ScaleGlow=1.000000
	TrailCount=20
	TrailMaxDistance=320.000000
	TrailClass=Class'RTTranslocateTrailFX'
	
	TTex(0)=TeleFXRed
	TTex(1)=TeleFXBlue
	TTex(2)=TeleFXGreen
	TTex(3)=TeleFXYellow
	
	Neutral(0)=TeleFXDark01
	Neutral(1)=TeleFXDark02
	Neutral(2)=TeleFXDark03
	Neutral(3)=TeleFXDark04
	Neutral(4)=TeleFXDark05
	Neutral(5)=TeleFXDark06
	Neutral(6)=TeleFXDark07
	Neutral(7)=TeleFXDark08
}
