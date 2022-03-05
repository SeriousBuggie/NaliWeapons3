//////////////////////////////////////////////////////////////
//				Feralidragon (04-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////
class FrozenBody expands Decoration;

#exec AUDIO IMPORT NAME="IceBodyBreak" FILE=SOUNDS\IceBodyBreak.wav GROUP="Freezer"

var() float SmokeTime;
var() bool bFallingBody, bCollidableBody;

var IceOverlayer iceoverl;
var bool bBreak, bBroken;
var vector InitMomentum;
var float SmokeCount;
var int IceHealth;

simulated function PostBeginPlay()
{
	PlaySound(Sound'FreezerAmmoOpen',, 35.0,,1000);
	bBreak = FastTrace(Location + vect(0,0,-600), Location);
	SetTimer(0.3, True);
	Super.PostBeginPlay();
}

simulated function Tick( float Delta)
{
local FrozenBodySmoke fbs;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (SmokeTime > 0)
		{
			SmokeCount += Delta;
			if (SmokeCount >= 0.15)
			{
				SmokeTime -= SmokeCount;
				SmokeCount = 0;
				
				if (VSize(Velocity) < 100)
				{
					fbs = Spawn(Class'FrozenBodySmoke',,, Location + CollisionHeight*vect(0,0,1));
					if (fbs != None)
						fbs.SetColDrawScaleAndSpeed( CollisionRadius, CollisionHeight);
				}
			}
		}
	}
}

function setHealth(int newHealth)
{
	IceHealth = newHealth;
}

simulated function SetFrozenBody(actor A)
{
local byte i;

	Mesh = A.Mesh;
	DrawScale = A.DrawScale;
	PrePivot = A.PrePivot;
	TweenAnim(A.AnimSequence, 0.1);
	
	Texture = A.Texture;
	for (i = 0; i < 8; i++)
		MultiSkins[i] = A.MultiSkins[i];
	Skin = A.Skin;
	SetCollisionSize(A.CollisionRadius, A.CollisionHeight);
	
	if (bCollidableBody)
	{
		if (A.IsA('Carcass'))
			SetCollision(True, False, False);
		else
			SetCollision(True, True, True);
		bCollideWorld = True;
		bProjTarget = True;
	}
	if (bFallingBody)
		SetPhysics(PHYS_Falling);
	bBreak = (bBreak && (FMax(CollisionHeight, CollisionRadius) > 20));
	
	iceoverl = Spawn(Class'IceOverlayer', Self,, Location, Rotation);
	iceoverl.SetIceProperties(Self);
	setHealth(Int(FMax(A.CollisionRadius, A.CollisionHeight) * 1.5));
}

simulated function Timer()
{
local bool bSomething;
local Actor A;

	if (Region.Zone.DamageType == 'Burned' || Region.Zone.IsA('LavaZone'))
		Destroy();

	if (Level.NetMode == NM_StandAlone)
	{
		ForEach VisibleCollidingActors(Class'Actor', A, CollisionRadius, Location + (CollisionHeight + CollisionRadius) * vect(0,0,1))
		{
			if (A != Self)
			{
				bSomething = True;
				Mass = Default.Mass + A.Mass;
			}
		}

		if (!bSomething)
			Mass = Default.Mass;
	}
}

simulated function Landed( vector HitNormal )
{
	if (HitNormal.Z > 0.5 && (bBreak || VSize(Velocity) >= 750))
		TakeDamage( 2, None, Location, HitNormal * 30000, 'Fell' );
}

simulated function HitWall( vector HitNormal, actor Wall)
{
	if (HitNormal.Z > 0.5 && (bBreak || VSize(Velocity) >= 750))
		TakeDamage( 2, None, Location, HitNormal * 30000, 'Fell' );
	else
		Velocity += (HitNormal*100);
}

function Touch(actor Other)
{
	Bump(Other);
}

function Bump(actor Other)
{
	if (Bot(Other) != None)
		Bot(Other).ShootTarget(Self);
}

function TakeDamage( int NDamage, Pawn instigatedBy, Vector hitlocation, vector momentum, name damageType )
{
	if (IceHealth <= 0)
		return;
	
	if ((DamageType != 'Frozen' && NDamage > 0) || DamageType == 'Burned')
	{
		IceHealth -= NDamage;
		if (IceHealth <= 0 || DamageType == 'Burned')
		{
			IceHealth = 0;
			InitMomentum = Momentum;
			Instigator = InstigatedBy;
			if (Instigator != None)
				MakeNoise(1.0);
			Destroy();
		}
	}
}

simulated function Destroyed()
{
	if (iceoverl != None)
		iceoverl.Destroy();
	iceoverl = None;
	ReleaseFragEffect(InitMomentum, 8);
	Super.Destroyed();
}

simulated function ReleaseFragEffect(vector Momentum, int NumFrags) 
{
local byte i;
local byte maxFrags, maxSmoke;
local float col, colH, colR;
local float rndRot, rndRadius;
local vector RndCyl;
local IceFrag iceF;
local rotator R;
local FrozenBodySmkBlast fbsb;

	if (Level.NetMode != NM_DedicatedServer)
	{
		colH = FMax(CollisionHeight, 32);
		colR = FMax(CollisionRadius, 32);
		col = FMax(colH, colR);
		maxFrags = Int(NumFrags * col/48);
		maxSmoke = Int(col/7);
		
		for (i = 0; i < maxSmoke; i++)
		{
			rndRot = FRand()*PI*2;
			rndRadius = FRand()*colR;
			RndCyl.X = Sin(rndRot) * rndRadius;
			RndCyl.Y = Cos(rndRot) * rndRadius;
			
			fbsb = Spawn(Class'FrozenBodySmkBlast',,, Location + (colH - (colH*2/maxSmoke*i))*vect(0,0,1) + RndCyl);
			fbsb.SetColDrawScaleAndSpeed(colR, colH);
		}
		
		for (i = 0; i < maxFrags; i++)
		{
			RndCyl.Z = (FRand()*2 - 1) * colH;
			rndRot = FRand()*PI*2;
			rndRadius = FRand()*colR;
			RndCyl.X = Sin(rndRot) * rndRadius;
			RndCyl.Y = Cos(rndRot) * rndRadius;
			
			R = rotator(vect(0,0,1)*(Rand(2)-1));
			R.Roll = Rand(16384)*4;
			iceF = Spawn(Class'IceFrag',,, Location + RndCyl, R);
			
			if (iceF != None)
			{
				iceF.CalcVelocity(Momentum, col * 4);
				iceF.GiveDrawScale(col);
			}
		}
	
		PlaySound(Sound'IceBodyBreak',,12.0,,1000);
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=LodMesh'UnrealShare.BoulderM'
	RemoteRole=ROLE_SimulatedProxy
	bCollideActors=False
	bCollideWorld=False
	bProjTarget=False
	bBlockPlayers=False
	bBlockActors=False
	Buoyancy=30.000000
	bNetTemporary=False

	LifeSpan=15.000000
	bCollideWhenPlacing=False
	bStatic=False
	bStasis=False
	bPushable=True
	Mass=150.000000
	Buoyancy=250.000000
	bGameRelevant=True
	Physics=PHYS_None
	AnimSequence=All
	AnimFrame=0.400000
	InitMomentum=(Z=200)
	
	SmokeTime=1.000000
	bFallingBody=True
	bCollidableBody=True
	
	IceHealth=10000
}
