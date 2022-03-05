//////////////////////////////////////////////////////////////
//				Feralidragon (02-02-2014)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolOversFXC expands TheOversColoredFX;

var() texture FlaresTex[60];
var UltimaSolOversFXC NextFX, PrevFX;
var UltimaSolOversFXA FXMaster;
var vector Vel, curVelOffset;

simulated function PostBeginPlay()
{
	Texture = FlaresTex[Rand(ArrayCount(FlaresTex))];
	Super.PostBeginPlay();
}

simulated function Tick(float Delta)
{
	curVelOffset += (Vel * Delta);
	Super.Tick(Delta);
}

simulated function UpdateCoords(vector newLoc, rotator newRot)
{
	if (NextFX != None)
		NextFX.UpdateCoords(newLoc, newRot);
	SetLocation(newLoc + (curVelOffset >> newRot));
}

simulated function renderOnCanvas(canvas Canvas)
{
	if (NextFX != None)
		NextFX.renderOnCanvas(Canvas);
	Super.renderOnCanvas(Canvas);
}

simulated function SetDestroy()
{
	if (NextFX != None)
		NextFX.SetDestroy();
	Destroy();
}

simulated function Destroyed()
{
	if (NextFX != None)
		NextFX.PrevFX = PrevFX;
	if (PrevFX != None)
		PrevFX.NextFX = NextFX;
	else if (FXMaster != None)
		FXMaster.FlrFXList = NextFX;
	NextFX = None;
	PrevFX = None;
	FXMaster = None;
	
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Sprite
	Texture=RedGiantSolarFlr01
	bUnlit=True
	Style=STY_Translucent
	
	renderOnTop=False
	DrawScale=0.075000
	ScaleGlow=0.750000
	LifeSpan=1.100000

	fadeInTime=0.250000
	fadeOutTime=0.850000
	
	FlaresTex(0)=RedGiantSolarFlr01
	FlaresTex(1)=RedGiantSolarFlr02
	FlaresTex(2)=RedGiantSolarFlr03
	FlaresTex(3)=RedGiantSolarFlr04
	FlaresTex(4)=RedGiantSolarFlr05
	FlaresTex(5)=RedGiantSolarFlr06
	FlaresTex(6)=RedGiantSolarFlr07
	FlaresTex(7)=RedGiantSolarFlr08
	FlaresTex(8)=RedGiantSolarFlr09
	FlaresTex(9)=RedGiantSolarFlr10
	FlaresTex(10)=RedGiantSolarFlr11
	FlaresTex(11)=RedGiantSolarFlr12
	FlaresTex(12)=RedGiantSolarFlr13
	FlaresTex(13)=RedGiantSolarFlr14
	FlaresTex(14)=RedGiantSolarFlr15
	FlaresTex(15)=RedGiantSolarFlr16
	FlaresTex(16)=RedGiantSolarFlr17
	FlaresTex(17)=RedGiantSolarFlr18
	FlaresTex(18)=RedGiantSolarFlr19
	FlaresTex(19)=RedGiantSolarFlr20
	FlaresTex(20)=SystemSolarFlr01
	FlaresTex(21)=SystemSolarFlr02
	FlaresTex(22)=SystemSolarFlr03
	FlaresTex(23)=SystemSolarFlr04
	FlaresTex(24)=SystemSolarFlr05
	FlaresTex(25)=SystemSolarFlr06
	FlaresTex(26)=SystemSolarFlr07
	FlaresTex(27)=SystemSolarFlr08
	FlaresTex(28)=SystemSolarFlr09
	FlaresTex(29)=SystemSolarFlr10
	FlaresTex(30)=SystemSolarFlr11
	FlaresTex(31)=SystemSolarFlr12
	FlaresTex(32)=SystemSolarFlr13
	FlaresTex(33)=SystemSolarFlr14
	FlaresTex(34)=SystemSolarFlr15
	FlaresTex(35)=SystemSolarFlr16
	FlaresTex(36)=SystemSolarFlr17
	FlaresTex(37)=SystemSolarFlr18
	FlaresTex(38)=SystemSolarFlr19
	FlaresTex(39)=SystemSolarFlr20
	FlaresTex(40)=MatureSolarFlr01
	FlaresTex(41)=MatureSolarFlr02
	FlaresTex(42)=MatureSolarFlr03
	FlaresTex(43)=MatureSolarFlr04
	FlaresTex(44)=MatureSolarFlr05
	FlaresTex(45)=MatureSolarFlr06
	FlaresTex(46)=MatureSolarFlr07
	FlaresTex(47)=MatureSolarFlr08
	FlaresTex(48)=MatureSolarFlr09
	FlaresTex(49)=MatureSolarFlr10
	FlaresTex(50)=MatureSolarFlr11
	FlaresTex(51)=MatureSolarFlr12
	FlaresTex(52)=MatureSolarFlr13
	FlaresTex(53)=MatureSolarFlr14
	FlaresTex(54)=MatureSolarFlr15
	FlaresTex(55)=MatureSolarFlr16
	FlaresTex(56)=MatureSolarFlr17
	FlaresTex(57)=MatureSolarFlr18
	FlaresTex(58)=MatureSolarFlr19
	FlaresTex(59)=MatureSolarFlr20
}
