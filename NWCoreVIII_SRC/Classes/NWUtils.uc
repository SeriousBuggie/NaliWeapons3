//////////////////////////////////////////////////////////////
//	Nali Weapons III general Utils class
//				Feralidragon (16-07-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////
class NWUtils expands NaliWActor config(NWConfig)
abstract;

var() class ValidTextureClasses[8];

var() class<Effects> WaterProjSplashClass[8];
var() class<Effects> SlimeProjSplashClass[8];
var() class<Effects> LavaProjSplashClass[8];
var() class<Effects> WaterBallisticSplashClass[4];
var() class<Effects> SlimeBallisticSplashClass[4];
var() class<Effects> LavaBallisticSplashClass[4];
var() class<NWWaterSplashRing> WaterProjRingClass, SlimeProjRingClass, LavaProjRingClass;


//Get arcSin from a number f
simulated static function float aSin(float f)
{
	if (f < -1.0 || f > 1.0)
		return 0.0;
	if (f == 1)
		return (PI/2);
	if (f == -1)
		return (-PI/2);
	return aTan(f/Sqrt(1 - f*f));
}

//Get arcCos from a number f
simulated static function float aCos(float f)
{
local float alpha;

	if (f < -1.0 || f > 1.0)
		return 0.0;
	if (f == 0)
		return (PI/2);
	alpha = aTan(Sqrt(1 - f*f)/f);
	if (alpha < 0.0)
		alpha += PI;
	return alpha;
}

//Process actor detail
simulated static function processActorDetail(LevelInfo Lvl, Actor A, bool bLight, float distDetail)
{
local NWInvLightFX NWLightFX;
local bool bSpawnLightFX;

	if (Lvl == None || A == None)
		return;
	
	bSpawnLightFX = (NaliWeapons(A) != None || NaliAmmo(A) != None || NaliPickups(A) != None);
	if (bSpawnLightFX && Lvl.NetMode != NM_StandAlone && Lvl.NetMode != NM_DedicatedServer && A.default.LightType != LT_None)
	{
		if (NaliWeapons(A) != None)
			NWLightFX = NaliWeapons(A).NWLightFX;
		else if (NaliAmmo(A) != None)
			NWLightFX = NaliAmmo(A).NWLightFX;
		else if (NaliPickups(A) != None)
			NWLightFX = NaliPickups(A).NWLightFX;
	
		if (NWLightFX == None)
		{
			NWLightFX = A.Spawn(Class'NWInvLightFX', A);
			NWLightFX.LightType = A.LightType;
			NWLightFX.savedLightType = A.LightType;
			NWLightFX.LightEffect = A.LightEffect;
			NWLightFX.LightBrightness = A.LightBrightness;
			NWLightFX.LightHue = A.LightHue;
			NWLightFX.LightSaturation = A.LightSaturation;
			NWLightFX.LightRadius = A.LightRadius;
			NWLightFX.LightPeriod = A.LightPeriod;
			NWLightFX.LightPhase = A.LightPhase;
			NWLightFX.LightCone = A.LightCone;
			
			if (NaliWeapons(A) != None)
				NaliWeapons(A).NWLightFX = NWLightFX;
			else if (NaliAmmo(A) != None)
				NaliAmmo(A).NWLightFX = NWLightFX;
			else if (NaliPickups(A) != None)
				NaliPickups(A).NWLightFX = NWLightFX;
		}
		
		NWLightFX.isEnabled = bLight;
		if (NWLightFX.isEnabled)
			NWLightFX.LightType = NWLightFX.savedLightType;
		else
			NWLightFX.LightType = LT_None;
		
		A.LightType = LT_None;
	}
	else if (bLight)
		A.LightType = A.default.LightType;
	else
		A.LightType = LT_None;

	if (Lvl.NetMode != NM_DedicatedServer)
		A.LODBias = FMax(1.0, distDetail*Class'NWInfo'.default.MaxLODBias/255);
}

//Get currently loaded NWKillMsgManager
static function NWKillMsgManager getKillMsgManager(LevelInfo Lvl)
{
local Mutator M;

	for (M = Lvl.Game.MessageMutator; M != None; M = M.NextMessageMutator)
	{
		if (NWKillMsgManager(M) != None)
			return NWKillMsgManager(M);
	}
	return None;
}

//Is monster game?
static function bool isMonsterGame(LevelInfo Lvl)
{
local byte i;
local NWMutator NWM;
local int NWMOut;

	if (Lvl == None)
		return False;
		
	NWM = getNWMutator(Lvl, (Lvl.NetMode != NM_StandAlone && Lvl.NetMode != NM_DedicatedServer));
	if (NWM != None)
	{
		NWMOut = NWM.isMonsterGame();
		if (NWMOut >= 0)
			return Bool(NWMOut);
	}

	for (i = 0; i < ArrayCount(Class'NWInfo'.default.MonsterGametypes); i++)
	{
		if (Class'NWInfo'.default.MonsterGametypes[i] != '' && Lvl.Game.IsA(Class'NWInfo'.default.MonsterGametypes[i]))
			return True;
	}
	return False;
}


//Check if is friend
static function bool isFriend(Pawn P, LevelInfo Lvl, optional Pawn Instig, optional byte team, 
optional bool bNoHurtTeam, optional bool bNoHurtInstig, optional string ownerName, optional Actor src)
{
local Pawn PFind;
local bool isTeamGame;
local NWMutator NWM;
local int NWMOut;

	if (Lvl == None || P == None)
		return False;
	isTeamGame = Lvl.Game.bTeamGame;
	if (Instig != None && Instig.bDeleteMe)
		Instig = None;
		
	NWM = getNWMutator(Lvl, (Lvl.NetMode != NM_StandAlone && Lvl.NetMode != NM_DedicatedServer));
	if (NWM != None)
	{
		NWMOut = NWM.isFriend(P, Instig, team, bNoHurtTeam, bNoHurtInstig, ownerName, src);
		if (NWMOut >= 0)
			return Bool(NWMOut);
	}
	
	if (Instig == None)
	{
		if (ownerName != "")
		{
			for (PFind = Lvl.PawnList; PFind != None; PFind = PFind.NextPawn)
			{
				if (PFind.PlayerReplicationInfo != None && PFind.PlayerReplicationInfo.PlayerName ~= ownerName)
				{
					Instig = PFind;
					if (src != None)
						src.Instigator = Instig;
					if (NaliWPawn(src) != None && (NaliWPawn(src).MasterPawn == None || NaliWPawn(src).MasterPawn.bDeleteMe))
						NaliWPawn(src).setMaster(Instig);
					break;
				}
			}
			
			if (Instig == None && isTeamGame)
			{
				if (static.isMonsterGame(Lvl))
				{
					if (static.isMonster(P))
						return False;
					if (bNoHurtTeam)
						return True;
				}
									
				if (bNoHurtTeam)
				{
					if (NaliWPawn(P) != None)
						return NaliWPawn(P).SameTeamAs(team);
					return (P.PlayerReplicationInfo != None && P.PlayerReplicationInfo.Team == team);
				}
			}
		}
		
		if (Instig == None)
			return False;
	}
	
	if (P == Instig || (NaliWPawn(P) != None && Instig == NaliWPawn(P).MasterPawn))
		return bNoHurtInstig;
	if (Class'NWInfo'.default.enableFriendlyFire)
		return False;
						
	if (static.isMonsterGame(Lvl))
	{
		if (static.isMonster(P) || static.isMonster(Instig) || (NaliWPawn(P) != None && 
		NaliWPawn(P).MasterPawn != None && static.isMonster(NaliWPawn(P).MasterPawn)))
			return False;
		else if (bNoHurtTeam)
			return True;
	}
	
	if (bNoHurtTeam && isTeamGame && Instig.PlayerReplicationInfo != None)
	{
		if (P.PlayerReplicationInfo != None && P.PlayerReplicationInfo.Team == Instig.PlayerReplicationInfo.Team)
			return True;
		if (StationaryPawn(P) != None && StationaryPawn(P).SameTeamAs(Instig.PlayerReplicationInfo.Team))
			return True;
	}
	
	return False;
}

//Is from the same monster team
static function bool isSameHorde(Pawn P, Pawn Instig, LevelInfo Lvl)
{
local NWMutator NWM;
local int NWMOut;

	NWM = getNWMutator(Lvl, (Lvl.NetMode != NM_StandAlone && Lvl.NetMode != NM_DedicatedServer));
	if (NWM != None)
	{
		NWMOut = NWM.isSameHorde(P, Instig);
		if (NWMOut >= 0)
			return Bool(NWMOut);
	}
	
	if (DeathMatchPlus(Lvl.Game) == None)
	{
		if (ScriptedPawn(P) != None && ScriptedPawn(Instig) != None && 
		ScriptedPawn(P).TeamTag != '' && ScriptedPawn(P).TeamTag == ScriptedPawn(Instig).TeamTag)
			return True;
		if (PlayerPawn(Instig) != None && PlayerPawn(P) == None && (P.AttitudeToPlayer == ATTITUDE_Friendly || P.AttitudeToPlayer == ATTITUDE_Follow))
			return True;
		if (PlayerPawn(P) != None && PlayerPawn(Instig) == None && (Instig.AttitudeToPlayer == ATTITUDE_Friendly || Instig.AttitudeToPlayer == ATTITUDE_Follow))
			return True;
	}
	return False;
}

//Check if same team
simulated static function bool isTeamMember(Pawn PSource, Actor A)
{
local NWMutator NWM;
local int NWMOut;
local LevelInfo Lvl;

	if (PSource != None)
		Lvl = PSource.Level;
	else if (A != None)
		Lvl = A.Level;
		
	if (Lvl != None)
	{
		NWM = getNWMutator(Lvl, (Lvl.NetMode != NM_StandAlone && Lvl.NetMode != NM_DedicatedServer));
		if (NWM != None)
		{
			NWMOut = NWM.isTeamMember(PSource, A);
			if (NWMOut >= 0)
				return Bool(NWMOut);
		}
	}
	
	if (Pawn(A) == None || PSource == None || PSource.PlayerReplicationInfo == None)
		return False;
	if (NaliWPawn(A) != None && NaliWPawn(A).MyTeam == PSource.PlayerReplicationInfo.Team)
		return True;
	if (StationaryPawn(A) != None && StationaryPawn(A).SameTeamAs(PSource.PlayerReplicationInfo.Team))
		return True;
	if (Pawn(A).PlayerReplicationInfo == None)
		return False;
	if (Pawn(A).PlayerReplicationInfo.Team == PSource.PlayerReplicationInfo.Team)
		return True;
	return False;
}

//Get team
simulated static function byte getTeam(Actor A)
{
local NWMutator NWM;
local int NWMOut;

	if (A != None)
	{
		NWM = getNWMutator(A.Level, (A.Level.NetMode != NM_StandAlone && A.Level.NetMode != NM_DedicatedServer));
		if (NWM != None)
		{
			NWMOut = NWM.getTeam(A);
			if (NWMOut >= 0)
				return Byte(NWMOut);
		}
	}
	
	if (Pawn(A) == None)
		return 255;
	if (NaliWPawn(A) != None)
		return NaliWPawn(A).MyTeam;
	if (StationaryPawn(A) != None)
		return 255;
	if (Pawn(A).PlayerReplicationInfo == None)
		return 255;
	return Pawn(A).PlayerReplicationInfo.Team;
}


//Is valid target? (for actors that must be treated as pawn targets)
simulated static function bool isValidTarget(Actor A, optional bool ignoreStationaryPawn)
{
local NWMutator NWM;
local int NWMOut;

	if (A != None)
	{
		NWM = getNWMutator(A.Level, (A.Level.NetMode != NM_StandAlone && A.Level.NetMode != NM_DedicatedServer));
		if (NWM != None)
		{
			NWMOut = NWM.isValidTarget(A, ignoreStationaryPawn);
			if (NWMOut >= 0)
				return Bool(NWMOut);
		}
	}
	
	if (Pawn(A) == None)
		return False;
	if (ignoreStationaryPawn && StationaryPawn(A) != None && NaliWPawn(A) == None)
		return False;
	return True;
}

//Is valid heal? (for heal modifier processing)
static function bool processFiredHealth(int hAmount, Pawn P, Pawn ObjInstig, optional bool noHealth)
{
	if (P == None || (P == ObjInstig && !Class'NaliWeapons'.default.canHealOwner))
		return False;
	
	if (!noHealth)
	{
		if (Class'NaliWeapons'.default.healFixedValue > 0)
			P.Health += Class'NaliWeapons'.default.healFixedValue;
		else
			P.Health += Max(1, Int(hAmount * Class'NaliWeapons'.default.healMultiplier));
		if (P.Health > Class'NWInfo'.default.MaxHealth)
			P.Health = Class'NWInfo'.default.MaxHealth;
	}
	return True;
}

//Identify actor team by its position in the world
static function byte IdentifyTeam(LevelInfo Lvl, Actor A, out ControlPoint CPTeam, out PlayerStart PSTeam, out FortStandard FSTeam, out byte bHaveFort)
{
local NavigationPoint NP, NPRed, NPBlue;
local float NPDistA, NPDistB, NPCentral;
local ControlPoint CP;
local PlayerStart PS;
local FortStandard FS;
local Pawn P;

	if (Lvl.Game == None)
		return 255;

	NP = Lvl.NavigationPointList;
	if (Lvl.Game.IsA('CTFGame'))
	{
		while (NP != None && (NPRed == None || NPBlue == None))
		{
			if (FlagBase(NP) != None)
			{
				if (FlagBase(NP).Team == 0)
					NPRed = NP;
				else if (FlagBase(NP).Team == 1)
					NPBlue = NP;
			}
			NP = NP.nextNavigationPoint;
		}
		
		if (NPRed != None && NPBlue != None)
		{
			NPCentral = VSize(NPRed.Location - NPBlue.Location) / 2;
			NPDistA = VSize(NPRed.Location - A.Location);
			NPDistB = VSize(NPBlue.Location - A.Location);
			
			if (NPDistA < NPDistB && Abs(NPDistA - NPCentral) > Class'NWInfo'.default.MaxTeamCenterAbsTolerance)
				return 0;
			else if (NPDistB < NPDistA && Abs(NPDistB - NPCentral) > Class'NWInfo'.default.MaxTeamCenterAbsTolerance)
				return 1;
		}
	}
	else if (Lvl.Game.IsA('Assault'))
	{
		while (NP != None)
		{
			if (PlayerStart(NP) != None)
			{
				if (PS == None || (VSize(A.Location - NP.Location) < VSize(A.Location - PS.Location)))
					PS = PlayerStart(NP);
			}
			NP = NP.nextNavigationPoint;
		}
			
		P = Lvl.PawnList;
		while (P != None)
		{
			if (FortStandard(P) != None)
			{
				if (FS == None || (VSize(A.Location - P.Location) < VSize(A.Location - FS.Location)))
					FS = FortStandard(P);
			}
			P = P.nextPawn;
		}
		
		PSTeam = PS;
		FSTeam = FS;
		If (Assault(Lvl.Game).Attacker != None && Assault(Lvl.Game).Defender != None)
		{
			if (FS != None && VSize(PS.Location - A.Location) > VSize(FS.Location - A.Location))
			{
				bHaveFort = 1;
				return Assault(Lvl.Game).Defender.TeamIndex;
			}
			else
				FSTeam = None;
				
			if (PS.TeamNumber == 1)
				return Assault(Lvl.Game).Attacker.TeamIndex;
			else
				return Assault(Lvl.Game).Defender.TeamIndex;
		}
		else
			return PS.TeamNumber;
	}
	else if (Lvl.Game.IsA('Domination'))
	{
		while (NP != None)
		{
			if (ControlPoint(NP) != None)
			{
				if (CP == None || (VSize(A.Location - NP.Location) < VSize(A.Location - CP.Location)))
					CP = ControlPoint(NP);
			}
			NP = NP.nextNavigationPoint;
		}
		
		CPTeam = CP;
		if (CP.Controller != None)
			return CP.Controller.PlayerReplicationInfo.Team;
	}
	
	return 255;
}


//Get current team based on ready map data gathered using IdentifyTeam above
static function byte GetCurrentTeam(Actor A, LevelInfo Lvl, byte defaultColor, byte PTeam, optional ControlPoint CPTeam, optional PlayerStart PSTeam, 
optional FortStandard FSTeam, optional byte bHaveFort)
{
	if (CPTeam != None || PSTeam != None || PTeam < 4)
	{
		if (CPTeam != None)
		{
			if (CPTeam.Controller != None)
				return CPTeam.Controller.PlayerReplicationInfo.Team;
			return 255;
		}
		else if (PSTeam != None && Assault(Lvl.Game) != None)
		{
			if (Assault(Lvl.Game).Attacker != None && Assault(Lvl.Game).Defender != None)
			{
				if (FSTeam != None && VSize(PSTeam.Location - A.Location) > VSize(PSTeam.Location - A.Location))
					return Assault(Lvl.Game).Defender.TeamIndex;
				if ((bHaveFort != 0 && FSTeam == None) || PSTeam.TeamNumber == 1)
					return Assault(Lvl.Game).Attacker.TeamIndex;
				return Assault(Lvl.Game).Defender.TeamIndex;
			}
			return PSTeam.TeamNumber;
		}
		return PTeam;
	}
	return 255;
}


//Initialize ressurection color
static function InitializeRes(NRessurectFX NRes, Actor A, LevelInfo Lvl, bool bEnableTeamColor, byte defaultColor, byte PTeam, 
optional ControlPoint CPTeam, optional PlayerStart PSTeam, optional FortStandard FSTeam, optional byte bHaveFort)
{
	if (NRes != None && bEnableTeamColor && (CPTeam != None || PSTeam != None || PTeam < 4))
		NRes.InitRessurectionTex(static.GetCurrentTeam(A, Lvl, defaultColor, PTeam, CPTeam, PSTeam, FSTeam, bHaveFort));
	else
		NRes.InitRessurectionTex(defaultColor, True);
}


//Check if is allowed to kick this pawn
static function bool isAllowedToKick(Pawn Inst, Pawn P, LevelInfo Lvl, int Kickback, optional byte savedTeam, optional string ownerName, optional actor src)
{
	if (KickBack <= 0 || Inst == None || P == None || 
	(class'NaliWeapons'.default.bKickAffectTeammates && class'NaliWeapons'.default.bKickAffectInstigator))
		return True;
		
	return !static.isFriend(P, Lvl, Inst, savedTeam, !class'NaliWeapons'.default.bKickAffectTeammates, 
		!class'NaliWeapons'.default.bKickAffectInstigator, ownerName, src);
}

//Check if is monster pawn
simulated static function bool isMonster(Pawn P)
{
local NWMutator NWM;
local int NWMOut;

	if (P != None)
	{
		NWM = getNWMutator(P.Level, (P.Level.NetMode != NM_StandAlone && P.Level.NetMode != NM_DedicatedServer));
		if (NWM != None)
		{
			NWMOut = NWM.isMonster(P);
			if (NWMOut >= 0)
				return Bool(NWMOut);
		}
	}
	return (Bot(P) == None && PlayerPawn(P) == None && StationaryPawn(P) == None && Bots(P) == None);
}

//Check if it's a DM game
static function bool isDMGame(GameInfo GI)
{
	return (TeamGamePlus(GI) == None || GI.Class == Class'TeamGamePlus');
}

//Check if is a valid bot-like pawn
simulated static function bool isValidBot(Pawn P)
{
	return (Bot(P) != None || ScriptedPawn(P) != None || Bots(P) != None);
}

//Check if is elegible bot AI
static function bool isElegibleBotAI(Pawn P, optional bool ignoreNovice, optional float minSkill, optional float maxSkill)
{
	if (P == None || (minSkill != 0.0 && P.Skill >= minSkill) || (maxSkill != 0.0 && P.Skill <= maxSkill))
		return False;
	if (Bot(P) != None)
		return (!ignoreNovice || !Bot(P).bNovice);
	if (ScriptedPawn(P) != None)
		return True;
	return False;
}

//Rotate rHeading in rTurnAngle degrees (thanks UnrealWiki for this function :D )
simulated static function rotator rTurn(rotator rHeading, rotator rTurnAngle)
{
local vector vForward,vRight,vUpward;
local vector vForward2,vRight2,vUpward2;
local rotator T;
local vector  V;
 
	GetAxes(rHeading,vForward,vRight,vUpward);
	// rotate in plane that contains vForward&vRight
	T.Yaw = rTurnAngle.Yaw; 
	V = vector(T);
	vForward2 = V.X*vForward + V.Y*vRight;
	vRight2 = V.X*vRight - V.Y*vForward;
	vUpward2 = vUpward;

	// rotate in plane that contains vForward&vUpward
	T.Yaw = rTurnAngle.Pitch; 
	V = vector(T);
	vForward = V.X*vForward2 + V.Y*vUpward2;
	vRight = vRight2;
	vUpward = V.X*vUpward2 - V.Y*vForward2;

	// rotate in plane that contains vUpward&vRight
	T.Yaw = rTurnAngle.Roll; 
	V = vector(T);
	vForward2 = vForward;
	vRight2 = V.X*vRight + V.Y*vUpward;
	vUpward2=V.X*vUpward - V.Y*vRight;

	T = OrthoRotation(vForward2, vRight2, vUpward2);
	return(T);
}


//Get 3D objects position relative to canvas
simulated static function vector HUDObjectToWorld(Actor TargetOther, PlayerPawn PPOwner, float HX, float HY, float ScreenWidth, float ScreenHeight, float DistFromScreen)
{
local vector DirObj, PPLoc;

	DirObj.X = 1 / Tan(PPOwner.FOVAngle / 2 / 180 * Pi);
	DirObj.Y = (HX-ScreenWidth/2) / (ScreenWidth/2);
	DirObj.Z = -(HY-ScreenHeight/2) / (ScreenWidth/2);
	DirObj = Normal(DirObj);
	PPLoc = PPOwner.Location + PPOwner.WalkBob;
	PPLoc.Z += PPOwner.EyeHeight;
	return (PPLoc + (DirObj >> PPOwner.ViewRotation) * DistFromScreen);
}


//Get world vector location to canvas
simulated static function bool LocToCanvas(out vector OutXY, vector Loc, vector ViewOrigin, rotator ViewRot, canvas Canvas, optional bool returnPrecision)
{
local float TanFOVx, TanFOVy, TanX, TanY, dx, dy, FOV;
local vector X, Y, Dir, XY, TargetDir, localOutFX;

	FOV = Canvas.ViewPort.Actor.FOVAngle;
	TargetDir = Normal(Loc - ViewOrigin);
	TanFOVx = Tan(FOV * Pi / 360);
	TanFOVy = (Canvas.ClipY/Canvas.ClipX) * TanFOVx;
	GetAxes(ViewRot, Dir, X, Y);
	Dir *= (TargetDir dot Dir);
	XY = TargetDir - Dir;
	dx = (XY dot X);
	dy = (XY dot Y);
	TanX = (dx/VSize(dir));
	TanY = (dy/VSize(dir));
	OutXY.X = Canvas.ClipX * 0.5 * (1+TanX/TanFOVx);
	OutXY.Y = Canvas.ClipY * 0.5 * (1-TanY/TanFOVy);
	localOutFX = OutXY;
	if (!returnPrecision)
	{
		OutXY.X = int(OutXY.X);
		OutXY.Y = int(OutXY.Y);
	}
	
	return (Dir dot vector(ViewRot)>0) && (localOutFX.X == FClamp(localOutFX.X,Canvas.OrgX, Canvas.ClipX)) 
		&& (localOutFX.Y == FClamp(localOutFX.Y,Canvas.OrgY,Canvas.ClipY));
}


//Get actor location to canvas
simulated static function bool ActorToCanvas(out vector OutXY, actor CTarget, canvas Canvas, optional bool bConsiderCollisionHeight, optional bool returnPrecision)
{
local float TanFOVx, TanFOVy, TanX, TanY, dx, dy, FOV;
local vector X, Y, Dir, XY, TargetDir, localOutFX;
local vector srcLoc;
local Actor srcActor;
local rotator srcRot;

	if (CTarget == None || Canvas == None || Canvas.ViewPort == None || Canvas.ViewPort.Actor == None)	
		return False;

	FOV = Canvas.ViewPort.Actor.FOVAngle;
	Canvas.ViewPort.Actor.PlayerCalcView(srcActor, srcLoc, srcRot);
	if (bConsiderCollisionHeight)
		TargetDir = Normal((CTarget.Location + CTarget.CollisionHeight*vect(0,0,1)) - srcLoc);
	else
		TargetDir = Normal(CTarget.Location - srcLoc);
	TanFOVx = Tan(FOV * Pi / 360);
	TanFOVy = (Canvas.ClipY/Canvas.ClipX) * TanFOVx;
	GetAxes(srcRot, Dir, X, Y);
	Dir *= (TargetDir dot Dir);
	XY = TargetDir - Dir;
	dx = (XY dot X);
	dy = (XY dot Y);
	TanX = (dx/VSize(dir));
	TanY = (dy/VSize(dir));
	OutXY.X = Canvas.ClipX * 0.5 * (1+TanX/TanFOVx);
	OutXY.Y = Canvas.ClipY * 0.5 * (1-TanY/TanFOVy);
	localOutFX = OutXY;
	if (!returnPrecision)
	{
		OutXY.X = int(OutXY.X);
		OutXY.Y = int(OutXY.Y);
	}
	
	return (Dir dot vector(srcRot)>0) && (localOutFX.X == FClamp(localOutFX.X,Canvas.OrgX, Canvas.ClipX)) 
		&& (localOutFX.Y == FClamp(localOutFX.Y,Canvas.OrgY,Canvas.ClipY));
}

//Get best font size for given canvas resolution
simulated static function byte getResolutionFontCoef(canvas Canvas, optional byte maxCoef)
{
local byte c;
	
	if (Canvas.ClipX >= 1920)		c = 5;
	else if (Canvas.ClipX >= 1440)	c = 4;
	else if (Canvas.ClipX >= 1024)	c = 3;
	else if (Canvas.ClipX >= 800)	c = 2;
	else if (Canvas.ClipX >= 512)	c = 1;
	else							c = 0;
	
	if (maxCoef > 0)
		return Min(c, maxCoef);
	return c;
}

//Get framerate level: 0 = OK, -1=>-5 = Slowdown, 1=>5+ = Speedup
simulated static function int getFrameRateLevel(LevelInfo Lvl, float Delta, optional bool returnExcessLevel)
{
local float frameRate, minFPS;

	if (!Class'NWInfo'.default.enableGlobalSmartPerformance)
		return 0;

	frameRate = 1/(Delta * Lvl.TimeDilation);
	minFPS = Class'NWInfo'.default.smartPerformanceMinFPS;
	if (!returnExcessLevel && frameRate >= minFPS)
		return 0;
	return Int(frameRate / (minFPS / 5.0)) - 5;
}

//Get LODBias value based on current framerate
simulated static function float getFrameRateBasedLODBias(LevelInfo Lvl, float Delta, float curLODBias)
{
local int perfoEval;
	
	perfoEval = static.getFrameRateLevel(Lvl, Delta, True);
	if (perfoEval == 1)
		return curLODBias;
	return FClamp(curLODBias + static.getSign(perfoEval)*Delta*3, Class'NWInfo'.default.MinLODBias, Class'NWInfo'.default.MaxLODBias);
}

//Get number sign (1 if positive, -1 if negative, 0 if no sign)
simulated static function int getSign(float n)
{
	if (n == 0.0)
		return 0;
	return Int(n / Abs(n));
}

//Get var=value; from string
simulated static function string getValueFromSettingsString(coerce string varString, string strSettings)
{
local int propOffset, pos1, pos2;
local string str;

	if (strSettings == "" || varString == "")
		return "";
	
	pos1 = InStr(Caps(strSettings), ";"$Caps(varString)$"=");
	if (pos1 < 0)
	{
		pos1 = InStr(Caps(strSettings), Caps(varString)$"=");
		if (pos1 != 0)
			return "";
	}
	else
		pos1++;
	
	str = Mid(strSettings, pos1 + Len(Caps(varString)$"="));
	pos2 = InStr(str, ";");
	if (pos2 < 0)
		return str;
	return Left(str, pos2);
}

//Get indexData=dataStr[index] from "val1,val2,val3" string (starts in index 0)
simulated static function bool hasValueFromStringList(string dataStr, int index, optional out string indexData)
{
local int i, pos1;
local string str;

	indexData = "";
	if (dataStr == "" || index < 0)
		return False;

	str = dataStr;
	while (InStr(str, ",") == 0)
		str = Mid(str, InStr(str, ",") + 1);
	
	while (pos1 >= 0 && i <= index)
	{
		if (str == "")
			return False;
				
		pos1 = InStr(str, ",");
		if (pos1 < 0)
		{
			if (i == index)
			{
				indexData = str;
				return True;
			}
			return False;
		} 
		else if (i == index)
		{
			indexData = Mid(str, 0, pos1);
			return True;
		}
			
		str = Mid(str, pos1 + 1);
		i++;
	}
	return False;
}


//Get <index>th property=value where indexProperty=property and indexData=value from "property1=value1;property2=value2;..." string (starts in index 0)
simulated static function bool hasPropertyFromStringList(string dataStr, int index, optional out string indexProperty, optional out string indexData)
{
local int i, pos1;
local string str;

	indexData = "";
	indexProperty = "";
	if (dataStr == "" || index < 0)
		return False;

	str = dataStr;
	while (InStr(str, ";") == 0)
		str = Mid(str, InStr(str, ";") + 1);
	
	while (pos1 >= 0 && i <= index)
	{
		if (str == "")
			return False;
				
		pos1 = InStr(str, ";");
		if (pos1 < 0)
		{
			if (i == index)
			{
				processStrSplit("=", str, indexProperty, indexData);
				return True;
			}
			return False;
		} 
		else if (i == index)
		{
			processStrSplit("=", Mid(str, 0, pos1), indexProperty, indexData);
			return True;
		}
			
		str = Mid(str, pos1 + 1);
		i++;
	}
	return False;
}

//Get outStr1="abc" and outStr2="def" from srcStr="abc!def" with splitStr="!"
simulated static function processStrSplit(string splitStr, string srcStr, out string outStr1, out string outStr2)
{
local int splitPos;

	outStr1 = "";
	outStr2 = "";
	if (splitStr == "" || srcStr == "")
		return;
	
	splitPos = InStr(srcStr, splitStr);
	if (splitPos < 0)
		return;
		
	outStr1 = Left(srcStr, splitPos);
	outStr2 = Mid(srcStr, splitPos + 1);
}

//Replace all occurrences of "Replace" by "With" within "Text"
simulated static function string ReplaceStr(coerce string Replace, coerce string With, coerce string Text, optional int maxReplaces)
{
local int i, curRepl;
local string str;
local bool bReplLimit;

	curRepl = maxReplaces;
	bReplLimit = (curRepl > 0);
	i = InStr(Text, Replace);
	while (i >= 0) 
	{
		str = str $ Left(Text, i) $ With;
		Text = Mid(Text, i + Len(Replace));	
		if (bReplLimit)
		{
			curRepl--;
			if (curRepl <= 0)
				break;
		}
		i = InStr(Text, Replace);
	}
	return (str $ Text);
}


//Check if string GM is the current gametype (strings like "DM" which stand for "DeathMatch" are recognized)
static function bool isLevelGametype(string GM, LevelInfo Lvl)
{
local string GMClass;

	if (Lvl == None || Lvl.Game == None)
		return False;
	
	GMClass = String(Lvl.Game.Class);
	if (GMClass ~= "BotPack.DeathMatchPlus" && (GM ~= "DM" || GM ~= "DeathMatch" || GM ~= "Death Match" || GM ~= "DeathMatchPlus"))
		return True;
	if (GMClass ~= "BotPack.TeamGamePlus" && (GM ~= "TDM" || GM ~= "TeamDeathMatch" || GM ~= "Team DeathMatch" || GM ~= "Team Death Match" || GM ~= "TeamGamePlus"))
		return True;
	if (GMClass ~= "BotPack.CTFGame" && (GM ~= "CTF" || GM ~= "CaptureTheFlag" || GM ~= "Capture The Flag" || GM ~= "CTFGame"))
		return True;
	if (GMClass ~= "BotPack.Assault" && (GM ~= "AS" || GM ~= "Assault"))
		return True;
	if (GMClass ~= "BotPack.Domination" && (GM ~= "DOM" || GM ~= "Domination"))
		return True;
	if (GMClass ~= "BotPack.LastManStanding" && (GM ~= "LMS" || GM ~= "LastManStanding" || GM ~= "Last Man Standing"))
		return True;
	if (Lvl.Game.IsA('MonsterHunt') && (GM ~= "MH" || GM ~= "MonsterHunt" || GM ~= "Monster Hunt"))
		return True;
	return (GMClass ~= GM);
}


//Check if string T is the current pawn P team (strings like "RED" and numbers like "0" which stand for "Red team" are recognized)
static function bool isInTeam(string T, Pawn P)
{
	if (P == None || P.PlayerReplicationInfo == None)
		return False;
	
	if (T ~= "RED")
		T = "0";
	else if (T ~= "BLUE")
		T = "1";
	else if (T ~= "GREEN")
		T = "2";
	else if (T ~= "YELLOW" || T ~= "GOLD")
		T = "3";
	else if (T ~= "NONE")
		T = "255";
	else if (T != "0" && T != "1" && Byte(T) <= 1)
		return False;
	return (Byte(T) == P.PlayerReplicationInfo.Team);
}


//Check if string sA matches sB (having sA with wildcards like * and ?)
simulated static function bool StrMatch(string sA, string sB, optional bool bCaseSensitive)
{
local int wildPos, curI, curJ, w;
local string subStr1, subStr2;

	if (sA == "*")
		return True;

	if (!bCaseSensitive)
	{
		sA = Caps(sA);
		sB = Caps(sB);
	}
	
	wildPos = InStr(sA, "?");
	if (wildPos >= 0)
	{
		subStr1 = Left(sA, wildPos);
		subStr2 = Left(sB, wildPos);
		if (subStr1 != subStr2)
			return False;
		return static.StrMatch(Mid(sA, wildPos + 1), Mid(sB, wildPos + 1), bCaseSensitive);
	}
	
	wildPos = InStr(sA, "*");
	if (wildPos >= 0)
	{
		subStr1 = Left(sA, wildPos);
		subStr2 = Left(sB, wildPos);
		if (subStr1 != subStr2)
			return False;
		
		subStr1 = Mid(sA, wildPos + 1);
		subStr2 = Mid(sB, wildPos);
		if (subStr1 == "")
			return True;
		
		curI = Len(subStr1);
		w = InStr(subStr1, "*");
		if (w >= 0)
			curI = Min(w, curI);
		w = InStr(subStr1, "?");
		if (w >= 0)
			curI = Min(w, curI);
		curJ = InStr(subStr2, Mid(subStr1, 0, curI));
		if (curJ < 0)
			return False;
		return static.StrMatch(Mid(subStr1, curI), Mid(subStr2, curJ + curI), bCaseSensitive);
	}
	
	return (sA == sB);
}

//Dynamically load a texture (even procedural textures will be loaded this way)
simulated static function texture loadTexture(string texStr)
{
local texture tex;
local byte i;

	for (i = 0; i < ArrayCount(default.ValidTextureClasses); i++)
	{
		tex = Texture(DynamicLoadObject(texStr, default.ValidTextureClasses[i], True));
		if (tex != None)
			return tex;
	}
	return None;
}

//Check if a Pawn has a specific kind of inventory
simulated static function bool hasInventory(Pawn P, name InvName, optional bool isClient)
{
local int i;
local Inventory Inv;

	if (P == None || InvName == '')
		return False;
	
	for (Inv = P.Inventory; Inv != None; Inv = Inv.Inventory)
	{
		if (Inv.IsA(InvName))
			return True;
		
		if (isClient)
		{
			i++;
			if (i > 1000)
				break;	//Epic notes that in the client this list may temporarily loop forever
		}
	}
	return False;
}

//Check if a Pawn has a specific kind of inventory and return it
simulated static function Inventory getInventory(Pawn P, name InvName, optional bool isClient)
{
local int i;
local Inventory Inv;

	if (P == None || InvName == '')
		return None;
	
	for (Inv = P.Inventory; Inv != None; Inv = Inv.Inventory)
	{
		if (Inv.IsA(InvName))
			return Inv;
		
		if (isClient)
		{
			i++;
			if (i > 1000)
				break;	//Epic notes that in the client this list may temporarily loop forever
		}
	}
	return None;
}

//Get the right texture for invisibility purposes on the given style
simulated static function texture getInvisibleTexture(ERenderStyle TexStyle)
{
	if (TexStyle == STY_Masked)
		return Texture'MaskInvis';
	if (TexStyle == STY_Translucent)
		return Texture'TranslucInvis';
	if (TexStyle == STY_Modulated)
		return Texture'ModulInvis';
	return None;
}

//Get NWMutator
simulated static function NWMutator getNWMutator(LevelInfo Lvl, optional bool bClient)
{
local Mutator M;
local NWMutator NWM;

	if (Lvl == None)
		return None;

	if (!bClient && Lvl.Game != None)
	{
		for (M = Lvl.Game.BaseMutator; M != None; M = M.NextMutator)
		{
			if (NWMutator(M) != None)
				return NWMutator(M);
		}
	}
	else if (bClient)
	{
		ForEach Lvl.AllActors(Class'NWMutator', NWM)
			return NWM;
	}
	return None;
}


//Get similar named mutator
simulated static function bool hasSimilarMutator(LevelInfo Lvl, string MutPattern)
{
local Mutator M;

	if (Lvl == None || Lvl.Game == None || MutPattern == "")
		return False;
	for (M = Lvl.Game.BaseMutator; M != None; M = M.NextMutator)
	{
		if (StrMatch(MutPattern, String(M.Class)))
			return True;
	}
	return False;
}


//Spawn hitscan water effect
simulated static function SpawnHitscanWaterSplash(Actor A, byte WaterSplashType, ZoneInfo WZone, bool bBallistic, vector realLoc, optional Actor AOwner)
{
	SpawnWaterSplash(A, WaterSplashType, False, WZone,, bBallistic, realLoc, realLoc, True, AOwner);
}


//Spawn water splash effect
simulated static function SpawnWaterSplash(Actor A, byte WaterSplashType, bool inWater, ZoneInfo WZone, optional float WaterRingSize, optional bool bBallistic, 
optional vector curLoc, optional vector olderLoc, optional bool isProcessed, optional Actor AOwner)
{
local byte typeToUse;
local vector Loc, RealLoc, OldLoc, splashDif;
local NWWaterSplashRing wsr1, wsr2;
local Effects wfx;
local class<NWWaterSplashRing> WRingClass;
local class<Effects> WSplashClass;
local bool hasSplash;
local float initRingDScale;

	if (A == None)
		return;
		
	if (VSize(curLoc) > 0 && VSize(olderLoc) > 0)
	{
		Loc = curLoc;
		OldLoc = olderLoc;
	}
	else
	{
		Loc = A.Location;
		OldLoc = A.OldLocation;
	}
	
	if (!isProcessed && (WZone == None || (inWater && WZone != None && WZone.IsA('xZoneInfo'))))
		return;

	if (Loc != OldLoc)
	{
		if (inWater)
			RealLoc = OldLoc + vect(0,0,1);
		else
		{
			WZone = A.Region.Zone;
			RealLoc = Loc + vect(0,0,1);
		}
	}
	else
		RealLoc = Loc;


	typeToUse = WaterSplashType;
	if (!isProcessed && !inWater && typeToUse > 0 && typeToUse < 100)
		typeToUse--;
	
	if (((bBallistic && typeToUse >= ArrayCount(default.WaterBallisticSplashClass)) ||
	(!bBallistic && typeToUse >= ArrayCount(default.WaterProjSplashClass))) && typeToUse != 254)
		return;
	hasSplash = (typeToUse != 254);
	
	//FX Spawning
	if (hasSplash)
	{
		if (bBallistic)
			WSplashClass = default.WaterBallisticSplashClass[typeToUse];
		else
			WSplashClass = default.WaterProjSplashClass[typeToUse];
			
		if (WZone.IsA('LavaZone') || WZone.DamageType == 'Burned')
		{
			if (bBallistic)
				WSplashClass = default.LavaBallisticSplashClass[typeToUse];
			else
				WSplashClass = default.LavaProjSplashClass[typeToUse];
		}
		else if (WZone.IsA('SlimeZone') || WZone.DamageType == 'Corroded')
		{
			if (bBallistic)
				WSplashClass = default.SlimeBallisticSplashClass[typeToUse];
			else
				WSplashClass = default.SlimeProjSplashClass[typeToUse];
		}
	}
	
	WRingClass = default.WaterProjRingClass;
	if (WZone.IsA('LavaZone') || WZone.DamageType == 'Burned')
		WRingClass = default.LavaProjRingClass;
	else if (WZone.IsA('SlimeZone') || WZone.DamageType == 'Corroded')
		WRingClass = default.SlimeProjRingClass;

	wsr1 = A.Spawn(WRingClass, AOwner,, RealLoc, rotator(vect(0,0,1)));
	if (Class'NWInfo'.default.WaterSplashDetail >= 1)
		wsr2 = A.Spawn(WRingClass, AOwner,, RealLoc, rotator(vect(0,0,1)));
	if (hasSplash && Class'NWInfo'.default.WaterSplashDetail >= 2)
	{
		if (bBallistic)
			splashDif = vect(0,0,16);
		else
			splashDif = vect(0,0,10);
		wfx = A.Spawn(WSplashClass, AOwner,, RealLoc + (2**typeToUse)*splashDif, Rand(16384)*4*rot(0,1,0));
		wfx.Velocity += WZone.ZoneVelocity;
	}
	
	if (typeToUse == 254)
	{
		if (WaterRingSize > 0.0)
			initRingDScale = WaterRingSize;
		else
			initRingDScale = 1.0;
	}
	else if (bBallistic)
		initRingDScale = (typeToUse + 1) * 0.625;
	else
		initRingDScale = (2**typeToUse) * 0.75;
	
	if (wsr1 != None)
	{
		wsr1.RotationRate.Roll = 10000;
		wsr1.InitDrawScale = initRingDScale;
		wsr1.Velocity += WZone.ZoneVelocity;
	}
	
	if (wsr2 != None)
	{
		wsr2.InitDrawScale = initRingDScale;
		wsr2.Velocity += WZone.ZoneVelocity;
	}
}


defaultproperties
{
	ValidTextureClasses(0)=Class'Texture'
	ValidTextureClasses(1)=Class'FireTexture'
	ValidTextureClasses(2)=Class'WetTexture'
	ValidTextureClasses(3)=Class'IceTexture'
	ValidTextureClasses(4)=Class'FractalTexture'
	ValidTextureClasses(5)=Class'WaterTexture'
	ValidTextureClasses(6)=Class'WaveTexture'
	ValidTextureClasses(7)=Class'ScriptedTexture'
	
	WaterProjRingClass=Class'NWWaterSplashRing'
	SlimeProjRingClass=Class'NWSlimeSplashRing'
	LavaProjRingClass=Class'NWLavaSplashRing'
	
	WaterProjSplashClass(0)=Class'NWWaterVertSplashAA'
	WaterProjSplashClass(1)=Class'NWWaterVertSplashAB'
	WaterProjSplashClass(2)=Class'NWWaterVertSplashAC'
	WaterProjSplashClass(3)=Class'NWWaterVertSplashAD'
	WaterProjSplashClass(4)=Class'NWWaterVertSplashAE'
	WaterProjSplashClass(5)=Class'NWWaterVertSplashAF'
	WaterProjSplashClass(6)=Class'NWWaterVertSplashAG'
	WaterProjSplashClass(7)=Class'NWWaterVertSplashAH'

	SlimeProjSplashClass(0)=Class'NWSlimeVertSplashAA'
	SlimeProjSplashClass(1)=Class'NWSlimeVertSplashAB'
	SlimeProjSplashClass(2)=Class'NWSlimeVertSplashAC'
	SlimeProjSplashClass(3)=Class'NWSlimeVertSplashAD'
	SlimeProjSplashClass(4)=Class'NWSlimeVertSplashAE'
	SlimeProjSplashClass(5)=Class'NWSlimeVertSplashAF'
	SlimeProjSplashClass(6)=Class'NWSlimeVertSplashAG'
	SlimeProjSplashClass(7)=Class'NWSlimeVertSplashAH'

	LavaProjSplashClass(0)=Class'NWLavaVertSplashAA'
	LavaProjSplashClass(1)=Class'NWLavaVertSplashAB'
	LavaProjSplashClass(2)=Class'NWLavaVertSplashAC'
	LavaProjSplashClass(3)=Class'NWLavaVertSplashAD'
	LavaProjSplashClass(4)=Class'NWLavaVertSplashAE'
	LavaProjSplashClass(5)=Class'NWLavaVertSplashAF'
	LavaProjSplashClass(6)=Class'NWLavaVertSplashAG'
	LavaProjSplashClass(7)=Class'NWLavaVertSplashAH'
	
	WaterBallisticSplashClass(0)=Class'NWBalWaterSplashA'
	WaterBallisticSplashClass(1)=Class'NWBalWaterSplashB'
	WaterBallisticSplashClass(2)=Class'NWBalWaterSplashC'
	WaterBallisticSplashClass(3)=Class'NWBalWaterSplashD'
	
	SlimeBallisticSplashClass(0)=Class'NWBalSlimeSplashA'
	SlimeBallisticSplashClass(1)=Class'NWBalSlimeSplashB'
	SlimeBallisticSplashClass(2)=Class'NWBalSlimeSplashC'
	SlimeBallisticSplashClass(3)=Class'NWBalSlimeSplashD'
	
	LavaBallisticSplashClass(0)=Class'NWBalLavaSplashA'
	LavaBallisticSplashClass(1)=Class'NWBalLavaSplashB'
	LavaBallisticSplashClass(2)=Class'NWBalLavaSplashC'
	LavaBallisticSplashClass(3)=Class'NWBalLavaSplashD'
}