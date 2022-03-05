//////////////////////////////////////////////////////////////
//	Nali Weapons III Inventory Charger/Locker OV FX
//				Feralidragon (09-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWColoredOV expands NaliWEffects;

var() texture RGB[3];
var() float mainGlow;
var() color ColorRGB;
var NWColoredRGBComp CompG, CompB;


simulated function Init(Actor Origin, color RGB)
{
	if (Origin == None)
	{
		Destroy();
		return;
	}
	
	SetupRGBComponent(Self, Origin, 0);
	SetRGB(RGB);
}

simulated function SetRGB(color RGB)
{
	if (RGB.G > 0 && CompG == None)
	{
		CompG = Spawn(Class'NWColoredRGBComp');
		CompG.Mesh = Mesh;
		SetupRGBComponent(CompG, Self, 1);
	}
	
	if (RGB.B > 0 && CompB == None)
	{
		CompB = Spawn(Class'NWColoredRGBComp');
		CompB.Mesh = Mesh;
		SetupRGBComponent(CompB, Self, 2);
	}
	
	ColorRGB = RGB;
	SetGlow(mainGlow);
}

simulated function SetGlow(float glow)
{
	mainGlow = glow;
	ScaleGlow = (ColorRGB.R / 255.f) * default.ScaleGlow * mainGlow;
	if (CompG != None)
		CompG.ScaleGlow = (ColorRGB.G / 255.f) * default.ScaleGlow * mainGlow;
	if (CompB != None)
		CompB.ScaleGlow = (ColorRGB.B / 255.f) * default.ScaleGlow * mainGlow;
}

simulated function SetOVFromActor(Actor A)
{
	SetupRGBComponent(Self, A, 0);
	SetupRGBComponent(CompG, A, 1);
	SetupRGBComponent(CompB, A, 2);
}

simulated function SetupRGBComponent(Actor A, Actor B, byte cComp)
{
	if (A == None || B == None || cComp > 2)
		return;
	
	A.DrawScale = B.DrawScale;
	A.MultiSkins[1] = RGB[cComp];
}

simulated function UpdateRotation(Actor Origin)
{
	if (Origin == None)
		return;
	
	SetRotation(Origin.Rotation);
	if (CompG != None)
		CompG.SetRotation(Origin.Rotation);
	if (CompB != None)
		CompB.SetRotation(Origin.Rotation);
}

simulated function Destroyed()
{
	if (CompG != None)
		CompG.Destroy();
	if (CompB != None)
		CompB.Destroy();
		
	CompG = None;
	CompB = None;
	
	Super.Destroyed();
}


defaultproperties
{
	DrawType=DT_Mesh
	DrawScale=1.000000
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	ScaleGlow=2.000000
	bUnlit=True
	Style=STY_Translucent
	MultiSkins(1)=TranslucInvis
	Texture=TranslucInvis
	
	mainGlow=1.000000
}