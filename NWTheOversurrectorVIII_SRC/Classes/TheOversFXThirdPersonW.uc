//////////////////////////////////////////////////////////////
//				Feralidragon (03-05-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOversFXThirdPersonW expands TheOversColoredFX;

var int overAnimCount;
var byte overAnimState;
var bool startedAnim;


simulated function Tick(float Delta)
{
	if (!startedAnim && !isSlave && Level.NetMode != NM_DedicatedServer)
	{
		PlayAnim('TweenStill', 2.0, 0.0);
		overAnimState = 1;
		startedAnim = True;
	}
	
	Super.Tick(Delta);
}

simulated function AnimEnd()
{
	if (isSlave || Level.NetMode == NM_DedicatedServer)
		return;
	
	overAnimCount++;

	//5.8333333333s
	if (overAnimState == 1)
	{
		if (overAnimCount <= 12)
			PlayAnim(Class'TheOversurrector'.static.getClosedRotAnim(Byte((overAnimCount-1)%4+1)), FClamp(overAnimCount-1, 0.5, 4.0), 0.0);
		else
		{
			overAnimState = 2;
			overAnimCount = 1;
		}
	}
	
	//1s
	if (overAnimState == 2)
	{
		if (overAnimCount == 1)
			PlayAnim('OpenVRotFull', 1.0, 0.0);
		else
		{
			overAnimState = 3;
			overAnimCount = 1;
		}
	}
	
	//1s
	if (overAnimState == 3)
	{
		if (overAnimCount == 1)
			PlayAnim('OpenHRotFull', 1.0, 0.0);
		else
		{
			overAnimState = 4;
			overAnimCount = 1;
		}
	}
	
	//4s
	if (overAnimState == 4)
	{
		if (overAnimCount <= 4)
			PlayAnim('OpenedRotFull', 1.0, 0.0);
		else
		{
			overAnimState = 5;
			overAnimCount = 1;
		}
	}
}

defaultproperties
{
    DrawType=DT_Mesh
	Mesh=TheOversurrectorR
	
	renderOnTop=False
	bOwnerNoSee=True
	
	bUnlit=False
	Style=STY_Normal
	LifeSpan=14.000000
	DrawScale=1.250000
	ScaleGlow=1.000000
	LODBias=16.000000
}
