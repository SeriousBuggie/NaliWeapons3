//////////////////////////////////////////////////////////////
//				Feralidragon (28-08-2011)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////

class MegatonMut expands Mutator;

#exec TEXTURE IMPORT NAME=PCardLocIcon1 FILE=Icons\PCardLocIcon1.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=PCardLocIcon2 FILE=Icons\PCardLocIcon2.bmp GROUP=Icons MIPS=OFF LODSET=0

var() color PCardColor, PCardColorFX;
var() texture PCardIcon, PCardIconFX;
var() float PCardScale;

var float maxDist;

var float tCount;
var bool tStatus;

replication
{
	reliable if (Role == ROLE_Authority)
		maxDist;
}

function BeginPlay()
{
	maxDist = Class'MegatonPassCard'.default.renderLocationMaxDist;
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (!bHUDMutator)
			RegisterHUDMutator();
		
		if (!tStatus)
		{
			tCount += (Delta*4);
			if (tCount >= 1.0)
			{
				tCount = 1.0;
				tStatus = True;
			}
		}
		else
		{
			tCount -= Delta;
			if (tCount <= 0.0)
			{
				tCount = 0.0;
				tStatus = False;
			}
		}
	}
}
 
simulated function PostRender(canvas Canvas)
{
local float Scale;
local PlayerPawn POwner;
local MegatonPassCard MPC;

	POwner = Canvas.Viewport.Actor;
	if (POwner == None && POwner.PlayerReplicationInfo != None)
		return;
	
	Canvas.Reset();
	Scale = Canvas.ClipY/480;
	Canvas.bNoSmooth = False;
	Canvas.Style = ERenderStyle.STY_Translucent;
	
	ForEach RadiusActors(Class'MegatonPassCard', MPC, maxDist, POwner.Location)
	{
		if (Pawn(MPC.Owner) == None && FastTrace(MPC.Location, POwner.Location + POwner.EyeHeight*vect(0,0,1)))
			RenderMPCLoc(MPC, POwner, Canvas, Scale);
	}

	if (NextHUDMutator != None)
		NextHUDMutator.PostRender(Canvas);
}

simulated function RenderMPCLoc(MegatonPassCard MPC, PlayerPawn POwner, canvas Canvas, float Scale)
{
local vector OutXY;
local float cX, cY;
local float locScale;

	if (Class'NWUtils'.static.ActorToCanvas(OutXY, MPC, Canvas))
	{	
		Canvas.DrawColor = PCardColor;
		cX = OutXY.X - Scale*PCardScale*PCardIcon.USize/2;
		cY = OutXY.Y - Scale*PCardScale*PCardIcon.VSize/4*3;
		Canvas.SetPos(cX, cY);
		Canvas.DrawIcon(PCardIcon, Scale*PCardScale);
		
		if (!tStatus)
			locScale = (1 + cos(tCount*PI/2)*2)*PCardScale;
		else
			locScale = PCardScale;
		
		Canvas.DrawColor = tCount*PCardColorFX;
		cX = OutXY.X - Scale*locScale*PCardIcon.USize/2;
		cY = OutXY.Y - Scale*locScale*PCardIcon.VSize/4*3;
		Canvas.SetPos(cX, cY);
		Canvas.DrawIcon(PCardIconFX, Scale*locScale);
	}
}
 
defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=True
	
	PCardColor=(R=0,G=255,B=0)
	PCardColorFX=(R=128,G=255,B=0)
	PCardIcon=PCardLocIcon1
	PCardIconFX=PCardLocIcon2
	PCardScale=0.500000
}