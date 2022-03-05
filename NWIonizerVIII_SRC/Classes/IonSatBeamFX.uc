//////////////////////////////////////////////////////////////
//				Feralidragon (18-12-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatBeamFX expands NaliWEffects;

#exec TEXTURE IMPORT NAME=IonSatBeamFX FILE=EFFECTS\IonSatBeamFX.bmp GROUP=Skins LODSET=2

var() float FadeInDist, FadeOutDist;
var() float FXSpeed;
var vector FinishPoint, StartPoint;
var bool bRotated;
var float RotPitch, RotYaw, RotRoll;
var bool hadOwner;

replication
{
	reliable if (Role == ROLE_Authority)
		FinishPoint, StartPoint;
	unreliable if (ROLE == Role_Authority)
		RotPitch, RotYaw, RotRoll;
}

function BeginPlay()
{
	if (Role == ROLE_Authority)
	{
		RotPitch = Rotation.Pitch;
		RotYaw = Rotation.Yaw;
		RotRoll = Rotation.Roll;
	}
}

function SetFinishPoint(vector fPoint, optional vector sPoint)
{
	if (VSize(sPoint) > 0)
		StartPoint = sPoint;
	else
		StartPoint = Location;
	FinishPoint = fPoint;
}

simulated function Tick(float Delta)
{
local rotator R;
local float fL, sL, glowVal;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (!bRotated && (RotPitch != 0 || RotYaw != 0 || RotRoll != 0))
		{
			R.Pitch = RotPitch;
			R.Yaw = RotYaw;
			R.Roll = RotRoll;
			SetRotation(R);
			bRotated = True;
		}
		
		fL = VSize(FinishPoint - Location);
		sL = VSize(StartPoint - Location);
		if (Owner != None)
			glowVal = Owner.ScaleGlow + 1.0;
			
		if (sL <= FadeInDist)
			ScaleGlow = sL * glowVal / FadeInDist;
		else if (fL <= FadeOutDist)
			ScaleGlow = fL * glowVal / FadeOutDist;
	}
	
	if (VSize(Velocity) < FXSpeed)
		Velocity = Normal(FinishPoint - StartPoint) * FXSpeed;
	
	if (hadOwner && (Owner == None || Owner.bDeleteMe))
		Destroy();
	else if (Owner != None)
		hadOwner = True;
}

simulated function HitWall(vector HitNormal, actor HitWall)
{
	Destroy();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonSatBeam
	MultiSkins(1)=IonSatBeamFX
	AnimSequence=ScalingUp
	Style=STY_Translucent
	bUnlit=True
	ScaleGlow=2.000000
	bNetTemporary=False
	bAnimByOwner=True
	bCollideWorld=True
	LifeSpan=60.000000
	Physics=PHYS_Projectile
	
	FadeInDist=500.000000
	FadeOutDist=2000.000000
	FXSpeed=2000.000000
}
