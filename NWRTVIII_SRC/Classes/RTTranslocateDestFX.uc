//////////////////////////////////////////////////////////////
//				Feralidragon (07-04-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTTranslocateDestFX expands NaliTrail;

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
var() class<RTTranslocateTrailFX> TrailClass;
var() float FadeInTime;
var() float FXDistInterval;

var vector LastFXLocation;


function initFX(Mesh M, optional bool isTeam, optional byte myteam)
{
	if (isTeam && myteam > 3)
		myteam = 0;
	else if (!isTeam)
		Style = STY_Modulated;
	
	Mesh = M;
	if (isTeam)
		SetTex(TTex[myteam]);
	else
		SetTex(Neutral[0]);
		
	if (Style == STY_Modulated)
		SetTex(Texture'ModulInvis', True, 8);
	else
		SetTex(Texture'TranslucInvis', True, 8);
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

simulated function Tick(float Delta)
{
local float revLifeSpan, glow;
local byte i;
local RTTranslocateTrailFX RTFX;

	if (Level.NetMode != NM_DedicatedServer)
	{
		revLifeSpan = Default.LifeSpan - LifeSpan;
		if (FadeInTime > 0 && revLifeSpan <= FadeInTime)
			glow = revLifeSpan * Default.ScaleGlow / FadeInTime;
		else
			glow = LifeSpan * Default.ScaleGlow / (Default.LifeSpan - FadeInTime);
		DrawScale = Default.DrawScale * (glow / Default.ScaleGlow);
		
		if (Style == STY_Modulated)
			SetTex(Neutral[Byte((Default.ScaleGlow - glow)/Default.ScaleGlow*(ArrayCount(Neutral)-1))]);
		else
			ScaleGlow = glow;
		
		if (Owner == None)
			return;
			
		AnimSequence = Owner.AnimSequence;
		AnimFrame = Owner.AnimFrame;
		if (VSize(LastFXLocation - Owner.Location) >= FXDistInterval && TrailClass != None)
		{
			if (VSize(LastFXLocation) == 0)
			{
				LastFXLocation = Owner.Location;
				return;
			}
			
			LastFXLocation = Owner.Location;
			RTFX = Spawn(TrailClass, Owner,, Owner.Location, Owner.Rotation);
			if (RTFX != None)
			{
				RTFX.initFX(Mesh, AnimSequence, AnimFrame, DrawScale, glow, (Style == STY_Modulated));
				RTFX.SetTex(Texture);
				for (i = 0; i < 4; i++)
				{
					if (Style == STY_Modulated)
						RTFX.SetModulTexFlag(Rand(ArrayCount(MultiSkins)));
					else
						RTFX.SetTex(MultiSkins[i], True, Rand(ArrayCount(MultiSkins)));
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
	bOwnerNoSee=True
	
	LifeSpan=1.500000
	DrawScale=0.850000
	ScaleGlow=1.000000
	FadeInTime=0.000000
	FXDistInterval=40.000000
	TrailClass=Class'RTTranslocateDestTrailFX'
	
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
