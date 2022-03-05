//////////////////////////////////////////////////////////////
//				Feralidragon (11-08-2012)
//
// NW3 CYBOT LAUNCHER 1.00
//////////////////////////////////////////////////////////////

class MinesRadarMut expands Mutator;

#exec TEXTURE IMPORT NAME=MineBeacon FILE=Icons\MineBeacon.bmp GROUP=Icons MIPS=OFF LODSET=0

var() color MineTeamColors[4];
var() texture BeaconIcon;
var() float BeaconScale;

var float maxDist;
var bool bFadeOnDist;

replication
{
	reliable if (Role == ROLE_Authority)
		maxDist, bFadeOnDist;
}

function BeginPlay()
{
	maxDist = Class'TheMiner'.default.MineBeaconsMaxDistance;
	bFadeOnDist = Class'TheMiner'.default.ReduceMineBeaconsOnDistance;
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
local NWMine M;

	POwner = Canvas.Viewport.Actor;
	if (POwner != None && POwner.PlayerReplicationInfo != None)
	{
		Scale = Canvas.ClipY/480;
		Canvas.bNoSmooth = False;
		Canvas.Style = ERenderStyle.STY_Translucent;
		ForEach RadiusActors(Class'NWMine', M, maxDist, POwner.Location)
		{
			if (!M.noHUDRender && FastTrace(M.Location, POwner.Location + POwner.EyeHeight*vect(0,0,1)))
				RenderBeacon(M, POwner, Canvas, Scale);
		}
	}

	if (NextHUDMutator != None)
		NextHUDMutator.PostRender(Canvas);
}

simulated function RenderBeacon(NWMine M, PlayerPawn POwner, canvas Canvas, float Scale)
{
local vector OutXY;
local float cX, cY;
local color CCTeam;
local float distScale;
local byte team;

	if (M.Instigator == POwner && Class'NWUtils'.static.ActorToCanvas(OutXY, M, Canvas, True))
	{	
		if (POwner.PlayerReplicationInfo != None)
			team = POwner.PlayerReplicationInfo.Team;
		
		CCTeam = getTeamColor(team);
		if (bFadeOnDist)
			distScale = (maxDist - VSize(POwner.Location - M.Location)) / maxDist;
		else
			distScale = 1.0;
		Canvas.DrawColor = CCTeam;
		cX = OutXY.X - distScale*Scale*BeaconScale*BeaconIcon.USize/2;
		cY = OutXY.Y - distScale*Scale*BeaconScale*BeaconIcon.VSize;
		Canvas.SetPos(cX, cY);
		Canvas.DrawIcon(BeaconIcon, distScale*Scale*BeaconScale);
	}
}

simulated function color getTeamColor(byte i)
{
	if (i >= ArrayCount(MineTeamColors))
		return MineTeamColors[0];
	return MineTeamColors[i];
}

function ModifyPlayer(Pawn Other)
{
local NWMine M;

	if (PlayerPawn(Other) != None)
	{
		ForEach AllActors(Class'NWMine', M)
		{
			if (M.Instigator == None || M.Instigator.bDeleteMe)
				Class'NWUtils'.static.isFriend(Other, Level, None, M.savedTeam, M.bNoHurtTeam, M.bNeverHurtInstigator, M.ownerName, M);
		}
	}
	
	if (NextMutator != None)
		NextMutator.ModifyPlayer(Other);
}

 
defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=True
	
	MineTeamColors(0)=(R=255,G=0,B=0)
	MineTeamColors(1)=(R=0,G=0,B=255)
	MineTeamColors(2)=(R=0,G=255,B=0)
	MineTeamColors(3)=(R=255,G=255,B=0)
	
	BeaconIcon=MineBeacon
	BeaconScale=1.000000
}