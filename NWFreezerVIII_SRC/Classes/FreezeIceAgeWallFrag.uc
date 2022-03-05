//////////////////////////////////////////////////////////////
//				Feralidragon (14-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezeIceAgeWallFrag expands NWWallFrag;

var() float HitSoundOdds;

simulated function HitWall (vector HitNormal, actor HitWall)
{
	If (FRand() <= HitSoundOdds && VSize(Velocity) > 50)
	{
		if (DrawScale > 1.5 || bAlwaysHeavy)
			PlaySound(HeavyFragHitSound[Rand(ArrayCount(HeavyFragHitSound))],, FMax(0.5,DrawScale),, FMax(0.25,DrawScale)*500);
		else
			PlaySound(FragHitSound[Rand(ArrayCount(FragHitSound))],, FMax(0.5,DrawScale),, FMax(0.25,DrawScale)*500);
	}
	
    Velocity = 0.5*(( Velocity dot HitNormal ) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
    speed = VSize(Velocity);    
	
    if (bFirstHit && speed<150) 
    {
        bFirstHit=False;
        bRotatetoDesired=True;
        bFixedRotationDir=False;
        DesiredRotation.Pitch=0;    
        DesiredRotation.Yaw=FRand()*65536;
        DesiredRotation.roll=0;
    }
    RotationRate.Yaw = RotationRate.Yaw*0.75;
    RotationRate.Roll = RotationRate.Roll*0.75;
    RotationRate.Pitch = RotationRate.Pitch*0.75;
    if ( (speed < 60) && (HitNormal.Z > 0.7) )
    {
        SetPhysics(PHYS_none);
        bBounce = false;
        GoToState('Dying');
    }
}

state Dying
{
    simulated function HitWall (vector HitNormal, actor HitWall)
    {
		If (FRand() <= HitSoundOdds && VSize(Velocity) > 80) 
        {
			if (DrawScale > 1.5 || bAlwaysHeavy)
				PlaySound(HeavyFragHitSound[Rand(ArrayCount(HeavyFragHitSound))],, FMax(0.5,DrawScale),, FMax(0.25,DrawScale)*500);
			else
				PlaySound(FragHitSound[Rand(ArrayCount(FragHitSound))],, FMax(0.5,DrawScale),, FMax(0.25,DrawScale)*500);
		}
		
        Velocity = 0.5*(( Velocity dot HitNormal ) * HitNormal * (-2.0) + Velocity);   // Reflect off Wall w/damping
        speed = VSize(Velocity);   
		
        if (bFirstHit && speed<150) 
        {
            bFirstHit=False;
            bRotatetoDesired=True;
            bFixedRotationDir=False;
            DesiredRotation.Pitch=0;    
            DesiredRotation.Yaw=FRand()*65536;
            DesiredRotation.roll=0;
        }
		
        RotationRate.Yaw = RotationRate.Yaw*0.75;
        RotationRate.Roll = RotationRate.Roll*0.75;
        RotationRate.Pitch = RotationRate.Pitch*0.75;
        if ( (Velocity.Z < 50) && (HitNormal.Z > 0.7) )
        {
            SetPhysics(PHYS_none);
            bBounce = false;
        }
    }
}

defaultproperties
{
	InitMinForce=1000.000000
	InitMaxForce=1500.000000
	
	MinDrawScale=5.750000
	MaxDrawScale=10.150000
	
	HitSoundOdds=0.100000
}