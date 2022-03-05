//////////////////////////////////////////////////////////////
//				Feralidragon (08-05-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NukeMassDebrisLevelC expands NukeMassDebrisLevelE;

var() float MaxRadius, MinRadius;
var() int PitchingRate;
var vector CenterPoint;

simulated function SetLevitation(vector cPoint, float t, float Scaling)
{
local rotator rRot;

	DrawScale = Scaling * ((MaxDrawScale - MinDrawScale)*FRand() + MinDrawScale);
	CenterPoint = cPoint;
	PrePivot = Location - CenterPoint;
	SetLocation(CenterPoint);
	rRot.Pitch = -16384;
	SetRotation(Class'NWUtils'.static.rTurn(Rotation, rRot));
	RiseTime = t;
}

simulated function Tick(float Delta)
{
local rotator rRot;
local float dist;

	Super(NWWallFrag).Tick(Delta);
	
	if (!bRisen)
	{
		risingDelayCount += Delta;
		if (risingDelayCount >= RiseTime)
		{
			bRisen = True;
			Move(PrePivot);
			PrePivot = vect(0,0,0);
			SetPhysics(PHYS_Falling);
			Velocity = vector(Rotation) * ((InitMaxForce - InitMinForce)*FRand() + InitMinForce);
			SetCollisionSize(DrawScale*MaxCoveredDebriRadius, DrawScale*MaxCoveredDebriRadius);
			return;
		}
		
		dist = ((Default.RiseTime-RiseTime)+risingDelayCount)/Default.RiseTime * (MaxRadius-MinRadius) + MinRadius;
		rRot.Pitch = Int(PitchingRate * Delta);
		SetRotation(Class'NWUtils'.static.rTurn(Rotation, rRot));
		PrePivot = vector(Rotation)*dist;
	}
	else if (VSize(Velocity) > 50)
	{
		rRot.Pitch = (15000*Delta);
		SetRotation(Class'NWUtils'.static.rTurn(Rotation, rRot));
	}
}

auto state Flying
{
    simulated function BeginState()
    {
        Mesh = WallFragMeshes[Rand(ArrayCount(WallFragMeshes))];
		AnimSequence = LevitateSeq[Rand(ArrayCount(LevitateSeq))];
		
        if ( Level.NetMode == NM_Standalone )
            LifeSpan = Default.LifeSpan + LifeSpanVariation*FRand();
        SetTimer(LifeSpan - DieOutTime,True);
    }
}

defaultproperties
{	
	LifeSpan=6.000000
	LifeSpanVariation=3.000000
	DieOutTime=2.000000
	MaxCoveredDebriRadius=40.000000
	RiseTime=3.500000
	SinkZ=5.000000
	
	InitMaxForce=2500.000000
	InitMinForce=1900.000000
	MaxDrawScale=1.000000
	MinDrawScale=0.500000
	WaterFXDif=-2
	bAlwaysHeavy=True
	
	LevitateSeq(0)=Levitate01
	LevitateSeq(1)=Levitate02
	LevitateSeq(2)=Levitate03
	LevitateSeq(3)=Levitate04
	
	MaxRadius=875.000000
	MinRadius=40.000000
	PitchingRate=4600
	Physics=PHYS_None
}
