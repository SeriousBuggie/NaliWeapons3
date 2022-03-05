//////////////////////////////////////////////////////////////
//				Feralidragon (25-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearExplGuiderLvlB expands NaliWEffects;

var() float RiseSpeed;
var() float MaxDist;
var() float ExplRate;

var vector oldDetectedLoc;
var float distTravelled;

struct FXExpl
{
	var() class<Effects> FXClass;
	var() byte SkipN;
	var byte skipC;
};

var() FXExpl FX[3];

simulated function PostBeginPlay()
{
	Velocity = RiseSpeed * vector(Rotation);
	if (ExplRate > 0)
		SetTimer(1/ExplRate, True);
	
	Super.PostBeginPlay();
}

simulated function Timer()
{
local rotator r;
local vector v;
local byte i;
local Effects efx;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (VSize(oldDetectedLoc) > 0)
			distTravelled += VSize(Location - oldDetectedLoc);
		
		for (i = 0; i < ArrayCount(FX); i++)
		{
			if (FX[i].FXClass != None)
			{
				if (FX[i].skipC == 0)
				{
					r.Roll = Rand(16384) * 4;
					v.z = FRand() * MaxDist;
					v = (v >> r);
					efx = Spawn(FX[i].FXClass,,, Location + (v >> Rotation));
					ManageFX(efx);
				}
				
				FX[i].skipC++;
				if (FX[i].skipC > FX[i].SkipN)
					FX[i].skipC = 0;
			}
		}
		
		oldDetectedLoc = Location;
	}
}

simulated function ManageFX(Effects efx)
{
local float fxScale;

	if (efx == None)
		return;
	
	fxScale = (FMax(distTravelled / 500, 1.35)**2) * 5.2;
	if (NukeMiscExpl(efx) != None)
		NukeMiscExpl(efx).SetScale(fxScale);
	else if (NukeSmk(efx) != None)
		NukeSmk(efx).ClientSetSmkProperties(VRand()*100, fxScale, fxScale, True);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=LodMesh'Botpack.BulletImpact'
	
	LifeSpan=1.150000
	Style=STY_Translucent
	MultiSkins(0)=TranslucInvis
	MultiSkins(1)=TranslucInvis
	MultiSkins(2)=TranslucInvis
	MultiSkins(3)=TranslucInvis
	MultiSkins(4)=TranslucInvis
	MultiSkins(5)=TranslucInvis
	MultiSkins(6)=TranslucInvis
	MultiSkins(7)=TranslucInvis
	Texture=TranslucInvis
	Skin=TranslucInvis
	bUnlit=True
	
	DrawScale=0.100000
	ScaleGlow=1.500000
	
	Physics=PHYS_Projectile
	
	RiseSpeed=1150.000000
	MaxDist=128.000000
	ExplRate=14.000000
	FX(0)=(FXClass=Class'NukeMiscExplB',SkipN=0)
	FX(1)=(FXClass=Class'NukeBlkSmkB',SkipN=1)
	FX(2)=(FXClass=Class'NukeSmkB',SkipN=1)
}
