//////////////////////////////////////////////////////////////
//				Feralidragon (14-09-2013)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerIceCrystal expands NaliWEffects;

#exec MESH IMPORT MESH=FreezerIceCrystal ANIVFILE=MODELS\FreezerIceCrystal_a.3d DATAFILE=MODELS\FreezerIceCrystal_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FreezerIceCrystal STRENGTH=0
#exec MESH ORIGIN MESH=FreezerIceCrystal X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=FreezerIceCrystal SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FreezerIceCrystal SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FreezerIceCrystal MESH=FreezerIceCrystal
#exec MESHMAP SCALE MESHMAP=FreezerIceCrystal X=1.0 Y=1.0 Z=4.0


var() float BaseHeight;
var() float MinDrawScale, MaxDrawScale;
var() float CoolSmkRate, RisingCoolSmkRate, CoolSmkSize;
var float tTime, tCount, tSmkCount;
var bool isRising;
var bool isFadingOut;

var FreezerIceCrystCor FrCor;
var() class<FreezerIceCrystCor> FrCorClass;


simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		FrCor = Spawn(FrCorClass);
		SetupCorona(FrCor);
	}
	
	Super.PostBeginPlay();
}

simulated function SetupCorona(NWCoronaFX nwCor)
{
	if (nwCor != None)
	{
		nwCor.MaxCoronaSize = MaxDrawScale * 15;
		nwCor.MinCoronaSize = MaxDrawScale * 12;
	}
}

simulated function Rise(float t)
{
	tTime = t;
	tCount = tTime;
	isRising = True;
}

simulated function Sink(float t)
{
	tTime = t;
	tCount = tTime;
	isRising = False;
}

simulated function FadeOut(float t)
{
	Style = STY_Translucent;
	tTime = t;
	tCount = tTime;
	isFadingOut = True;
}

simulated function Tick(float Delta)
{
local float f;
local FreezerIceCrystalSmk frICS;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (tTime > 0.0 && tCount > 0.0)
		{
			tCount -= Delta;
			if (tCount <= 0.0)
				tCount = 0.0;

			if (isFadingOut)
			{
				ScaleGlow = (tCount/tTime) * default.ScaleGlow;
				if (FrCor != None)
				{
					FrCor.CGlowMax = (tCount/tTime) * FrCor.default.CGlow;
					FrCor.CGlowMin = FrCor.CGlowMax;
				}
				if (tCount == 0.0)
					isFadingOut = False;
			}
			else if (isRising)
			{
				DrawScale = ((tTime - tCount)/tTime) * (MaxDrawScale - MinDrawScale) + MinDrawScale;
				PrePivot = (tCount/tTime) * (-vector(Rotation) * BaseHeight * DrawScale);
				if (FrCor != None)
				{
					FrCor.CGlowMax = ((tTime - tCount)/tTime) * FrCor.default.CGlow;
					FrCor.CGlowMin = FrCor.CGlowMax;
				}
				if (tCount == 0.0)
					isRising = False;
			}
			else
			{
				DrawScale = (tCount/tTime) * (MaxDrawScale - MinDrawScale) + MinDrawScale;
				PrePivot = ((tTime - tCount)/tTime) * (-vector(Rotation) * BaseHeight * DrawScale);
				if (FrCor != None)
				{
					FrCor.CGlowMax = (tCount/tTime) * FrCor.default.CGlow;
					FrCor.CGlowMin = FrCor.CGlowMax;
				}
			}
		}
		
		
		if (ScaleGlow > 0.0 && (!isFadingOut || tCount > tTime/2))
		{
			tSmkCount += Delta;
			if (tCount > 0.0 && isRising)
				f = 1/RisingCoolSmkRate;
			else
				f = 1/CoolSmkRate;
			if (tSmkCount >= f)
			{
				frICS = Spawn(Class'FreezerIceCrystalSmk',,, Location + FRand()*vector(Rotation)*DrawScale*BaseHeight);
				frICS.DrawScale = DrawScale * CoolSmkSize;
				tSmkCount = 0.0;
			}
		}
	}
}

simulated function Destroyed()
{
	if (FrCor != None)
		FrCor.Destroy();
	FrCor = None;
	
	Super.Destroyed();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=FreezerIceCrystal
	Texture=Ice
	bMeshEnviroMap=True
	Style=STY_Normal
	bUnlit=True
	ScaleGlow=2.000000
	DrawScale=3.000000
	bNetTemporary=False
	
	BaseHeight=768.000000
	MinDrawScale=1.000000
	MaxDrawScale=3.000000
	CoolSmkRate=2.500000
	RisingCoolSmkRate=20.000000
	CoolSmkSize=6.500000
	
	FrCorClass=Class'FreezerIceCrystCor'
}
