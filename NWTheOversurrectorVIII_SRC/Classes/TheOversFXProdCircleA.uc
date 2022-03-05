//////////////////////////////////////////////////////////////
//				Feralidragon (03-05-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOversFXProdCircleA expands TheOversColoredFX;

struct FRotator
{
	var float Pitch;
	var float Yaw;
	var float Roll;
};

var() FRotator StartRot, EndRot, FRRate2Start, FRRate2End;
var() float RotTime;
var() float ScaleMaximumAdd;


final static preoperator rotator ` (FRotator FR)
{
local rotator R;

	R.Yaw = FR.Yaw;
	R.Pitch = FR.Pitch;
	R.Roll = FR.Roll;
	return R;
}

final static operator(16) FRotator * (float f, FRotator FR)
{
	FR.Yaw *= f;
	FR.Pitch *= f;
	FR.Roll *= f;
	return FR;
}

final static operator(16) FRotator * (FRotator FR, float f)
{
	FR.Yaw *= f;
	FR.Pitch *= f;
	FR.Roll *= f;
	return FR;
}

final static operator(16) FRotator / (float f, FRotator FR)
{
	FR.Yaw /= f;
	FR.Pitch /= f;
	FR.Roll /= f;
	return FR;
}

final static operator(16) FRotator / (FRotator FR, float f)
{
	FR.Yaw /= f;
	FR.Pitch /= f;
	FR.Roll /= f;
	return FR;
}

final static operator(20) FRotator - (FRotator FR1, FRotator FR2)
{
	FR1.Yaw -= FR2.Yaw;
	FR1.Pitch -= FR2.Pitch;
	FR1.Roll -= FR2.Roll;
	return FR1;
}

final static operator(20) FRotator + (FRotator FR1, FRotator FR2)
{
	FR1.Yaw += FR2.Yaw;
	FR1.Pitch += FR2.Pitch;
	FR1.Roll += FR2.Roll;
	return FR1;
}


simulated function Tick(float Delta)
{
local float L;

	if (!isSlave && Level.NetMode != NM_DedicatedServer)
	{
		//Easing
		L = default.LifeSpan - LifeSpan;
		if (L <= RotTime)
		{
			L = L/RotTime - 1;
			StartingRot = `((EndRot - StartRot) * Sqrt(1 - L*L)  + StartRot);
			RRate2 = `((FRRate2End - FRRate2Start) * Sqrt(1 - L*L)  + FRRate2Start);
		}
		else
			StartingRot = `EndRot;
			
		if (enableScaling && LifeSpan <= fadeOutTime)
			DrawScaleStart = LifeSpan * (default.DrawScaleStart - ScaleMaximumAdd) / fadeOutTime + ScaleMaximumAdd;
	}
	
	Super.Tick(Delta);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=TheOversFXCircle
    MultiSkins(1)=OversFXCircleR
    MultiSkinsG(1)=OversFXCircleG
    MultiSkinsB(1)=OversFXCircleB
	
	renderOnTop=False
	
	bUnlit=True
	LifeSpan=4.350000
	DrawScale=2.000000
	ScaleGlow=2.000000
	
	enableScaling=True
	FlickerFactorMax=1.150000
	FlickerFactorMin=0.950000
	fadeInTime=0.500000
	fadeOutTime=0.350000
	scaleInTime=0.500000
	scaleOutTime=0.350000
	DrawScaleStart=0.000000
	
	enableRot=True
	StartingRot=(Pitch=0)
	RRate1=(Pitch=0,Roll=0)
	RRate2=(Yaw=0)
	
	StartRot=(Yaw=100000.000000,Pitch=50000.000000)
	EndRot=(Pitch=-16384.000000)
	FRRate2Start=(Yaw=120000.000000)
	FRRate2End=(Yaw=8000.000000)
	RotTime=2.000000
	
	ScaleMaximumAdd=20.000000
}
