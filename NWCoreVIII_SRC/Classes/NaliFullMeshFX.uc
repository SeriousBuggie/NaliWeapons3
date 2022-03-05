//////////////////////////////////////////////////////////////
//	Nali Weapons III Effects with disappearing mesh bug/feature fix
//				Feralidragon (21-03-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NaliFullMeshFX expands NaliWEffects
abstract;

var() bool bEnableFullMeshView;
var() float RadiusView;
var() bool bAffectByDrawScale;
var() bool bDirectionalMesh;

var PlayerPawn localPlayer;
var vector CentralLoc;
var NWCorUpdaterFX localUpdater;
var Actor localViewTarget;
var float updateDelta;

replication
{
	reliable if (Role == ROLE_Authority)
		CentralLoc;
}

simulated function PostBeginPlay()
{
local PlayerPawn PP;

	SetCentralLoc();
	
	if (Level.NetMode != NM_DedicatedServer) 
	{
		foreach AllActors(class'PlayerPawn', PP)
		{
			if (Viewport(PP.Player) != None)
			{
				localPlayer = PP;
				break;
			}
		}
	}

	Super.PostBeginPlay();
}

function SetCentralLoc()
{
	CentralLoc = Location;
}

simulated function Tick(float Delta)
{
local float viewDist, barrierDist;
local vector newOffset;
local vector camLoc;
local rotator camRot;
local Actor camActor;

	if (Level.NetMode != NM_DedicatedServer && localPlayer != None)
	{
		//If has an updater
		if (localUpdater != None && Delta != 0.5)
		{
			updateDelta = Delta;
			return;
		}
		else if (Delta == 0.5)
			Delta = updateDelta;
		
		//Check ViewTarget for "no-lag" updates
		if (localPlayer.ViewTarget != None && localUpdater == None)
		{
			if (localViewTarget == None)
			localViewTarget = localPlayer.ViewTarget;
			localUpdater = Spawn(Class'NWCorUpdaterFX');
			localUpdater.CorToUpdate = Self;
		}
		else if (localPlayer.ViewTarget != None && localViewTarget != localPlayer.ViewTarget && localUpdater != None)
		{
			localViewTarget = localPlayer.ViewTarget;
			localUpdater.Destroy();
			localUpdater = Spawn(Class'NWCorUpdaterFX');
			localUpdater.CorToUpdate = Self;
		}
		else if (localPlayer.ViewTarget == None && localUpdater != None)
		{
			localViewTarget = None;
			localUpdater.Destroy();
			localUpdater = None;
		}
		
		//Calculate new location and prepivot and make the mesh always visible
		localPlayer.PlayerCalcView( camActor, camLoc, camRot);
		if (localPlayer.ViewTarget == None)
			camActor = localPlayer;
		
		if (bEnableFullMeshView)
		{
			viewDist = VSize(camLoc - CentralLoc);
			barrierDist = RadiusView;
			if (bAffectByDrawScale)
				barrierDist *= DrawScale;
			
			if (viewDist <= barrierDist)
			{
				newOffset = (camLoc - CentralLoc) + vector(camRot)*(FMax(FMin(camActor.CollisionRadius, camActor.CollisionHeight) - 1, 1.0));
				SetLocation(CentralLoc + newOffset);
				PrePivot = -newOffset;
			}
			else if (Location != CentralLoc)
			{
				SetLocation(CentralLoc);
				PrePivot = vect(0,0,0);
			}
		}
		
		if (bDirectionalMesh)
			SetRotation(rotator(camLoc - CentralLoc));
	}
}

simulated function Destroyed()
{
	if (localUpdater != None)
		localUpdater.Destroy();
		
	localUpdater = None;
		
	Super.Destroyed();
}

defaultproperties
{
	bEnableFullMeshView=True
	RadiusView=750.000000
	bAffectByDrawScale=True
	bDirectionalMesh=False
}