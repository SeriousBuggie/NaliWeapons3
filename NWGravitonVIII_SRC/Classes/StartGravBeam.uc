//////////////////////////////////////////////////////////////
//	Nali Weapons III Graviton starter beam
//				Feralidragon (25-08-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class StartGravBeam expands GravBeam;

var() float ServerPhysicsDelta;

var rotator AimRotation;
var rotator BendRot;

var float BendFactor, Inertia;
var rotator FlowRot;
var Pawn BotOldEnemy;
var bool bSpringPhysics, bSpringMass, bStraightBeam;
var float curInertiaBendPitch, curInertiaBendYaw;
var float realRotPitch, realRotYaw;
var float bendRotPitch, bendRotYaw;
var rotator oldBendRot, oldRot;
var float remDelta;

replication
{
	// Things the server should send to the client.
	unreliable if (Role==ROLE_Authority && !bNetOwner)
		AimRotation;
	reliable if (Role == ROLE_Authority)
		BendFactor, Inertia, bSpringPhysics, bSpringMass, bStraightBeam;
}

function PreBeginPlay()
{
	Super.PreBeginPlay();
	BendFactor = Class'Graviton'.default.GravityBeamBendFactor;
	bSpringPhysics = Class'Graviton'.default.bUseSpringBeamPhysics;
	bSpringMass = Class'Graviton'.default.bUseSpringMassPhysics;
	bStraightBeam = Class'Graviton'.default.bGravitonStraightBeam;
	Inertia = FClamp(Class'Graviton'.default.GravityBeamInertia, 0.0, 1.0);
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	InitRotations();
}

simulated function PostNetBeginPlay()
{
	Super.PostNetBeginPlay();
	InitRotations();
}

simulated function InitRotations()
{
	BendRot = Normalize(Rotation);
	realRotPitch = BendRot.Pitch;
	realRotYaw = BendRot.Yaw;
	bendRotPitch = BendRot.Pitch;
	bendRotYaw = BendRot.Yaw;
	oldBendRot = BendRot;
	oldRot = BendRot;
	curInertiaBendPitch = 0.0;
	curInertiaBendYaw = 0.0;
	remDelta = 0.0;
}

simulated function Tick(float DeltaTime)
{
local vector X,Y,Z, DrawOffset;
local rotator rotDir;
local actor gA;
local int aimYawPitchZip;
local byte aimRollZip;
local rotator RSrc, RBend, oldRSrc, oldRBend;
local float divVRot, remVRotDiv;
local rotator RDif;


	// orient with respect to instigator
	if (Instigator != None)
	{
		if (Class'NWUtils'.static.isValidBot(Instigator))
		{
			gA = GetGrabbedGuy();
			if (gA != None && Instigator.Enemy == gA)
			{
				if (Instigator.Enemy != BotOldEnemy)
				{
					FlowRot.Yaw = (Rand(32000) + 32000) * FMax(0.1, Class'Graviton'.default.SmashDifficulty);
					if (FRand() > 0.5)
						FlowRot.Yaw = -FlowRot.Yaw;
					
					FlowRot.Pitch = Rand(32000) + 32000;
					if (FRand() > 0.5)
						FlowRot.Pitch = -FlowRot.Pitch;
					
					BotOldEnemy = Instigator.Enemy;
				}
				
				AimRotation += (FlowRot * DeltaTime);
				
				if (FastTrace(gA.Location + vect(0,0,-5000), gA.Location))
				{
					Instigator.bFire = 0;
					Instigator.bAltFire = 0;
					GlobalDropGrabbedGuy(DeltaTime);
				}
			}
			else if (gA != None)
				GlobalDropGrabbedGuy(DeltaTime);
			else if (Instigator.Enemy != None)
				AimRotation = rotator(Instigator.Enemy.Location - (Instigator.Location + Instigator.EyeHeight*vect(0,0,1)));
			
			AimRotation = Normalize(AimRotation);
			if (Role < ROLE_Authority)
			{
				CompressRotator(AimRotation, aimYawPitchZip, aimRollZip);
				DeCompressRotator(AimRotation, aimYawPitchZip, aimRollZip);
			}
			SetRotation(AimRotation);
			Instigator.ViewRotation = AimRotation;
			if (Instigator.Weapon != None)
				Drawoffset = Instigator.Weapon.CalcDrawOffset();
		}
		
		if ((Level.NetMode == NM_Client && PlayerPawn(Instigator) == None) || (PlayerPawn(Instigator) != None && PlayerPawn(Instigator).Player == None))
		{
			SetRotation(AimRotation); 
			Instigator.ViewRotation = AimRotation;
			DrawOffset = ((0.01 * Class'Graviton'.Default.PlayerViewOffset) >> Rotation);
			DrawOffset += (Instigator.EyeHeight * vect(0,0,1));
		}
		else if (!Class'NWUtils'.static.isValidBot(Instigator))
		{
			AimRotation = Normalize(Instigator.ViewRotation);
			if (Role < ROLE_Authority)
			{
				CompressRotator(AimRotation, aimYawPitchZip, aimRollZip);
				DeCompressRotator(AimRotation, aimYawPitchZip, aimRollZip);
			}
			SetRotation(AimRotation);
			if (Instigator.Weapon != None)
				Drawoffset = Instigator.Weapon.CalcDrawOffset();
		}

		GetAxes(Instigator.ViewRotation,X,Y,Z);

		if ((bCenter || PlayerPawn(Instigator) != None) && !Class'NWUtils'.static.isValidBot(Instigator))
		{
			if (Graviton(Instigator.Weapon) != None && PlayerPawn(Instigator) != None && PlayerPawn(Instigator).Handedness == 2)
			{
				FireOffset.X = Graviton(Instigator.Weapon).FireOffsetXAdjustHidden;
				FireOffset.Y = 0;
				FireOffset.Z = Graviton(Instigator.Weapon).FireOffsetZAdjustHidden;
			}
			else
			{
				FireOffset.X = Default.FireOffset.X;
				FireOffset.Y = 0;
				FireOffset.Z = 0;
			}
		}
		else 
		{
			if (bRight || Class'NWUtils'.static.isValidBot(Instigator))
				FireOffset.Y = -1 * Default.FireOffset.Y;
			else
				FireOffset.Y = Default.FireOffset.Y;
		}
		
		if (Instigator != None)
			SetLocation(Instigator.Location + DrawOffset + FireOffset.X * X + FireOffset.Y * Y + FireOffset.Z * Z);
			
		if (!bStraightBeam)
		{
			if (Level.NetMode != NM_StandAlone)
			{
				//Online sync
				remDelta += DeltaTime;
				divVRot = Int(remDelta/ServerPhysicsDelta)*ServerPhysicsDelta;
				RSrc = Normalize(Rotation);
				RBend = Normalize(BendRot);
				rotDir = RBend;
				oldRSrc = Normalize(oldRot);
				oldRBend = Normalize(oldBendRot);
				CorrectRelativeRotationsCalc(RSrc, RBend, oldRSrc, oldRBend);
				RDif = RSrc - oldRSrc;
				
				while (remDelta >= ServerPhysicsDelta)
				{
					remVRotDiv += ServerPhysicsDelta;
					UpdateBeamPhysics(ServerPhysicsDelta, oldRSrc + RDif*(remVRotDiv/divVRot), rotDir);
					remDelta -= ServerPhysicsDelta;
					CheckBeam(X, ServerPhysicsDelta, rotDir);
				}
				return;
			}
			else
				UpdateBeamPhysics(DeltaTime, Rotation, rotDir);
		}
	}
	else
		GetAxes(Rotation,X,Y,Z);
		
	CheckBeam(X, DeltaTime, rotDir);
}


simulated function UpdateBeamPhysics(float DeltaTime, rotator VRot, out rotator rotDir)
{
local actor gA;
local float distYaw, distPitch;
local float stiffNess, bendMass;
local rotator myRot;

	if (bSpringPhysics)
	{
		stiffNess = BendFactor * 80;
		bendMass = 5.0;
		
		if (bSpringMass)
		{
			gA = GetGrabbedGuy();
			if (gA != None)
				bendMass = FMax(5.0, gA.Mass / 50);
		}
		
		myRot = Normalize(VRot);
		BendRot = Normalize(BendRot);
		oldRot = Normalize(oldRot);
		oldBendRot = Normalize(oldBendRot);
		CorrectRelativeRotationsCalc(myRot, BendRot, oldRot, oldBendRot);
		realRotPitch += (myRot.Pitch - oldRot.Pitch);
		realRotYaw += (myRot.Yaw - oldRot.Yaw);
		
		distPitch = (realRotPitch - bendRotPitch) * stiffNess / FMax(5.0, bendMass);	//Distance * spring(K) / Mass
		distYaw = (realRotYaw - bendRotYaw) * stiffNess / FMax(5.0, bendMass);
		curInertiaBendPitch += (distPitch * DeltaTime);									//Add speed (acceleration)
		curInertiaBendYaw += (distYaw * DeltaTime);
		curInertiaBendPitch *= Inertia;													//Inertia (speed dump)
		curInertiaBendYaw *= Inertia;
		
		bendRotPitch += (curInertiaBendPitch * DeltaTime);						//Update new pos (distance travelled = v * t)
		bendRotYaw += (curInertiaBendYaw * DeltaTime);
		BendRot.Pitch = bendRotPitch;
		BendRot.Yaw = bendRotYaw;
		
		//Formulae: d = v.t + (a.t^2)/2
		BendRot = Normalize(BendRot);
		oldBendRot = BendRot;
		oldRot = Normalize(VRot);
		rotDir = Normalize(BendRot - myRot) / Max(1, BeamLen);
	}
	else
	{
		BendRot += (Normalize(VRot - BendRot) * BendFactor * DeltaTime);
		if ((vector(Normalize(VRot)) dot vector(Normalize(BendRot))) >= 0.999999)
			BendRot = VRot;
		rotDir = Normalize(BendRot - VRot) / Max(1, BeamLen);
	}
}


simulated function CorrectRelativeRotationsCalc(out rotator srcRot1, out rotator srcRot2, out rotator oldRot1, out rotator oldRot2)
{
local int coef;
local byte res;

	if (oldRot1 != rot(0,0,0) || oldRot2 != rot(0,0,0))
	{
		res = ChangedQuartenRot(coef, srcRot1.Pitch, srcRot2.Pitch, oldRot1.Pitch, oldRot2.Pitch);
		if ((res & 0x01) == 0x01)
			srcRot1.Pitch += (coef*65536);
		if ((res & 0x02) == 0x02)
			srcRot2.Pitch += (coef*65536);
		if ((res & 0x04) == 0x04)
			oldRot1.Pitch += (coef*65536);
		if ((res & 0x08) == 0x08)
			oldRot2.Pitch += (coef*65536);
			
		res = ChangedQuartenRot(coef, srcRot1.Yaw, srcRot2.Yaw, oldRot1.Yaw, oldRot2.Yaw);
		if ((res & 0x01) == 0x01)
			srcRot1.Yaw += (coef*65536);
		if ((res & 0x02) == 0x02)
			srcRot2.Yaw += (coef*65536);
		if ((res & 0x04) == 0x04)
			oldRot1.Yaw += (coef*65536);
		if ((res & 0x08) == 0x08)
			oldRot2.Yaw += (coef*65536);
	}
}

simulated function byte ChangedQuartenRot(out int coef, int new1, int new2, int old1, int old2)
{
	/* Rotator cycles reset logical table (thanks to those years in electronic school coding in machine code (no joke))
	0 - <-16384
	1 - >+16384
	
	0x04	0x08	0x01	0x02
	old1	old2	new1	new2	result

	0		0		0		0		---				0x00		
	0		0		0		1		new2-			0x02
	0		0		1		0		new1-			0x01
	0		0		1		1		old1+; old2+	0x0C
	0		1		0		0		old2-			0x08
	0		1		0		1		old2-; new2-	0x0A
	0		1		1		0		old2-; new1-	0x09
	0		1		1		1		old1+			0x04
	1		0		0		0		old1-			0x04
	1		0		0		1		old1-; new2-	0x06
	1		0		1		0		old1-; new1-	0x05
	1		0		1		1		old2+			0x08
	1		1		0		0		old1-; old2-	0x0C
	1		1		0		1		new1+			0x01
	1		1		1		0		new2+			0x02
	1		1		1		1		---				0x00
	*/
	
	coef = -1;
	if (old1<-16384 && old2<-16384 && new1<-16384 && new2>16384)
		return 0x02;
	if (old1<-16384 && old2<-16384 && new1>16384 && new2<-16384)
		return 0x01;
	if (old1<-16384 && old2>16384 && new1<-16384 && new2<-16384)
		return 0x08;
	if (old1<-16384 && old2>16384 && new1<-16384 && new2<-16384)
		return 0x08;
	if (old1<-16384 && old2>16384 && new1<-16384 && new2>16384)
		return 0x0A;
	if (old1<-16384 && old2>16384 && new1>16384 && new2<-16384)
		return 0x09;
	if (old1>16384 && old2<-16384 && new1<-16384 && new2<-16384)
		return 0x04;
	if (old1>16384 && old2<-16384 && new1<-16384 && new2>16384)
		return 0x06;
	if (old1>16384 && old2<-16384 && new1>16384 && new2<-16384)
		return 0x05;
	if (old1>16384 && old2>16384 && new1<-16384 && new2<-16384)
		return 0x0C;
	
	coef = 1;
	if (old1<-16384 && old2<-16384 && new1>16384 && new2>16384)
		return 0x0C;
	if (old1<-16384 && old2>16384 && new1>16384 && new2>16384)
		return 0x04;
	if (old1>16384 && old2<-16384 && new1>16384 && new2>16384)
		return 0x08;
	if (old1>16384 && old2>16384 && new1<-16384 && new2>16384)
		return 0x01;
	if (old1>16384 && old2>16384 && new1>16384 && new2<-16384)
		return 0x02;

	coef = 0;
	return 0x00;
}

//Thanks UnrealWiki for these compression functions, they came really in handy for a sync issue, 
// 	this way I won't have to send the rot values myself :D
function CompressRotator(rotator Rot, out int CompRot, out byte CompRoll)
{
	CompRot = (((32767 & (Rot.Pitch / 2)) * 32768) + (32767 & (Rot.Yaw / 2)));
	CompRoll = ((Rot.Roll >> 8) & 255);
}
 
function DeCompressRotator(out rotator Rot, int CompRot, byte CompRoll)
{
	Rot.Pitch = (CompRot / 32768);
	Rot.Yaw = (2 * (CompRot - (32768 * Rot.Pitch)));
	Rot.Pitch *= 2;
	Rot.Roll = ((CompRoll << 8) | CompRoll);
}

defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	TrailClass1=Class'GravBeamCorona'
	TrailClass2=Class'GravBeamCorCanvas'
	
	ServerPhysicsDelta=0.010000
}
