//////////////////////////////////////////////////////////////
//	Nali Weapons III Cybot Android
//				Feralidragon (30-12-2010)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybAndroid expands Cybot;

#exec MESH IMPORT MESH=CybAndroid ANIVFILE=MODELS\CybAndroid_a.3d DATAFILE=MODELS\CybAndroid_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybAndroid STRENGTH=0.1
#exec MESH ORIGIN MESH=CybAndroid X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybAndroid SEQ=All STARTFRAME=0 NUMFRAMES=288
#exec MESH SEQUENCE MESH=CybAndroid SEQ=Still STARTFRAME=136 NUMFRAMES=1

//Transform
#exec MESH SEQUENCE MESH=CybAndroid SEQ=Transform STARTFRAME=0 NUMFRAMES=20 RATE=19.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=UnTransform STARTFRAME=19 NUMFRAMES=21 RATE=20.0

//Movement
#exec MESH SEQUENCE MESH=CybAndroid SEQ=LookLeft STARTFRAME=40 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=LookLeftBck STARTFRAME=45 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=LookRight STARTFRAME=50 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=LookRightBck STARTFRAME=55 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=LookMoreLeft STARTFRAME=60 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=LookMoreLeftBck STARTFRAME=65 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=LookMoreRight STARTFRAME=70 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=LookMoreRightBck STARTFRAME=75 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=LandDown STARTFRAME=90 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=LandUp STARTFRAME=95 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=JumpDown STARTFRAME=184 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=JumpUp STARTFRAME=181 NUMFRAMES=4 RATE=3.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=WalkForward STARTFRAME=137 NUMFRAMES=12 RATE=11.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=WalkBackward STARTFRAME=149 NUMFRAMES=12 RATE=11.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=Run STARTFRAME=162 NUMFRAMES=18 RATE=17.0

//Gun
#exec MESH SEQUENCE MESH=CybAndroid SEQ=StanceON STARTFRAME=80 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=StanceOFF STARTFRAME=85 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=FireN STARTFRAME=101 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=FireUp1 STARTFRAME=108 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=FireUp2 STARTFRAME=115 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=FireDown1 STARTFRAME=122 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=FireDown2 STARTFRAME=129 NUMFRAMES=7 RATE=6.0

//Blade
#exec MESH SEQUENCE MESH=CybAndroid SEQ=HeadJump STARTFRAME=232 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=HeadCut STARTFRAME=238 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=HeadBck STARTFRAME=244 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=StraightCut STARTFRAME=206 NUMFRAMES=21 RATE=20.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=StraightBck STARTFRAME=226 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=UpDownCut STARTFRAME=187 NUMFRAMES=13 RATE=12.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=UpDownBck STARTFRAME=199 NUMFRAMES=8 RATE=7.0

//Dodge
#exec MESH SEQUENCE MESH=CybAndroid SEQ=DodgeLeft STARTFRAME=274 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=DodgeLeftBck STARTFRAME=280 NUMFRAMES=8 RATE=7.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=DodgeRight STARTFRAME=262 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=DodgeRightBck STARTFRAME=268 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=DodgeBack STARTFRAME=250 NUMFRAMES=7 RATE=6.0
#exec MESH SEQUENCE MESH=CybAndroid SEQ=DodgeBackBck STARTFRAME=256 NUMFRAMES=7 RATE=6.0


//------------------------- Animations End ---------------------------------
//**************************************************************************

#exec MESH NOTIFY MESH=CybAndroid SEQ=WalkForward TIME=0.25 FUNCTION=PlaySndStep
#exec MESH NOTIFY MESH=CybAndroid SEQ=WalkForward TIME=0.75 FUNCTION=PlaySndStep
#exec MESH NOTIFY MESH=CybAndroid SEQ=Run TIME=0.25 FUNCTION=PlaySndStep
#exec MESH NOTIFY MESH=CybAndroid SEQ=Run TIME=0.75 FUNCTION=PlaySndStep

#exec MESHMAP NEW MESHMAP=CybAndroid MESH=CybAndroid
#exec MESHMAP SCALE MESHMAP=CybAndroid X=0.05 Y=0.05 Z=0.1

#exec TEXTURE IMPORT NAME=AndroidGunsSk FILE=SKINS\AndroidGunsSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CybAndroid NUM=2 TEXTURE=AndroidGunsSk

#exec AUDIO IMPORT NAME="CybAndroidBladeSnd1" FILE=SOUNDS\CybAndroidBladeSnd1.wav GROUP="Attack"
#exec AUDIO IMPORT NAME="CybAndroidBladeSnd2" FILE=SOUNDS\CybAndroidBladeSnd2.wav GROUP="Attack"
#exec AUDIO IMPORT NAME="CybAndroidStep" FILE=SOUNDS\CybAndroidStep.wav GROUP="Step"
#exec AUDIO IMPORT NAME="CybAndroidLand" FILE=SOUNDS\CybAndroidLand.wav GROUP="Step"
#exec AUDIO IMPORT NAME="CybAndroidJump" FILE=SOUNDS\CybAndroidJump.wav GROUP="Step"


var() float WalkStepDist;
var() float WalkSpeed;
var() float RunStepDist;

var(Anim) name WalkAnim;
var(Anim) name WaitAnim;
var(Anim) name LookAnim[4];
var(Anim) name LookAnimBck[4];
var(Anim) name RunAnim;
var(Anim) name DodgeAnim[3];
var(Anim) name DodgeAnimBck[3];
var() vector DodgeDir[3];
var() float DodgeXYSpeed, DodgeZSpeed;
var(Anim) name BlasterAnim[5];
var() vector BlasterOffset;
var byte curBlasterPos;
var vector curBlasterOffset;

var() float FallHeight;
var() float MinHeightToJump;
var() float CollisionSensorRange;

var() float DistanceToBlast;

var(Melee) int MeleeDmg1, MeleeDmg2, MeleeDmgHeadshot;
var byte chosenMeleeAtck;

var byte lookType;


var(Sound) sound BladeSound1, BladeSound2;
var(Sound) sound JumpSnd, LandSnd;


function PreBeginPlay()
{
	Super.PreBeginPlay();
	bAvoidLedges = true;
	bStopAtLedges = true;
}

function setMaster(Pawn P)
{
	Super.setMaster(P);
	if (MasterPawn != None)
	{
		Health = Class'CybotLauncher'.default.CybotAndroidHealth;
		SetupHealth();
	}
}

//Tweens
function TweenToWaiting(float tweentime)
{	
	TweenAnim(WaitAnim, tweentime);
}

function TweenToRunning(float tweentime)
{	
	TweenAnim(RunAnim, tweentime);
}

function TweenToWalking(float tweentime)
{
    TweenAnim(WalkAnim, tweentime);
}

function TweenToJump(float tweentime, optional bool bDown)
{
	if (bDown)
		TweenAnim('JumpUp', tweentime);
	else
		TweenAnim('JumpDown', tweentime);
}

function TweenToMelee(float tweentime, optional byte meleeType)
{
	if (meleeType == 0)
		TweenAnim('StraightCut', tweentime);
	else if (meleeType == 1)
		TweenAnim('UpDownCut', tweentime);
	else
		TweenAnim('HeadCut', tweentime);
}

function TweenToFirePos(float tweentime, optional byte pos)
{
	if (pos < 5)
		TweenAnim(BlasterAnim[pos], tweentime);
}

//Loop Anims
function PlayRunning()
{
    LoopAnim(RunAnim, GroundSpeed/RunStepDist/2/DrawScale);
}

function PlayWalking()
{
    LoopAnim(WalkAnim, GroundSpeed*WalkSpeed/WalkStepDist/2/DrawScale);
}

//Play anims
function PlayLook(byte n, float rate)
{
	if (n > 3) return;
	PlayAnim(LookAnim[n], rate);
}

function PlayLookBack(byte n, float rate)
{
	if (n > 3) return;
	PlayAnim(LookAnimBck[n], rate);
}

function PlayLand(float rate, optional bool bUp, optional bool bTween)
{
	if (bTween)
	{
		if (!bUp)
			TweenAnim('LandUp', 1/rate);
		else
			TweenAnim('LandDown', 1/rate);
	}
	else
	{
		if (bUp)
			PlayAnim('LandUp', rate);
		else
			PlayAnim('LandDown', rate);
	}
}

function PlayDodge(float rate, byte i, optional bool bTween)
{
	if (bTween)
		TweenAnim(DodgeAnimBck[i], 1/rate);
	else
		PlayAnim(DodgeAnim[i], rate);
}

function PlayMeleeAttack(float rate, optional byte meleeType)
{
	if (meleeType == 0)
		PlayAnim('StraightCut', rate);
	else if (meleeType == 1)
		PlayAnim('UpDownCut', rate);
	else
		PlayAnim('HeadCut', rate);
		
	if (meleeType <= 1 && BladeSound2 != None)
		PlaySound(BladeSound2,,8.0,,500.0);
	else if (BladeSound1 != None)
		PlaySound(BladeSound1,,8.0,,500.0);
}

function PlayStance(float rate, optional bool bArming)
{
	if (bArming)
		PlayAnim('StanceON', rate);
	else
		PlayAnim('StanceOFF', rate);
}

function PlayFire(float rate, optional byte pos)
{
	if (pos < 5)
		PlayAnim(BlasterAnim[pos], rate);
}

//Play Sounds
function PlaySndStep()
{
	PlaySound(Sound'CybAndroidStep',,2.0,,500.0);
}

function PlaySndAir(optional bool bLand)
{
	if (bLand)
		PlaySound(LandSnd,,2.0,,500.0);
	else
		PlaySound(JumpSnd,,2.0,,500.0);
}

//Other functions
function bool isInFireRange()
{
local vector enemyDir, myDir;

	if (Enemy == None)	return False;

	enemyDir = Normal(Enemy.Location - Location);
	myDir = Normal(Enemy.Location - Location)*vect(1,1,0);
	return (((enemyDir dot myDir) > 0.6875) && FastTrace(Enemy.Location, Location));
}

function bool CheckLedge()
{	
	if (FollowActor != None)
		return CanJumpLedge(FollowActor.Location - Location, CollisionSensorRange, FallHeight, MinHeightToJump);
	return False;
}

function float getSafeFallDist()
{
	return (FallHeight / 5);
}

function bool CheckJump()
{
	if (FollowActor != None)
		return (FastTrace(FollowActor.Location, Location + CollisionHeight*vect(0,0,1)) && 
		TestDirection((FollowActor.Location - Location)*vect(1,1,0), CollisionSensorRange, True, 
		(MaxStepHeight*1.1 - CollisionHeight)*vect(0,0,1)) &&
		!TestDirection((FollowActor.Location - Location)*vect(1,1,0), CollisionSensorRange, True, 
		(CollisionHeight-4)*vect(0,0,-1)));
	return False;
}

function DodgeProjectile( Projectile proj)
{	
local rotator r;

	if (proj.Instigator != None)
		r = rotator((proj.Instigator.Location - Location)*vect(1,1,0));
	else if ((vector(Rotation) dot Normal(Location - proj.Location)) < 0)
		r = rotator((proj.Location - Location)*vect(1,1,0));
	else
		r = rotator((Location - proj.Location)*vect(1,1,0));
	SetRotation(r);
	GotoState('Dodging');
}


// --------- FOLLOW MASTER --------------
state FollowMaster
{
Begin:
	if (ShouldBeAttacking())
		GotoState('Attacking');
	
	if (FollowActor != None && !isInBadZone(FollowActor))
	{
		if (howFarFromMaster() == 2)
		{
			if (AnimSequence != RunAnim)
			{
				TweenToRunning(0.1);
				FinishAnim();
				PlayRunning();
			}
			
			if (checkReachMaster())
			{
				if ((Location.Z - FollowActor.Location.Z) > MinHeightToJump && CheckLedge())
				{
					Destination = FollowActor.Location;
					GotoState('JumpFromLedge');
				}
				else
					MoveToward(FollowActor);
			}
			else if (checkMasterLastSeenPos() && howFarFromPoint(MasterLastSeenLoc) > 0)
			{
				Destination = MasterLastSeenLoc;
				if (RefPnt != None)
				{
					RefPnt.SetLocation(MasterLastSeenLoc);
					MoveToward(RefPnt);
				}
				else
					MoveTo(MasterLastSeenLoc);
			}
			else if (CheckLedge())
			{
				Destination = FollowActor.Location;
				GotoState('JumpFromLedge');
			}
			else if (CheckJump())
			{
				Destination = FollowActor.Location;
				GotoState('Jump');
			}
			else if (checkTeleporterLink())
				MoveTo(Destination);
			else
			{
				TempA = SeekPathTowards(FollowActor);
				if (TempA != None)
					MoveToward(TempA);
				else
					Goto('Wait');
			}
			
			Sleep(0.1);
			Goto('Begin');
		}
		else if (howFarFromMaster() == 1)
		{
			if (checkReachMaster())
			{
				if (AnimSequence != WalkAnim)
				{
					TweenToWalking(0.1);
					FinishAnim();
					PlayWalking();
				}
				MoveToward(FollowActor, WalkSpeed);
				Sleep(0.1);
				Goto('Begin');
			}
			else if (checkMasterLastSeenPos() && howFarFromPoint(MasterLastSeenLoc) > 0)
			{
				if (AnimSequence != WalkAnim)
				{
					TweenToWalking(0.1);
					FinishAnim();
					PlayWalking();
				}
				Destination = MasterLastSeenLoc;
				if (RefPnt != None)
				{
					RefPnt.SetLocation(MasterLastSeenLoc);
					MoveToward(RefPnt, WalkSpeed);
				}
				else
					MoveTo(MasterLastSeenLoc, WalkSpeed);
				Sleep(0.1);
				Goto('Begin');
			}
			else
				Goto('Wait');
		}
		else
			Goto('Wait');
	}
	
	GotoState('Waiting');

Wait:
	MoveTo(Location - Normal(FollowActor.Location - Location)*vect(1,1,0));
	TweenToWaiting(0.25);
	FinishAnim();
	GotoState('Waiting');
}

// --------- WAITING --------------
state Waiting
{
	function bool bFollowMaster()
	{
		return (ShouldFollow() && howFarFromMaster() > 0 && (checkReachMaster(True) || (checkMasterLastSeenPos(True) && howFarFromPoint(MasterLastSeenLoc) > 0) || 
		CheckLedge() || CheckJump() || checkTeleporterLink()) && !isInBadZone(FollowActor));
	}

Begin:
	Velocity *= 0;
	Acceleration *= 0;
WaitBegin:
	if (ShouldBeAttacking()) GotoState('Attacking');
	
	if (!bFollowMaster())
	{
		if (FRand() < 0.75)
		{
			lookType = Rand(4);
			PlayLook(lookType, 1.35);
			FinishAnim();
			if (ShouldBeAttacking()) GotoState('Attacking');
			if (bFollowMaster()) GotoState('FollowMaster');
			Sleep(FRand()*3 + 0.1);
			if (ShouldBeAttacking()) GotoState('Attacking');
			if (bFollowMaster()) GotoState('FollowMaster');
			PlayLookBack(lookType, 1.35);
			FinishAnim();
		}
		else
			Sleep(FRand() + 0.1);
		
		Goto('WaitBegin');
	}
	else
		GotoState('FollowMaster');
}


// --------- DODGING --------------
state Dodging
{
	function DodgeMove()
	{
		AddVelocity((DodgeDir[projDir]>>Rotation)*DodgeXYSpeed + vect(0,0,1)*DodgeZSpeed);
		PlayDodge( 10.0, projDir, True);
		PlaySndAir();
	}
	
Begin:
	PlayLand(40.0,,True);
	FinishAnim();
	if (projDir == 2) projDir = 0;
	if (TestDirection((DodgeDir[projDir]>>Rotation), 128) && CanJumpLedge((DodgeDir[projDir]>>Rotation), 128, FallHeight))
		DodgeMove();
	else
	{
		projDir++; 
		if (projDir > 2) projDir = 0;
		if (TestDirection((DodgeDir[projDir]>>Rotation), 128) && CanJumpLedge((DodgeDir[projDir]>>Rotation), 128, FallHeight))
			DodgeMove();
		else
		{
			projDir++; 
			if (projDir > 2) projDir = 0;
			DodgeMove();
		}
	}
	
	WaitForLanding();
	PlaySndAir(True);
	
	if (CheckDodgeProjectile())
		Goto('Begin');
	
	PlayLand(20.0,,True);
	FinishAnim();
	PlayLand(20.0,True);
	FinishAnim();
	bIsDodging = False;
	GotoState('Waiting');
}

// --------- JUMP FROM LEDGE --------------
state JumpFromLedge
{
Begin:
	TurnTo(Destination);
	PlayLand(5.0,,True);
	FinishAnim();
	TweenToJump(0.1);
	PlaySndAir();
	FinishAnim();
	AddVelocity(Normal(Destination - Location)*vect(1,1,0)*JumpZ + vect(0,0,1)*JumpZ/2);
	WaitForLanding();
	PlaySndAir(True);
	MoveTo(Location + vector(Rotation));
	PlayLand(10.0,,True);
	FinishAnim();
	PlayLand(5.0,True);
	FinishAnim();
	GotoState('Waiting');
}

// --------- JUMP --------------
state Jump
{
Begin:
	TurnTo(Destination);
	PlayLand(5.0,,True);
	FinishAnim();
	TweenToJump(0.1);
	PlaySndAir();
	FinishAnim();
	AddVelocity(Normal(Destination - Location)*vect(1,1,0)*FMin(JumpZ*1.2, VSize(Destination - Location)*1.2)
	+ vect(0,0,1)*FMin(JumpZ*1.2, VSize(Destination - Location)*1.2));
	WaitForLanding();
	PlaySndAir(True);
	MoveTo(Location + vector(Rotation));
	PlayLand(10.0,,True);
	FinishAnim();
	PlayLand(5.0,True);
	FinishAnim();
	GotoState('Waiting');
}


// --------- ATTACKING --------------
state Attacking
{
Begin:
	CombatStyle = 2*FRand() - 1;
	MoveTo(Location + vector(Rotation));

Attack:
	if (!KeepEnemy())
		GotoState('Waiting');
	
	Enemy.Enemy = Self;
	if (isFarFromEnemy())
	{
		if (isFarFromEnemy(True))
		{
			bIsDodging = True;
			projDir = 2;
			GotoState('Dodging');
		}
		
		if ((CombatStyle < 0.0 || !actorReachable(Enemy) || VSize(Enemy.Location - Location) >= DistanceToBlast) && isInFireRange())
			GotoState('BlasterAttack');
		else if (actorReachable(Enemy))
		{
			if (AnimSequence != RunAnim)
			{
				TweenToRunning(0.1);
				FinishAnim();
				PlayRunning();
			}
			
			TempA = SeekPathTowards(Enemy);
			if (TempA != None)
			{
				if (TempA == Enemy && (Location.Z - Enemy.Location.Z) > MinHeightToJump && CheckLedge())
				{
					Destination = Enemy.Location;
					GotoState('JumpFromLedge');
				}
				else
					MoveToward(TempA);
			}
			else
				Goto('Wait');
			
			Sleep(0.1);
			Goto('Attack');
		}
		else if (isInFireRange())
			GotoState('BlasterAttack');
		else
			Enemy = None;
	}
	else
		GotoState('MeleeAttack');
	
	GotoState('Waiting');

Wait:
	MoveTo(Location - vector(Rotation)*vect(1,1,0));
	TweenToWaiting(0.25);
	FinishAnim();
	GotoState('Waiting');
}


// --------- BLASTER ATTACK --------------
state BlasterAttack
{
	function bool getFirePos()
	{
	local byte n;
	local vector enemyDir, myDir;
	local bool bChangeStance;
	
		if (Enemy == None)
			return False;
	
		enemyDir = Normal(Enemy.Location - Location);
		myDir = Normal(Enemy.Location - Location)*vect(1,1,0);
		curBlasterOffset = BlasterOffset*DrawScale;
		
		if ((enemyDir dot myDir) > 0.9375)
			n = 0;
		else if ((enemyDir dot myDir) > 0.8125)
		{
			if (Enemy.Location.Z < Location.Z)
			{
				n = 3;
				curBlasterOffset = (curBlasterOffset >> rot(-2048,0,0));
			}
			else
			{
				n = 1;
				curBlasterOffset = (curBlasterOffset >> rot(2048,0,0));
			}
		}
		else
		{
			if (Enemy.Location.Z < Location.Z)
			{
				n = 4;
				curBlasterOffset = (curBlasterOffset >> rot(-4096,0,0));
			}
			else
			{
				n = 2;
				curBlasterOffset = (curBlasterOffset >> rot(4096,0,0));
			}
		}
		
		bChangeStance = (n != curBlasterPos);
		curBlasterPos = n;
		return bChangeStance;
	}
	
	function SpawnFireFX()
	{
	local CybAndroidFireOv o;
	
		o = Spawn(Class'CybAndroidFireOv', Self);
		if (o != None) o.SetTeam(MyTeam, Self);
	}

Begin:
	curBlasterPos = 0;
	if (Enemy != None) MoveTo(Location - Normal(Enemy.Location - Location)*vect(1,1,0));
	if (Enemy != None) TurnTo(Location + ((Enemy.Location - Location) >> rot(0,640,0)));
	PlayStance(4.0, True);
	FinishAnim();
	if (Enemy == None) GotoState('Attacking');
	
BlasterStart:
	if (Enemy != None) Enemy.Enemy = Self;
	if (!isInFireRange())
	{
		PlayStance(4.0);
		FinishAnim();
		GotoState('Attacking');
	}
	
	if (getFirePos())
	{
		TweenToFirePos(0.1, curBlasterPos);
		FinishAnim();
	}
	
	if (Enemy != None) TurnTo(Location + ((Enemy.Location - Location) >> rot(0,640,0)));
	PlayFire(10, curBlasterPos);
	Sleep(0.0125);
	if (Enemy != None && CanFireProj(Normal(Enemy.Location - Location), 250))
	{
		FireProjectile( Location + (curBlasterOffset >> Rotation), Normal(Enemy.Location - Location));
		SpawnFireFX();
		Sleep(FireDelay - 0.0125);
	}
	
	if (KeepEnemy())
	{
		if (isFarFromEnemy())
			Goto('BlasterStart');
		else
			GotoState('MeleeAttack');
	}
	else
	{
		PlayStance(4.0);
		FinishAnim();
		GotoState('Attacking');
	}
}


// --------- MELEE ATTACK --------------
state MeleeAttack
{
	function int getMeleeDmg( byte mAttack)
	{
		if (mAttack == 0)
			return MeleeDmg1;
		if (mAttack == 1)
			return MeleeDmg2;
		return MeleeDmgHeadshot;
	}
	
	function JumpForHeadshot()
	{
	local vector XYJumpVect;
	local float ZJumpScalar, ZExtraFactor;
	
		if (Enemy == None) return;
		
		ZJumpScalar = Enemy.CollisionHeight*2 + ((Enemy.Location.Z - Enemy.CollisionHeight) - (Location.Z - CollisionHeight));
		ZExtraFactor = -2 * Region.Zone.ZoneGravity.Z * ZJumpScalar;
		if (ZExtraFactor > 0)
			ZExtraFactor = (ZExtraFactor ** 0.5);
		else
			ZExtraFactor = ((-ZExtraFactor) ** 0.5);
		XYJumpVect = (Enemy.Location - Location)*vect(1.5,1.5,0);
		
		AddVelocity(ZExtraFactor*vect(0,0,1) + XYJumpVect);
	}
	
Begin:
	MoveTo(Location - vector(Rotation));
	if (Enemy != None) TurnTo(Enemy.Location);
	
MeleeStart:
	if (Enemy != None) Enemy.Enemy = Self;
	else GotoState('Attacking');
	
	if (Enemy.Location.Z <= Location.Z || Abs(Enemy.Location.Z - Location.Z) > 500.0)
		chosenMeleeAtck = Rand(2);
	else
		chosenMeleeAtck = Rand(4);
	
	if (chosenMeleeAtck < 2)
	{
		TurnToward(Enemy);
		TweenToMelee(0.05, chosenMeleeAtck);
		FinishAnim();
		if (isFarFromEnemy())	GotoState('Attacking');
		PlayMeleeAttack(5.0, chosenMeleeAtck);
		FinishAnim();
		MakeMeleeAttack(vector(Rotation), getMeleeDmg(chosenMeleeAtck), 'CybotSliced');
	}
	else
	{
		TurnToward(Enemy);
		PlayLand(20, False, True);
		FinishAnim();
		if (isFarFromEnemy())	GotoState('Attacking');
		JumpForHeadshot();
		PlaySndAir();
		TweenToJump(0.05);
		FinishAnim();
		TweenToMelee(0.05, chosenMeleeAtck);
	
	PerfHead:
		if (Enemy != None && Velocity.Z > 0 && (Abs(Location.Z - Enemy.Location.Z) <= 0.625*Enemy.CollisionHeight))
		{
			Sleep(0.05);
			Goto('PerfHead');
		}
	
		PlayMeleeAttack(6.5, chosenMeleeAtck);
		FinishAnim();
		MakeMeleeAttack(vector(Rotation), getMeleeDmg(chosenMeleeAtck)/5, 'CybotSliced', True, getMeleeDmg(chosenMeleeAtck), 0.35);
		TweenToJump(0.85);
		WaitForLanding();
		PlaySndAir(True);
		PlayLand(20, False, True);
		FinishAnim();
	}
	
	if (isFarFromEnemy())
		GotoState('Attacking');
	else if (KeepEnemy())
		Goto('MeleeStart');
	TweenToWaiting(0.05);
	if (Enemy != None) TurnTo(Enemy.Location);
	GotoState('Attacking');
}

// --------- BOOT UP --------------
state BootUp
{
ignores SeePlayer, HearNoise, KilledBy, Bump, HitWall, Falling, TakeDamage, WarnTarget, Died;

Begin:
	WaitForLanding();
	PlaySndAir(True);
	PlayLand(10, False, True);
	FinishAnim();
	TweenToWaiting(0.1);
	FinishAnim();
	initFollowingPattern();
	GotoState('Waiting');
}


defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybAndroid
	CollisionHeight=18.000000
	CollisionRadius=15.000000
	MultiSkins(1)=CybotSk
	
	WalkStepDist=18.500000
	WalkSpeed=0.150000
	RunStepDist=47.500000
	GroundSpeed=300.000000
	JumpZ=500.000000
	BaseEyeHeight=19.500000
	EyeHeight=19.500000
	CombatStyle=0.000000
	
	MaxDistFromMaster=300.000000
	MinDistFromMaster=128.000000
	WalkAnim=WalkForward
	WaitAnim=Still
	RunAnim=Run
	LookAnim(0)=LookLeft
	LookAnim(1)=LookRight
	LookAnim(2)=LookMoreLeft
	LookAnim(3)=LookMoreRight
	LookAnimBck(0)=LookLeftBck
	LookAnimBck(1)=LookRightBck
	LookAnimBck(2)=LookMoreLeftBck
	LookAnimBck(3)=LookMoreRightBck
	DodgeAnim(0)=DodgeLeft
	DodgeAnim(1)=DodgeRight
	DodgeAnim(2)=DodgeBack
	DodgeAnimBck(0)=DodgeLeftBck
	DodgeAnimBck(1)=DodgeRightBck
	DodgeAnimBck(2)=DodgeBackBck
	BlasterAnim(0)=FireN
	BlasterAnim(1)=FireUp1
	BlasterAnim(2)=FireUp2
	BlasterAnim(3)=FireDown1
	BlasterAnim(4)=FireDown2
	
	BladeSound1=CybAndroidBladeSnd1
	BladeSound2=CybAndroidBladeSnd2
	JumpSnd=CybAndroidJump
	LandSnd=CybAndroidLand
	
	CoreSkinN=3
	MultiSkins(3)=CybotCoreRed
	bFollower=True
	bDodgeProj=True
	
	DodgeDir(0)=(Y=-1.000000)
	DodgeDir(1)=(Y=1.000000)
	DodgeDir(2)=(X=-1.000000)
	DodgeXYSpeed=425.000000
	DodgeZSpeed=120.000000
	FallHeight=1024.000000
	MinHeightToJump=40.000000
	MaxStepHeight=25.000000
	CollisionSensorRange=32.000000
	bUseGroundMasterLastPos=True
	BlasterOffset=(X=32.000000,Y=7.000000,Z=-4.000000)
	DistanceToBlast=1500.000000
	
	FireProjClass(0)=Class'CybProj'
	FireProjClass(1)=Class'CybProjB'
	FireProjClass(2)=Class'CybProjG'
	FireProjClass(3)=Class'CybProjY'
	FireDelay=0.150000
	
	CybFXCoronas(0)=(CoronaClass=Class'CybAndroidCoronas',hasExtras=True,isTeamCenter=False,isTeamRing=True,bFlicker=False)
	CybFXCoronas(1)=(CoronaClass=Class'CybAndroidCoronas',hasExtras=False,isTeamCenter=True,isTeamRing=False,bFlicker=True)
	
	MeleeDmg1=55
	MeleeDmg2=45
	MeleeDmgHeadshot=300
	
	Health=350
	WaterDmg=25
	ElectricDmgFactor=1.350000
	
	WreckParts(0)=(WreckClass=Class'CybAndWreckHead',WreckOffset=(Z=18.000000),UseYawOnly=False)
	WreckParts(1)=(WreckClass=Class'CybAndWreckArmA',WreckOffset=(Y=15.000000),UseYawOnly=False)
	WreckParts(2)=(WreckClass=Class'CybAndWreckArmB',WreckOffset=(Y=-15.000000),UseYawOnly=False)
	WreckParts(3)=(WreckClass=Class'CybAndWreckLeg',WreckOffset=(Y=10.000000,Z=-12.000000),UseYawOnly=False)
	WreckParts(4)=(WreckClass=Class'CybAndWreckLegB',WreckOffset=(Y=-10.000000,Z=-12.000000),UseYawOnly=False)
	
	TransformAnim=Transform
	TransformRate=5.000000
	NextStateFromTransform=BootUp
	TransformSnd=CybTransformSnd
	
	MyModel="Android Follower"
}
