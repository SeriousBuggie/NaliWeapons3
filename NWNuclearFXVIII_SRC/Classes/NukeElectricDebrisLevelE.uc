//////////////////////////////////////////////////////////////
//				Feralidragon (25-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeElectricDebrisLevelE expands NWWallFrag;

var() float DieOutTime;

simulated function SetForces(float Scaling)
{
	DrawScale = Scaling * ((MaxDrawScale - MinDrawScale)*FRand() + MinDrawScale);
	SetCollisionSize(DrawScale*MaxCoveredDebriRadius, DrawScale*MaxCoveredDebriRadius);
}

auto state Flying
{
    simulated function BeginState()
    {
		RandSpin(16000);
        if (RotationRate.Pitch>-10000&&RotationRate.Pitch<10000) 
            RotationRate.Pitch=10000;
        if (RotationRate.Roll>-10000&&RotationRate.Roll<10000) 
            RotationRate.Roll=10000;
		
        Mesh = WallFragMeshes[Rand(ArrayCount(WallFragMeshes))];
		Velocity = vector(Rotation) * ((InitMaxForce - InitMinForce)*FRand() + InitMinForce);
		
        if ( Level.NetMode == NM_Standalone )
            LifeSpan = Default.LifeSpan + LifeSpanVariation*FRand();
        SetTimer(LifeSpan - DieOutTime,True);
    }
}

defaultproperties
{
	LifeSpan=2.000000
	LifeSpanVariation=1.00000
	InitMaxForce=1700.000000
	InitMinForce=1300.000000
	MaxDrawScale=8.000000
	MinDrawScale=4.000000
	
	DieOutTime=1.000000
}
