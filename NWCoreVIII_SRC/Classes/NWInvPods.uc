//////////////////////////////////////////////////////////////
//	Nali Weapons III Inventory Pods main class
//				Feralidragon (09-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWInvPods expands NaliWActor
abstract;

var() class<NWColoredOV> OVClass;
var() color TeamColors[4];
var() color defaultColor;
var NWColoredOV OV;
var color CurColor;
var bool bTeamOV;
var byte ovFX;
var float curFXGlow, fxTimeElapsed;

var ControlPoint CPTeam;
var PlayerStart PSTeam;
var FortStandard FSTeam;
var byte bHaveFort, PTeam;


replication
{
	reliable if (Role == ROLE_Authority)
		CurColor, ovFX;
}

function BeginPlay()
{
	SetTimer(1.5, True);
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && OVClass != None && ovFX > 0)
	{
		if (OV == None)
		{
			OV = Spawn(OVClass);
			OV.Init(Self, CurColor);
		}
		
		if (OV.ColorRGB != CurColor)
			OV.SetRGB(CurColor);
		if (OV.DrawScale != DrawScale)
			OV.DrawScale = DrawScale;
		UpdateOVFX(OV, Delta);
	}
}

simulated function UpdateOVFX(NWColoredOV OVActor, float Delta)
{
local float alpha, expN, coef;
local bool bAscending;

	if (OVActor == None || ovFX == 0)
		return;

	//0 - no fx
	//1 - constant 100% glow
	//2 - constant 75% glow
	//3 - constant 50% glow
	//4 - constant 25% glow
	//5-7 - flicker (1-slight flicker, 3-intense flicker)
	//8-10 - fade: 50%in 50%out (4-slow fx, 6-fast fx)
	//11-13 - fade: 25%in 75%out (7-slow fx, 9-fast fx)
	//14-16 - fade: 75%in 25%out (10-slow fx, 12-fast fx)
	//17-19 - fade: 10%in 90%out (13-slow fx, 15-fast fx)
	//20-22 - fade: 90%in 10%out (16-slow fx, 18-fast fx)
	//23-25 - fade: 0%in 100%out (19-slow fx, 21-fast fx)
	//26-28 - fade: 100%in 0%out (22-slow fx, 24-fast fx)
	
	fxTimeElapsed += Delta;
	expN = ovFX - 4;
	if (ovFX == 1)
		curFXGlow = 1.0;
	else if (ovFX == 2)
		curFXGlow = 0.75;
	else if (ovFX == 3)
		curFXGlow = 0.50;
	else if (ovFX == 4)
		curFXGlow = 0.25;
	else if (ovFX <= 7)
		curFXGlow = (FRand() / (4.f-expN)) + (1 - 1/(4.f-expN));
	else if (ovFX <= 22)
	{
		expN = ((expN - 1)%3) + 4;
		alpha = (2.f**(expN-4)) * fxTimeElapsed*PI;
		alpha -= (Int(alpha/(2.f*PI))*(2.f*PI));
		bAscending = (alpha <= PI/2 || alpha >= 3*PI/2);
		if (ovFX > 6)
		{
			if (ovFX <= 13)
			{
				if (!bAscending)	coef = 0.25;
				else				coef = 4.00;
			}
			else if (ovFX <= 16)
			{
				if (!bAscending)	coef = 4.00;
				else				coef = 0.25;
			}
			else if (ovFX <= 19)
			{
				if (!bAscending)	coef = 0.10;
				else				coef = 10.0;
			}
			else if (ovFX <= 22)
			{
				if (!bAscending)	coef = 10.0;
				else				coef = 0.10;
			}
			
			fxTimeElapsed += (Delta*coef - Delta);
			alpha = (2.f**(expN-4)) * fxTimeElapsed*PI;
		}
		
		curFXGlow = (Sin(alpha) + 1.f) / 2.f;
	}
	else if (ovFX <= 28)
	{
		expN = ((expN - 1)%3) + 4;
		fxTimeElapsed += (Delta*(2.f**(expN-5)) - Delta);
		curFXGlow = fxTimeElapsed - Int(fxTimeElapsed);
		if (expN <= 26)
			curFXGlow = 1 - curFXGlow;
	}
	
	if (OVActor.mainGlow != curFXGlow)
		OVActor.SetGlow(curFXGlow);
}

function Timer()
{
	if (bTeamOV)
	{
		PTeam = Class'NWUtils'.static.GetCurrentTeam(Self, Level, 255, PTeam, CPTeam,  PSTeam, FSTeam, bHaveFort);
		if (PTeam < 4)
			CurColor = TeamColors[PTeam];
		else
			CurColor = defaultColor;
	}
	else
	{
		CurColor = defaultColor;
		SetTimer(0.0, False);
	}
}

function SetupOVProperties(color RGB, optional byte FX, optional bool bTeam)
{
	bTeamOV = bTeam;
	defaultColor = RGB;
	CurColor = defaultColor;
	ovFX = FX;
	if (bTeamOV)
	{
		PTeam = Class'NWUtils'.static.IdentifyTeam(Level, Self, CPTeam, PSTeam, FSTeam, bHaveFort);
		if (PTeam < 4)
			CurColor = TeamColors[PTeam];
	}
}

simulated function Destroyed()
{
	if (OV != None)
		OV.Destroy();
	OV = None;
	
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	DrawScale=1.000000
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	ScaleGlow=1.250000
	
	TeamColors(0)=(R=255,G=0,B=0)
	TeamColors(1)=(R=0,G=0,B=255)
	TeamColors(2)=(R=0,G=255,B=0)
	TeamColors(3)=(R=255,G=255,B=0)
}