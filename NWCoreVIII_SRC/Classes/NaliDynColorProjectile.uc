//////////////////////////////////////////////////////////////
//	Nali Weapons III Dynamic Color Projectile base class
//				Feralidragon (20-07-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NaliDynColorProjectile expands NaliProjectile 
abstract;

struct ColorProj
{
	var() bool bUseThisColor;
	var() color ProjColor;
	var() bool bFadeToNext;
	var() float FadeTime;
	var() float LifeTime;
	var float FadeTimeMax;
};

var() ColorProj ProjectileColor[8];

var NaliColorComp greenComp, blueComp;
var float BaseScaleGlow;
var color CurrentColor;
var byte CurrentIndex, NextIndex;
var bool bUpdating;

var() texture RedCompTex[9], GreenCompTex[9], BlueCompTex[9];

simulated function PostBeginPlay()
{
local byte i;

	BaseScaleGlow = ScaleGlow;
	
	for (i = 0; i < ArrayCount(ProjectileColor); i++)
		ProjectileColor[i].FadeTimeMax = ProjectileColor[i].FadeTime;
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		greenComp = Spawn(Class'NaliColorComp', Self);
		SetColorComponent(greenComp, False);
		blueComp = Spawn(Class'NaliColorComp', Self);
		SetColorComponent(blueComp, True);
	}
	
	if (DrawType == DT_Mesh)
	{
		for (i = 0; i < 8; i++)
			MultiSkins[i] = RedCompTex[i];
		Texture = RedCompTex[8];
	}
	else
		Texture = RedCompTex[0];
	
	i = 0;
	while (i < ArrayCount(ProjectileColor) && !ProjectileColor[i].bUseThisColor)
		i++;
	
	CurrentIndex = i;
	
	if (i < ArrayCount(ProjectileColor))
		CurrentColor = ProjectileColor[i].ProjColor;
	
	i++;
	while (i < ArrayCount(ProjectileColor) && !ProjectileColor[i].bUseThisColor)
		i++;
	
	NextIndex = i;
	
	UpdateColor(CurrentColor);
	bUpdating = True;
	
	Super.PostBeginPlay();
}

simulated function Tick(float Delta)
{
local byte i;
local color cNow, cNext;
local float cVar, cMax;

	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer && bUpdating && CurrentIndex < ArrayCount(ProjectileColor))
	{
		ProjectileColor[CurrentIndex].LifeTime -= Delta;
		if (ProjectileColor[CurrentIndex].LifeTime <= 0)
		{
			CurrentIndex = NextIndex;
			
			if (NextIndex < ArrayCount(ProjectileColor))
			{
				CurrentColor = ProjectileColor[NextIndex].ProjColor;
				NextIndex++;
				while (NextIndex < ArrayCount(ProjectileColor) && !ProjectileColor[NextIndex].bUseThisColor)
					NextIndex++;
			}
			
			if (CurrentIndex >= ArrayCount(ProjectileColor))
				return;
		}
		
		if (ProjectileColor[CurrentIndex].bFadeToNext && ProjectileColor[CurrentIndex].FadeTime > 0 &&
		NextIndex < ArrayCount(ProjectileColor) && ProjectileColor[CurrentIndex].LifeTime <= ProjectileColor[CurrentIndex].FadeTimeMax)
		{
			ProjectileColor[CurrentIndex].FadeTime -= Delta;
			cVar = ProjectileColor[CurrentIndex].FadeTime;
			cMax = ProjectileColor[CurrentIndex].FadeTimeMax;
			
			cNow = ProjectileColor[CurrentIndex].ProjColor;
			cNext = ProjectileColor[NextIndex].ProjColor;
			
			if (cVar < 0)
				cVar = 0;
			
			if (cNow.R > cNext.R)
				CurrentColor.R = Byte(cVar * (cNow.R - cNext.R) / cMax + cNext.R);
			else
				CurrentColor.R = Byte((cMax - cVar) * (cNext.R - cNow.R) / cMax + cNow.R);
				
			if (cNow.G > cNext.G)
				CurrentColor.G = Byte(cVar * (cNow.G - cNext.G) / cMax + cNext.G);
			else
				CurrentColor.G = Byte((cMax - cVar) * (cNext.G - cNow.G) / cMax + cNow.G);
			
			if (cNow.B > cNext.B)
				CurrentColor.B = Byte(cVar * (cNow.B - cNext.B) / cMax + cNext.B);
			else
				CurrentColor.B = Byte((cMax - cVar) * (cNext.B - cNow.B) / cMax + cNow.B);
		}

		UpdateColor(CurrentColor);
	}
}

simulated function UpdateColor( color CColor)
{
    ScaleGlow = CColor.R * BaseScaleGlow / 255;
    if (greenComp != None)
        greenComp.ScaleGlow = CColor.G * BaseScaleGlow / 255;
    if (blueComp != None)
        blueComp.ScaleGlow = CColor.B * BaseScaleGlow / 255;
}

simulated function SetColorComponent( NaliColorComp comp, bool isBlue)
{
local byte i;

	if (comp == None)
		return;
	
	comp.DrawType = DrawType;
	if (comp.DrawType == DT_Mesh)
	{
		for (i = 0; i < 8; i++)
		{
			if (!isBlue)
				comp.MultiSkins[i] = GreenCompTex[i];
			else
				comp.MultiSkins[i] = BlueCompTex[i];
		}
		
		if (!isBlue)
			comp.Texture = GreenCompTex[8];
		else
			comp.Texture = BlueCompTex[8];
		
		comp.Mesh = Mesh;
		comp.bRandomFrame = bRandomFrame;
		comp.bParticles = bParticles;
		comp.Fatness = Fatness;
	}
	else if (!isBlue)
		comp.Texture = GreenCompTex[0];
	else
		comp.Texture = BlueCompTex[0];
	
	comp.bUnlit = True;
	comp.DrawScale = DrawScale;
	comp.PrePivot = PrePivot;
}

simulated function Destroyed()
{
	if (greenComp != None)
		greenComp.Destroy();
	if (blueComp != None)
		blueComp.Destroy();
		
	greenComp = None;
	blueComp = None;
	
	Super.Destroyed();
}

defaultproperties
{
	AmbientGlow=0
}