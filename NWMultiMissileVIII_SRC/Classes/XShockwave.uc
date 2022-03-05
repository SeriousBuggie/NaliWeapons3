//////////////////////////////////////////////////////////////
//	Nali Weapons III MultiMissile X-Missile shockwave
//				Feralidragon (01-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class XShockwave expands ShockSphere;

#exec OBJ LOAD FILE=Textures\EnergyPanFX01.utx PACKAGE=NWMultiMissileVIII_SRC.EnergyPan
#exec AUDIO IMPORT NAME="XShockSnd" FILE=SOUNDS\XShockSnd.wav GROUP="Explosions"

var float CefxCount;

function PreBeginPlay()
{
	Super.PreBeginPlay();
	Damage = Class'MultiMissile'.default.XMissileBaseDamage;
}

function RunShockStart()
{
	Spawn(Class'MMShockOv');
	Spawn(Class'XGlowFloor');
	Spawn(Class'XGlow');
}

function RunShockProcess( float Delta)
{
local Effects efx;
local float DRadius;
local byte i;
local rotator R;

	CefxCount += Delta;
	if (CefxCount >= 0.1 && LifeSpan > 0.35)
	{
		for (i = 0; i < 9; i++)
		{
			DRadius = FRand() * (DrawScale * (ShkMeshSize - 24) / 2) + (DrawScale * (ShkMeshSize - 24) / 2);
			R.Pitch = Rand(16384) * 4;
			R.Yaw = Rand(16384) * 4;
			efx = Spawn(Class'XShockInternalExpl',,, Location + vector(R)*DRadius);
			if (efx != None)
				efx.DrawScale = DrawScale * 2;
		}
		
		CefxCount = 0;
	}
}

defaultproperties
{
	MultiSkins(1)=EnergyPanFXA
	MinScale=0.500000
	MaxScale=6.000000
	LifeSpan=1.000000
	ScaleGlow=0.3500000
	bGrowing=True
	bFadeOut=True
	bDamage=True
	Damage=1000
	bRangedDamage=True
	MyDamageType=MiniNuclear
	Momentum=420000
	ShockSound=XShockSnd
	ShockSVolume=150
	ShockSRange=8000
}
