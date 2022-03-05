//////////////////////////////////////////////////////////////
//				Feralidragon (10-04-2011)
//
// NW3 NUCLEAR LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearGuidedMissile expands NuclearMissile;

#exec TEXTURE IMPORT NAME=NukeXTrace FILE=ICONS\NukeXTrace.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NukeYTrace FILE=ICONS\NukeYTrace.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=MachTarget FILE=ICONS\MachTarget.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec TEXTURE IMPORT NAME=NukeAltitudeBar FILE=ICONS\NukeAltitudeBar.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NukeAltitudePointer1 FILE=ICONS\NukeAltitudePointer1.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NukeAltitudePointer2 FILE=ICONS\NukeAltitudePointer2.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NukeAltitudeIndicator FILE=ICONS\NukeAltitudeIndicator.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec TEXTURE IMPORT NAME=NukeOrientationBar FILE=ICONS\NukeOrientationBar.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NukeOrientationPointer FILE=ICONS\NukeOrientationPointer.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NukeOrientationN FILE=ICONS\NukeOrientationN.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NukeOrientationNE FILE=ICONS\NukeOrientationNE.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NukeOrientationE FILE=ICONS\NukeOrientationE.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NukeOrientationSE FILE=ICONS\NukeOrientationSE.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NukeOrientationS FILE=ICONS\NukeOrientationS.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NukeOrientationSW FILE=ICONS\NukeOrientationSW.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NukeOrientationW FILE=ICONS\NukeOrientationW.bmp GROUP=Icons MIPS=OFF LODSET=0
#exec TEXTURE IMPORT NAME=NukeOrientationNW FILE=ICONS\NukeOrientationNW.bmp GROUP=Icons MIPS=OFF LODSET=0

#exec NEW TRUETYPEFONTFACTORY NAME=SonySketchEFA FONTNAME="Sony Sketch EF" HEIGHT=12 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=SonySketchEFB FONTNAME="Sony Sketch EF" HEIGHT=16 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=SonySketchEFC FONTNAME="Sony Sketch EF" HEIGHT=20 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=SonySketchEFD FONTNAME="Sony Sketch EF" HEIGHT=24 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=SonySketchEFE FONTNAME="Sony Sketch EF" HEIGHT=28 ANTIAlIAS=TRUE
#exec NEW TRUETYPEFONTFACTORY NAME=SonySketchEFF FONTNAME="Sony Sketch EF" HEIGHT=32 ANTIAlIAS=TRUE

#exec OBJ LOAD FILE=Textures\NukePointerRot.utx PACKAGE=NWNuclearLauncherVIII_SRC.NukePointerRot


var() Font AltitudeFont[6];
var() texture XTraceTex, YTraceTex;
var() texture RotPointerTex;
var() color PawnTargetColor, MachineTargetColor, PawnTargetTraceColor, MachineTargetTraceColor;
var() texture MachineTargetTex;
var() float MachineTargetScale;

var() texture NukeOrientBarTex, NukeOrientPointerTex, NukeOrientTex[9];
var() color NukeOrientBarColor, NukeOrientPointerColor, NukeOrientColor;
var() float NukeOrientScale;
var() float RotPointerScale;
var() int NukeOrientOffset;

var() int NukeAltitudeOffset, NukeAltitudePointerOffset;
var() byte NukeAltitudeBarDiv;
var() texture NukeAltitudeBarTex, NukeAltitudePointerTex1, NukeAltitudePointerTex2, NukeAltitudeIndicatorTex;
var() color NukeAltitudeBarColor, NukeAltitudePointerColor, NukeAltitudeTextColor, NukeAltitudeIndicatorColor;
var() float NukeAltitudeScale, NukeAltitudeInterval;

var() class<NuclearMissile> RegularNukeClass;

var float ZeroAltitude;
var name DetectedMachinesCache[32];
var name NonDetectedObjectsCache[32];
var int maxDetectedMachineClasses, maxNonDetectedMachineClasses;
var bool bInvertLists;
var float GuideSpeed, guidePawnTargetsRadius, guideMachineTargetsRadius;
var int enhancedFOV;
var bool enGuideOrientation, enGuideAltitude, enGuidePawnTargets, enGuideMachineTargets, enHidden, enTeamTargets;

var Pawn Guider;
var rotator OldGuiderRotation, GuidedRotation;
var float CurrentTimeStamp, LastUpdateTime, ClientBuffer, ServerUpdate;
var bool bUpdatePosition;
var bool bDestroyed;

var SavedMove SavedMoves;
var SavedMove FreeMoves;

var vector RealLocation, RealVelocity;
var NuclearLauncher NukeWeapon;

replication
{
    // Things the server should send to the client.
    unreliable if( Role==ROLE_Authority )
        ClientAdjustPosition, bDestroyed, NukeWeapon;
    unreliable if ( Role==ROLE_Authority && bNetOwner && bNetInitial)
        GuidedRotation, OldGuiderRotation;
    unreliable if( Role==ROLE_Authority && !bNetOwner )
        RealLocation, RealVelocity;
    unreliable if( Role==ROLE_AutonomousProxy )
        ServerMove;
	reliable if( Role==ROLE_Authority )
		ZeroAltitude, GuideSpeed, DetectedMachinesCache, NonDetectedObjectsCache, enhancedFOV, enGuideOrientation, 
		enGuideAltitude, enGuidePawnTargets, enGuideMachineTargets, guidePawnTargetsRadius, guideMachineTargetsRadius, 
		enHidden, enTeamTargets, bInvertLists, maxDetectedMachineClasses, maxNonDetectedMachineClasses;
}


function BeginPlay()
{
local byte i;

	if (Level.NetMode == NM_StandAlone || !bNetTemporary)
		bCanTeleport = Class'NWInfo'.default.bTeleProjectiles;
	
	if (SpawnSound != None)
		PlaySound(SpawnSound);
	
	if (NuclearLauncherClass.default.GuidedNukeSpeed > 0)
		GuideSpeed = NuclearLauncherClass.default.GuidedNukeSpeed;
	
	if (NuclearLauncherClass.default.bDestructableNuke)
	{
		bProjTarget = True;
		if (NuclearLauncherClass.default.MissileColRadius > 0 && NuclearLauncherClass.default.MissileColHeight > 0)
			SetCollisionSize(NuclearLauncherClass.default.MissileColRadius, NuclearLauncherClass.default.MissileColHeight);
		else
			SetCollisionSize(15.0, 8.0);
	}
	
	enhancedFOV = NuclearLauncherClass.default.GuidedFOVIncrease;
	enGuideOrientation = NuclearLauncherClass.default.enableHUDOrientation;
	enGuideAltitude = NuclearLauncherClass.default.enableHUDAltitude;
	enGuidePawnTargets = NuclearLauncherClass.default.enableHUDPawnTargets;
	enGuideMachineTargets = NuclearLauncherClass.default.enableHUDMachineTargets;
	guidePawnTargetsRadius = NuclearLauncherClass.default.MaxPawnsDetectionRadius;
	guideMachineTargetsRadius = NuclearLauncherClass.default.MaxMachinesDetectionRadius;
	enHidden = NuclearLauncherClass.default.checkHiddenTargets;
	enTeamTargets = NuclearLauncherClass.default.checkTeamTargets;
	bInvertLists = NuclearLauncherClass.default.bInvertListsProcessing;
	
	for (i = 0; i < ArrayCount(DetectedMachinesCache); i++)
		DetectedMachinesCache[i] = NuclearLauncherClass.default.DetectedMachines[i];
	for (i = 0; i < ArrayCount(NonDetectedObjectsCache); i++)
		NonDetectedObjectsCache[i] = NuclearLauncherClass.default.NonDetectedObjects[i];
	
	ZeroAltitude = FindZeroAltitude();
	SetTimeOut1(0.5, True);
	LoadLists();
}

function LoadLists()
{
local int i;

	maxDetectedMachineClasses = ArrayCount(DetectedMachinesCache);
	maxNonDetectedMachineClasses = ArrayCount(NonDetectedObjectsCache);
	
	if (NuclearLauncherClass.default.bOptimizeLists)
	{
		for (i = 0; i < ArrayCount(DetectedMachinesCache); i++)
		{
			if (DetectedMachinesCache[i] == '')
			{
				maxDetectedMachineClasses = i;
				break;
			}
		}
		
		for (i = 0; i < ArrayCount(NonDetectedObjectsCache); i++)
		{
			if (NonDetectedObjectsCache[i] == '')
			{
				maxNonDetectedMachineClasses = i;
				break;
			}
		}
	}
}

function TimedOut1()
{
	if ((Role == ROLE_Authority) && (Level.TimeSeconds - ServerUpdate > 4))
        Explode(Location,Vect(0,0,1));
}

simulated function Destroyed()
{
	bDestroyed = true;
	if ((PlayerPawn(Guider) != None))
	{
		PlayerPawn(Guider).ViewTarget = None;
		if (Level.NetMode != NM_DedicatedServer)
			PlayerPawn(Guider).DesiredFOV = PlayerPawn(Guider).DefaultFOV;
	}

	while (FreeMoves != None)
	{
		FreeMoves.Destroy();
		if (FreeMoves != None)
			FreeMoves = FreeMoves.NextMove;
		else
			FreeMoves = None;
	}

	while (SavedMoves != None)
	{
		SavedMoves.Destroy();
		if (SavedMoves != None)
			SavedMoves = SavedMoves.NextMove;
		else
			SavedMoves = None;
	}

	if ((Guider != None) && (Level.NetMode != NM_Client) && NukeWeapon != None)
	{
		NukeWeapon.GuidedShell = None;
		NukeWeapon.GotoState('Finishing');
	}
	
	Super.Destroyed();
}

simulated function Tick(float DeltaTime)
{
local int DeltaYaw, DeltaPitch;
local int YawDiff, PitchDiff;
local SavedMove NewMove;

	Super.Tick(DeltaTime);
	
	if (Level.NetMode != NM_DedicatedServer && PlayerPawn(Instigator) != None && 
	(PlayerPawn(Instigator).DesiredFov != PlayerPawn(Instigator).DefaultFov + enhancedFOV))
		PlayerPawn(Instigator).DesiredFov = PlayerPawn(Instigator).DefaultFov + enhancedFOV;

	if ( Level.NetMode == NM_Client )
	{
		if ((PlayerPawn(Instigator) != None) && (ViewPort(PlayerPawn(Instigator).Player) != None) )
		{
			Guider = Instigator;
			
			if ( bDestroyed || (Instigator.Health < 0) )
			{
				PlayerPawn(Instigator).ViewTarget = None;
				Destroy();
				if (NuclearLauncher(Instigator.Weapon) != None)
					NuclearLauncher(Instigator.Weapon).bGuiding = False;
				return;
			}
			
			PlayerPawn(Instigator).ViewTarget = Self;
			if (NuclearLauncher(Instigator.Weapon) != None)
			{
				NuclearLauncher(Instigator.Weapon).GuidedShell = Self;
				NuclearLauncher(Instigator.Weapon).bGuiding = True;
			}
		}
		else
		{
			if ( RealLocation != vect(0,0,0) )
			{
				SetLocation(RealLocation);
				RealLocation = vect(0,0,0);
			}
			if ( RealVelocity != vect(0,0,0) )
			{
				Velocity = RealVelocity;
				SetRotation(rotator(Velocity));
				RealVelocity = vect(0,0,0);
			}
			return;
		}
	}
	else if ((Level.NetMode != NM_Standalone) && (RemoteRole == ROLE_AutonomousProxy)) 
		return;

	// if server updated client position, client needs to replay moves after the update
	if (bUpdatePosition)
		ClientUpdatePosition();

	DeltaYaw = (Guider.ViewRotation.Yaw & 65535) - (OldGuiderRotation.Yaw & 65535);
	DeltaPitch = (Guider.ViewRotation.Pitch & 65535) - (OldGuiderRotation.Pitch & 65535);
	if ( DeltaPitch < -32768 )
		DeltaPitch += 65536;
	else if ( DeltaPitch > 32768 )
		DeltaPitch -= 65536;
	if ( DeltaYaw < -32768 )
		DeltaYaw += 65536;
	else if ( DeltaYaw > 32768 )
		DeltaYaw -= 65536;

	YawDiff = (Rotation.Yaw & 65535) - (GuidedRotation.Yaw & 65535) - DeltaYaw;
	if ( DeltaYaw < 0 )
	{
		if ( ((YawDiff > 0) && (YawDiff < 16384)) || (YawDiff < -49152) )
			GuidedRotation.Yaw += DeltaYaw;
	}   
	else if ( ((YawDiff < 0) && (YawDiff > -16384)) || (YawDiff > 49152) )
		GuidedRotation.Yaw += DeltaYaw;

	GuidedRotation.Pitch += DeltaPitch;
	OldGuiderRotation = Guider.ViewRotation;
	if ( Role == ROLE_AutonomousProxy )
	{
		// Send the move to the server
		// skip move if too soon
		if ( ClientBuffer < 0 )
		{
			ClientBuffer += DeltaTime;
			MoveRocket(DeltaTime, Velocity, GuidedRotation);
			return;
		}
		else
			ClientBuffer = ClientBuffer + DeltaTime - 80.0/PlayerPawn(Instigator).Player.CurrentNetSpeed;

		// I'm  a client, so I'll save my moves in case I need to replay them
		// Get a SavedMove actor to store the movement in.
		if ( SavedMoves == None )
		{
			SavedMoves = GetFreeMove();
			NewMove = SavedMoves;
		}
		else
		{
			NewMove = SavedMoves;
			while ( NewMove.NextMove != None )
				NewMove = NewMove.NextMove;
			NewMove.NextMove = GetFreeMove();
			NewMove = NewMove.NextMove;
		}

		NewMove.TimeStamp = Level.TimeSeconds;
		NewMove.Delta = DeltaTime;
		NewMove.Velocity = Velocity;
		NewMove.SetRotation(GuidedRotation);

		MoveRocket(DeltaTime, Velocity, GuidedRotation);
		ServerMove(Level.TimeSeconds, Location, NewMove.Rotation.Pitch, NewMove.Rotation.Yaw);
		return;
	}
	
	MoveRocket(DeltaTime, Velocity, GuidedRotation);
}


// Server sends ClientAdjustPosition to the client to adjust the warhead position on the client side when the error
// is excessive
simulated function ClientAdjustPosition( float TimeStamp, float NewLocX, float NewLocY, float NewLocZ, float NewVelX, float NewVelY, float NewVelZ)
{
local vector NewLocation;

	if ( CurrentTimeStamp > TimeStamp )
		return;
	CurrentTimeStamp = TimeStamp;

	NewLocation.X = NewLocX;
	NewLocation.Y = NewLocY;
	NewLocation.Z = NewLocZ;
	Velocity.X = NewVelX;
	Velocity.Y = NewVelY;
	Velocity.Z = NewVelZ;

	SetLocation(NewLocation);
	bUpdatePosition = true;
}

// Client calls this to replay moves after getting its position updated by the server
simulated function ClientUpdatePosition()
{
local SavedMove CurrentMove;
local int realbRun, realbDuck;
local bool bRealJump;

	bUpdatePosition = False;
	CurrentMove = SavedMoves;
	while ( CurrentMove != None )
	{
		if ( CurrentMove.TimeStamp <= CurrentTimeStamp )
		{
			SavedMoves = CurrentMove.NextMove;
			CurrentMove.NextMove = FreeMoves;
			FreeMoves = CurrentMove;
			FreeMoves.Clear();
			CurrentMove = SavedMoves;
		}
		else
		{
			MoveRocket(CurrentMove.Delta, CurrentMove.Velocity, CurrentMove.Rotation);
			CurrentMove = CurrentMove.NextMove;
		}
	}
}

// server moves the rocket based on clients input, and compares the resultant location to the client's view of the location
function ServerMove(float TimeStamp, vector ClientLoc, int Pitch, int Yaw)
{
local float ClientErr, DeltaTime;
local vector LocDiff;

	if ( CurrentTimeStamp >= TimeStamp )
		return;
	if ( CurrentTimeStamp > 0 )
		DeltaTime = TimeStamp - CurrentTimeStamp;
	
	CurrentTimeStamp = TimeStamp;
	GuidedRotation.Pitch = Pitch;
	GuidedRotation.Yaw = Yaw;
	if ( DeltaTime > 0 )    
		MoveRocket(DeltaTime, Velocity, GuidedRotation);
	
	if ( Level.TimeSeconds - LastUpdateTime > 0.3 )
		ClientErr = 10000;
	else if ( Level.TimeSeconds - LastUpdateTime > 0.07 )
	{
		LocDiff = Location - ClientLoc;
		ClientErr = LocDiff Dot LocDiff;
	}

	// If client has accumulated a noticeable positional error, correct him.
	if ( ClientErr > 3 )
	{
		LastUpdateTime = Level.TimeSeconds;
		ClientAdjustPosition(TimeStamp, Location.X, Location.Y, Location.Z, Velocity.X, Velocity.Y, Velocity.Z);
	}
}

simulated function MoveRocket(float DeltaTime, vector CurrentVelocity, rotator GuideRotation )
{
local int OldRoll, RollMag;
local rotator NewRot;
local float SmoothRoll;
local vector OldVelocity, X,Y,Z;

	if (Role == ROLE_Authority && (Guider == None || Guider.Health <= 0 || (Guider.IsA('PlayerPawn') && PlayerPawn(Guider).ViewTarget != self) 
	|| Guider.IsInState('FeigningDeath')) && !bDeleteMe)
	{
		if (NuclearLauncherClass.default.guidedNukeExplodeOnDeath || RegularNukeClass == None)
			Explode(Location,Vect(0,0,1));
		else
		{
			SetCollision(False, False, False);
			bProjTarget = False;
			bCollideWorld = False;
			Spawn(RegularNukeClass, Instigator,, Location, Rotation);
			Destroy();
		}
		
		return;
	}

	ServerUpdate = Level.TimeSeconds;
	OldRoll = Rotation.Roll & 65535;
	OldVelocity = CurrentVelocity;
	Velocity = CurrentVelocity + Vector(GuideRotation) * 1500 * DeltaTime;
	//Velocity = Normal(Velocity) * 550;
	if (GuideSpeed > 0)
		Velocity = Normal(Velocity) * GuideSpeed;
	else
		Velocity = Normal(Velocity) * speed;
	NewRot = Rotator(Velocity);

	// Roll Warhead based on acceleration
	GetAxes(NewRot, X,Y,Z);
	RollMag = int(10 * (Y Dot (Velocity - OldVelocity))/DeltaTime);
	if ( RollMag > 0 ) 
		NewRot.Roll = Min(12000, RollMag); 
	else
		NewRot.Roll = Max(53535, 65536 + RollMag);

	//smoothly change rotation
	if (NewRot.Roll > 32768)
	{
		if (OldRoll < 32768)
			OldRoll += 65536;
	}
	else if (OldRoll > 32768)
		OldRoll -= 65536;

	SmoothRoll = FMin(1.0, 5.0 * deltaTime);
	NewRot.Roll = NewRot.Roll * SmoothRoll + OldRoll * (1 - SmoothRoll);
	SetRotation(NewRot);

	if ( (Level.NetMode != NM_Standalone)
		&& ((Level.NetMode != NM_ListenServer) || (Instigator == None) 
			|| (Instigator.IsA('PlayerPawn') && (PlayerPawn(Instigator).Player != None)
				&& (ViewPort(PlayerPawn(Instigator).Player) == None))) )
		AutonomousPhysics(DeltaTime);

	if ( Role == ROLE_Authority )
	{
		RealLocation = Location;
		RealVelocity = Velocity;
	}
}

simulated function SavedMove GetFreeMove()
{
local SavedMove s;

	if ( FreeMoves == None )
		return Spawn(class'SavedMove');

	s = FreeMoves;
	FreeMoves = FreeMoves.NextMove;
	s.NextMove = None;
	return s; 
}

auto state Flying
{
	function BeginState()
	{
		ServerUpdate = Level.TimeSeconds;
		GuidedRotation = Rotation;
		OldGuiderRotation = Rotation;
		Velocity = speed*vector(Rotation);
		Acceleration = vect(0,0,0);
		if ((Level.NetMode != NM_Standalone) && (Role == ROLE_Authority))
		{
			if ((PlayerPawn(Instigator) != None)
				&& (ViewPort(PlayerPawn(Instigator).Player) != None) )
				RemoteRole = ROLE_SimulatedProxy;
			else
				RemoteRole = ROLE_AutonomousProxy;
		}
	}
}

simulated function PostRender(canvas Canvas)
{
local Pawn ClosestP;
local Actor A, ClosestM;
local vector XYCoord, ClosestPXY, ClosestMXY, CntXY;
local float MaxDist, dist, closestPDist, closestMDist;
local byte i;
local float Scale, YawAngle, ScrollX, IntervalX, cRed, cGreen, cBlue;
local float Altitude, altInterval, altDif, maxHUDAlt, curScrollY, curAlt;
local float TextX, TextY;
	
	Canvas.Style = ERenderStyle.STY_Translucent;
	Scale = Canvas.ClipY / 480;
	CntXY.X = int(Canvas.ClipX/2);
	CntXY.Y = int(Canvas.ClipY/2);
	MaxDist = Fmax( 100, FMax(guidePawnTargetsRadius, guideMachineTargetsRadius));
	
	//Targets system render
	if (enGuidePawnTargets || enGuideMachineTargets)
	{
		ForEach VisibleCollidingActors(Class'Actor', A, MaxDist,, !enHidden)
		{
			if (isValidTarget(A))
			{
				dist = VSize(A.Location - Location);
				if (enGuideMachineTargets && isMachine(A) && Class'NWUtils'.static.ActorToCanvas(XYCoord, A, Canvas))
				{
					if (ClosestM == None || dist < VSize(ClosestM.Location - Location))
					{
						ClosestM = A;
						closestMDist = VSize(ClosestM.Location - Location);
						ClosestMXY = XYCoord;
					}
					
					Canvas.bNoSmooth = False;
					cRed = FMax(0, (guideMachineTargetsRadius - dist) * MachineTargetColor.R / guideMachineTargetsRadius);
					cGreen = FMax(0, (guideMachineTargetsRadius - dist) * MachineTargetColor.G / guideMachineTargetsRadius);
					cBlue = FMax(0, (guideMachineTargetsRadius - dist) * MachineTargetColor.B / guideMachineTargetsRadius);
					Canvas.DrawColor.R = cRed;
					Canvas.DrawColor.G = cGreen;
					Canvas.DrawColor.B = cBlue;
					
					Canvas.SetPos(XYCoord.X - MachineTargetTex.USize*MachineTargetScale*Scale/2, XYCoord.Y - MachineTargetTex.VSize*MachineTargetScale*Scale/2);
					Canvas.DrawIcon(MachineTargetTex, Scale*MachineTargetScale);
				}
				else if (enGuidePawnTargets && Pawn(A) != None && Class'NWUtils'.static.ActorToCanvas(XYCoord, A, Canvas))
				{
					if (ClosestP == None || dist < VSize(ClosestP.Location - Location))
					{
						ClosestP = Pawn(A);
						closestPDist = VSize(ClosestP.Location - Location);
						ClosestPXY = XYCoord;
					}
					
					Canvas.bNoSmooth = False;
					cRed = FMax(0, (guidePawnTargetsRadius - dist) * PawnTargetColor.R / guidePawnTargetsRadius);
					cGreen = FMax(0, (guidePawnTargetsRadius - dist) * PawnTargetColor.G / guidePawnTargetsRadius);
					cBlue = FMax(0, (guidePawnTargetsRadius - dist) * PawnTargetColor.B / guidePawnTargetsRadius);
					Canvas.DrawColor.R = cRed;
					Canvas.DrawColor.G = cGreen;
					Canvas.DrawColor.B = cBlue;
					
					Canvas.SetPos(XYCoord.X - RotPointerTex.USize*RotPointerScale*Scale/2, XYCoord.Y - RotPointerTex.VSize*RotPointerScale*Scale/2);
					Canvas.DrawIcon(RotPointerTex, Scale*RotPointerScale);
				}
			}
		}
	
		if (ClosestP != None)
		{
			Canvas.bNoSmooth = True;
			cRed = FMax(0, (guidePawnTargetsRadius - closestPDist) * PawnTargetTraceColor.R / guidePawnTargetsRadius);
			cGreen = FMax(0, (guidePawnTargetsRadius - closestPDist) * PawnTargetTraceColor.G / guidePawnTargetsRadius);
			cBlue = FMax(0, (guidePawnTargetsRadius - closestPDist) * PawnTargetTraceColor.B / guidePawnTargetsRadius);
			Canvas.DrawColor.R = cRed;
			Canvas.DrawColor.G = cGreen;
			Canvas.DrawColor.B = cBlue;
			
			Canvas.SetPos(ClosestPXY.X, 0);
			Canvas.DrawRect(XTraceTex, 8.0, Canvas.ClipY);
			Canvas.SetPos(0, ClosestPXY.Y);
			Canvas.DrawRect(YTraceTex, Canvas.ClipX, 8.0);
		}
		
		if (ClosestM != None)
		{
			Canvas.bNoSmooth = True;
			cRed = FMax(0, (guideMachineTargetsRadius - closestMDist) * MachineTargetTraceColor.R / guideMachineTargetsRadius);
			cGreen = FMax(0, (guideMachineTargetsRadius - closestMDist) * MachineTargetTraceColor.G / guideMachineTargetsRadius);
			cBlue = FMax(0, (guideMachineTargetsRadius - closestMDist) * MachineTargetTraceColor.B / guideMachineTargetsRadius);
			Canvas.DrawColor.R = cRed;
			Canvas.DrawColor.G = cGreen;
			Canvas.DrawColor.B = cBlue;
			
			Canvas.SetPos(ClosestMXY.X, 0);
			Canvas.DrawRect(XTraceTex, 8.0, Canvas.ClipY);
			Canvas.SetPos(0, ClosestMXY.Y);
			Canvas.DrawRect(YTraceTex, Canvas.ClipX, 8.0);
		}
	}
	
	//Orientation system render
	if (enGuideOrientation)
	{
		Canvas.bNoSmooth = True;
		Canvas.DrawColor = NukeOrientBarColor;
		Canvas.SetPos(CntXY.X - 128*Scale*NukeOrientScale, CntXY.Y + NukeOrientOffset*Scale);
		Canvas.DrawIcon(NukeOrientBarTex, Scale*NukeOrientScale);
		
		Canvas.bNoSmooth = False;
		YawAngle = Normalize(Rotation).Yaw;
		if (YawAngle < 0)
			YawAngle = (32768 - Abs(YawAngle)) + 32768;
		IntervalX = 96*Scale*NukeOrientScale;
		ScrollX = YawAngle*IntervalX*8 / 65536;
		for (i = 0; i < ArrayCount(NukeOrientTex); i++)
		{
			Canvas.SetPos((CntXY.X - 32*Scale*NukeOrientScale) + i*IntervalX - ScrollX, CntXY.Y + NukeOrientOffset*Scale);
			cRed = FMax(0, (96 - Abs(i*IntervalX - ScrollX)/(Scale*NukeOrientScale)) * NukeOrientColor.R / 96);
			cGreen = FMax(0, (96 - Abs(i*IntervalX - ScrollX)/(Scale*NukeOrientScale)) * NukeOrientColor.G / 96);
			cBlue = FMax(0, (96 - Abs(i*IntervalX - ScrollX)/(Scale*NukeOrientScale)) * NukeOrientColor.B / 96);
			
			if (cRed > 0 || cGreen > 0 || cBlue > 0)
			{
				Canvas.DrawColor.R = cRed;
				Canvas.DrawColor.G = cGreen;
				Canvas.DrawColor.B = cBlue;
				Canvas.DrawIcon(NukeOrientTex[i], Scale*NukeOrientScale);
				
				Canvas.SetPos((CntXY.X - 16*Scale*NukeOrientScale) + i*IntervalX - ScrollX, CntXY.Y + (NukeOrientOffset-32*NukeOrientScale)*Scale);
				Canvas.DrawColor.R = byte(FMax(0, (96 - Abs(i*IntervalX - ScrollX)/(Scale*NukeOrientScale)) * NukeOrientPointerColor.R / 96));
				Canvas.DrawColor.G = FMax(0, (96 - Abs(i*IntervalX - ScrollX)/(Scale*NukeOrientScale)) * NukeOrientPointerColor.G / 96);
				Canvas.DrawColor.B = FMax(0, (96 - Abs(i*IntervalX - ScrollX)/(Scale*NukeOrientScale)) * NukeOrientPointerColor.B / 96);
				Canvas.DrawIcon(NukeOrientPointerTex, Scale*NukeOrientScale);
			}
		}
	}
	
	//Altitude system render
	if (enGuideAltitude)
	{
		Canvas.bNoSmooth = True;
		Canvas.DrawColor = NukeAltitudeBarColor;
		Canvas.SetPos(CntXY.X + NukeAltitudeOffset*Scale, CntXY.Y - 128*Scale*NukeAltitudeScale);
		Canvas.DrawIcon(NukeAltitudeBarTex, Scale*NukeAltitudeScale);
		Canvas.SetPos(CntXY.X - NukeAltitudeOffset*Scale - 64*Scale*NukeAltitudeScale, CntXY.Y - 128*Scale*NukeAltitudeScale);
		Canvas.DrawIcon(NukeAltitudeBarTex, Scale*NukeAltitudeScale);
		
		Canvas.bNoSmooth = False;
		Altitude = Location.Z - ZeroAltitude;
		altInterval = ((NukeAltitudeBarTex.VSize - 64)  * Scale * NukeAltitudeScale) / NukeAltitudeBarDiv;
		maxHUDAlt = ((NukeAltitudeBarTex.VSize - 64)/2) * Scale * NukeAltitudeScale;
		altDif = NukeAltitudeInterval - ((Altitude/NukeAltitudeInterval) - int(Altitude/NukeAltitudeInterval))*NukeAltitudeInterval;
		curScrollY = -(altInterval*(NukeAltitudeBarDiv/2) + altDif*altInterval/NukeAltitudeInterval);
		curAlt = int(Altitude) + int(altDif) + NukeAltitudeInterval*(NukeAltitudeBarDiv/2);
		if (Altitude > 0)
			curAlt += 1;
		
		Canvas.bNoSmooth = False;
		for (i = 0; i <= (NukeAltitudeBarDiv+1); i++)
		{
			cRed = FMax(0, (maxHUDAlt - Abs(curScrollY))*NukeAltitudePointerColor.R/maxHUDAlt);
			cGreen = FMax(0, (maxHUDAlt - Abs(curScrollY))*NukeAltitudePointerColor.G/maxHUDAlt);
			cBlue = FMax(0, (maxHUDAlt - Abs(curScrollY))*NukeAltitudePointerColor.B/maxHUDAlt);
			Canvas.DrawColor.R = cRed;
			Canvas.DrawColor.G = cGreen;
			Canvas.DrawColor.B = cBlue;
			
			if (cRed > 0 || cGreen > 0 || cBlue > 0)
			{
				Canvas.SetPos(CntXY.X + (NukeAltitudeOffset+NukeAltitudePointerOffset)*Scale, CntXY.Y + curScrollY - 8*Scale*NukeAltitudeScale);
				Canvas.DrawIcon(NukeAltitudePointerTex1, Scale*NukeAltitudeScale);
				Canvas.SetPos(CntXY.X - (NukeAltitudeOffset+NukeAltitudePointerOffset)*Scale - 32*Scale*NukeAltitudeScale, CntXY.Y + curScrollY - 8*Scale*NukeAltitudeScale);
				Canvas.DrawIcon(NukeAltitudePointerTex2, Scale*NukeAltitudeScale);
				
				cRed = FMax(0, (maxHUDAlt - Abs(curScrollY))*NukeAltitudeTextColor.R/maxHUDAlt);
				cGreen = FMax(0, (maxHUDAlt - Abs(curScrollY))*NukeAltitudeTextColor.G/maxHUDAlt);
				cBlue = FMax(0, (maxHUDAlt - Abs(curScrollY))*NukeAltitudeTextColor.B/maxHUDAlt);
				Canvas.DrawColor.R = cRed;
				Canvas.DrawColor.G = cGreen;
				Canvas.DrawColor.B = cBlue;
				
				Canvas.bCenter = False;
				Canvas.Font = AltitudeFont[Class'NWUtils'.static.getResolutionFontCoef(Canvas)];
				Canvas.TextSize(int(curAlt), TextX, TextY);
				Canvas.SetPos(CntXY.X + (NukeAltitudeOffset)*Scale + (32*Scale*NukeAltitudeScale) - (TextX/2), CntXY.Y + curScrollY - (TextY/2));
				Canvas.DrawText(int(curAlt));
				Canvas.SetPos(CntXY.X - (NukeAltitudeOffset)*Scale - (32*Scale*NukeAltitudeScale) - (TextX/2), CntXY.Y + curScrollY - (TextY/2));
				Canvas.DrawText(int(curAlt));
			}
			
			curScrollY += altInterval;
			curAlt -= NukeAltitudeInterval;
		}
		
		Canvas.bNoSmooth = False;
		Canvas.DrawColor = NukeAltitudeIndicatorColor;
		Canvas.SetPos(CntXY.X + (NukeAltitudeOffset)*Scale - (32*Scale*NukeAltitudeScale), CntXY.Y - 16*Scale*NukeAltitudeScale);
		Canvas.DrawIcon(NukeAltitudeIndicatorTex, Scale*NukeAltitudeScale);
		Canvas.SetPos(CntXY.X - (NukeAltitudeOffset)*Scale - (96*Scale*NukeAltitudeScale), CntXY.Y - 16*Scale*NukeAltitudeScale);
		Canvas.DrawIcon(NukeAltitudeIndicatorTex, Scale*NukeAltitudeScale);
	}
}

function float FindZeroAltitude()
{
local float zeroAlt;
local PlayerStart PS;

	zeroAlt = 65536;
	ForEach AllActors(Class'PlayerStart', PS)
	{
		if (PS.bEnabled && PS.Location.Z < zeroAlt)
			zeroAlt = PS.Location.Z;
	}
	
	return zeroAlt;
}

function bool isMachine(Actor A)
{
local int i;

	if (A == None)	return False;	
	
	if (bInvertLists)
	{
		for (i = maxDetectedMachineClasses-1; i >= 0; i--)
		{
			if (DetectedMachinesCache[i] != '' && A.IsA(DetectedMachinesCache[i]))
				return True;
		}
	}
	else
	{
		for (i = 0; i < maxDetectedMachineClasses; i++)
		{
			if (DetectedMachinesCache[i] != '' && A.IsA(DetectedMachinesCache[i]))
				return True;
		}
	}
	
	return False;
}

simulated function bool isValidTarget(Actor A)
{
local int i;

	if (A == None)	
		return False;
	if (!enTeamTargets && NukeWeapon != None && NukeWeapon.isTeamMember(A))
		return False;

	if (bInvertLists)
	{
		for (i = maxNonDetectedMachineClasses-1; i >= 0; i--)
		{
			if (NonDetectedObjectsCache[i] != '' && A.IsA(NonDetectedObjectsCache[i]))
				return False;
		}
	}
	else
	{
		for (i = 0; i < maxNonDetectedMachineClasses; i++)
		{
			if (NonDetectedObjectsCache[i] != '' && A.IsA(NonDetectedObjectsCache[i]))
				return False;
		}
	}
	
	return True;
}

// Nuclear Warning mutator stuff
function InitNukeWarn();

function int getImpactArea(Actor A)
{
	return -1;
}

function string getNukeInfoText()
{
	return defaultInfoText;
}

function color getNukeInfoColor()
{
	return defaultInfoColor;
}

defaultproperties
{
	bClientOnlySmokeGen=False

	RemoteRole=ROLE_DumbProxy
	NetPriority=3.000000
	bOwnerNoSee=True
	speed=750.000000
	RegularNukeClass=Class'NuclearMissileSoundless'
	
	XTraceTex=NukeXTrace
	YTraceTex=NukeYTrace
	RotPointerTex=NukePointer01
	RotPointerScale=0.350000
	PawnTargetColor=(R=255,G=0,B=0)
	MachineTargetColor=(R=0,G=255,B=255)
	PawnTargetTraceColor=(R=128,G=128,B=128)
	MachineTargetTraceColor=(R=128,G=128,B=128)
	MachineTargetTex=MachTarget
	MachineTargetScale=0.750000
	
	defaultInfoText="-Guiding-"
	
	NukeOrientBarTex=NukeOrientationBar
	NukeOrientPointerTex=NukeOrientationPointer
	NukeOrientTex(0)=NukeOrientationN
	NukeOrientTex(1)=NukeOrientationNE
	NukeOrientTex(2)=NukeOrientationE
	NukeOrientTex(3)=NukeOrientationSE
	NukeOrientTex(4)=NukeOrientationS
	NukeOrientTex(5)=NukeOrientationSW
	NukeOrientTex(6)=NukeOrientationW
	NukeOrientTex(7)=NukeOrientationNW
	NukeOrientTex(8)=NukeOrientationN
	NukeOrientBarColor=(R=96,G=96,B=96)
	NukeOrientPointerColor=(R=128,G=128,B=128)
	NukeOrientColor=(R=192,G=192,B=192)
	NukeOrientOffset=144
	NukeOrientScale=0.750000
	
	AltitudeFont(0)=Font'SonySketchEFA'
	AltitudeFont(1)=Font'SonySketchEFB'
	AltitudeFont(2)=Font'SonySketchEFC'
	AltitudeFont(3)=Font'SonySketchEFD'
	AltitudeFont(4)=Font'SonySketchEFE'
	AltitudeFont(5)=Font'SonySketchEFF'
	NukeAltitudeBarTex=NukeAltitudeBar
	NukeAltitudePointerTex1=NukeAltitudePointer1
	NukeAltitudePointerTex2=NukeAltitudePointer2
	NukeAltitudeOffset=216
	NukeAltitudePointerOffset=54
	NukeAltitudeBarDiv=6
	NukeAltitudeScale=1.000000
	NukeAltitudeInterval=125.000000
	NukeAltitudeBarColor=(R=96,G=96,B=96)
	NukeAltitudePointerColor=(R=128,G=128,B=128)
	NukeAltitudeTextColor=(R=192,G=192,B=192)
	NukeAltitudeIndicatorTex=NukeAltitudeIndicator
	NukeAltitudeIndicatorColor=(R=192,G=192,B=192)
	
	bSetupClientSpeed=False
	
	NuclearBlastClass=Class'Shockwave'
	bIgnoreHitNormal=True
	NuclearLauncherClass=Class'NuclearLauncher'
	NuclearBlastCustomRot=(Pitch=0,Yaw=0,Roll=0)
}
