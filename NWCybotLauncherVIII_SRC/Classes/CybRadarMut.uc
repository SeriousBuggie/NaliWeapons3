//////////////////////////////////////////////////////////////
//				Feralidragon (24-06-2011)
//
// NW3 CYBOT LAUNCHER 1.00
//////////////////////////////////////////////////////////////

class CybRadarMut expands Mutator;

#exec TEXTURE IMPORT NAME=CybBeaconIcon FILE=Icons\CybBeaconIcon.bmp GROUP=Icons MIPS=OFF LODSET=0

var() color CybTeamColors[4];
var() texture BeaconIcon;
var() float BeaconScale;
var() font BeaconFont;
var() localized string HealthTxt;

var float maxDist, txtDist;
var bool bAlwaysSee, enableText, bFadeOnDist;

replication
{
	reliable if (Role == ROLE_Authority)
		maxDist, txtDist, bAlwaysSee, enableText, bFadeOnDist;
}

function BeginPlay()
{
	maxDist = Class'CybotLauncher'.default.CybotBeaconsMaxDistance;
	bAlwaysSee = Class'CybotLauncher'.default.bAlwaysSeeCybotBeacons;
	bFadeOnDist = Class'CybotLauncher'.default.ReduceCybotBeaconsOnDistance;
	enableText = Class'CybotLauncher'.default.enableCybotBeaconsText;
	txtDist = Class'CybotLauncher'.default.CybotBeaconsTextDist;
}

simulated function Tick(float Delta)
{
	if (!bHUDMutator && Level.NetMode != NM_DedicatedServer )
		RegisterHUDMutator();
}
 
simulated function PostRender(canvas Canvas)
{
local float Scale;
local PlayerPawn POwner;
local Cybot C;

	POwner = Canvas.Viewport.Actor;
	if (POwner != None && POwner.PlayerReplicationInfo != None)
	{
		Canvas.Reset();
		Scale = Canvas.ClipY/480;
		Canvas.bNoSmooth = False;
		Canvas.Style = ERenderStyle.STY_Translucent;
		if (BeaconFont != None)
			Canvas.Font = BeaconFont;
		else
			Canvas.Font = Class'FontInfo'.static.GetStaticSmallFont(Canvas.ClipX);
		
		ForEach RadiusActors(Class'Cybot', C, maxDist, POwner.Location)
		{
			if (bAlwaysSee || FastTrace(C.Location, POwner.Location + POwner.EyeHeight*vect(0,0,1)))
				RenderBeacon(C, POwner, Canvas, Scale);
		}
	}

	if (NextHUDMutator != None)
		NextHUDMutator.PostRender(Canvas);
}

simulated function RenderBeacon(Cybot C, PlayerPawn POwner, canvas Canvas, float Scale)
{
local vector OutXY;
local float cX, cY;
local float tX, tY;
local string healthStr, nameStr;
local color CCTeam;
local float distScale;

	if ((C.MasterPawn == POwner || C.Instigator == POwner) && !C.neverRenderBeacon && Class'NWUtils'.static.ActorToCanvas(OutXY, C, Canvas, True))
	{	
		CCTeam = getTeamColor(C.MyTeam);
		
		//Beacon
		if (bFadeOnDist)
			distScale = (maxDist - VSize(POwner.Location - C.Location)) / maxDist;
		else
			distScale = 1.0;
		Canvas.DrawColor = CCTeam;
		
		cX = OutXY.X - distScale*Scale*BeaconScale*BeaconIcon.USize/2;
		cY = OutXY.Y - distScale*Scale*BeaconScale*BeaconIcon.VSize;
		Canvas.SetPos(cX, cY);
		Canvas.DrawIcon(BeaconIcon, distScale*Scale*BeaconScale);
		
		if (enableText && VSize(POwner.Location - C.Location) <= txtDist)
		{
			//Text fading
			if (bFadeOnDist)
				distScale = (txtDist - VSize(POwner.Location - C.Location)) / txtDist;
			else
				distScale = 1.0;
			Canvas.DrawColor = distScale*CCTeam;
			
			//Health Text
			healthStr = HealthTxt $ C.Health;
			Canvas.TextSize(healthStr, tX, tY);
			cX = OutXY.X - tX/2;
			cY -= (tY + Scale*2);
			Canvas.SetPos(cX, cY);
			Canvas.DrawTextClipped(healthStr);
			
			//Cybot Name Text
			nameStr = C.MyName;
			Canvas.TextSize(nameStr, tX, tY);
			cX = OutXY.X - tX/2;
			cY -= (tY + Scale*2);
			Canvas.SetPos(cX, cY);
			Canvas.DrawTextClipped(nameStr);
		}
	}
}

simulated function color getTeamColor(byte i)
{
	if (i >= ArrayCount(CybTeamColors))
		return CybTeamColors[0];
	return CybTeamColors[i];
}
 
defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=True
	
	CybTeamColors(0)=(R=255,G=0,B=0)
	CybTeamColors(1)=(R=0,G=0,B=255)
	CybTeamColors(2)=(R=0,G=255,B=0)
	CybTeamColors(3)=(R=255,G=255,B=0)
	
	BeaconIcon=CybBeaconIcon
	BeaconScale=0.750000
	BeaconFont=None
	HealthTxt="Health: "
}