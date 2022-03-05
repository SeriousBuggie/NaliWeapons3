//////////////////////////////////////////////////////////////
//				Feralidragon (27-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBloodDecal expands Scorch;

#exec TEXTURE IMPORT NAME=NWBldRedDecal01 FILE=EFFECTS\BLOOD\Decals\NWBldRedDecal01.bmp GROUP=Decals
#exec TEXTURE IMPORT NAME=NWBldRedDecal02 FILE=EFFECTS\BLOOD\Decals\NWBldRedDecal02.bmp GROUP=Decals
#exec TEXTURE IMPORT NAME=NWBldRedDecal03 FILE=EFFECTS\BLOOD\Decals\NWBldRedDecal03.bmp GROUP=Decals
#exec TEXTURE IMPORT NAME=NWBldRedDecal04 FILE=EFFECTS\BLOOD\Decals\NWBldRedDecal04.bmp GROUP=Decals
#exec TEXTURE IMPORT NAME=NWBldRedDecal05 FILE=EFFECTS\BLOOD\Decals\NWBldRedDecal05.bmp GROUP=Decals
#exec TEXTURE IMPORT NAME=NWBldRedDecal06 FILE=EFFECTS\BLOOD\Decals\NWBldRedDecal06.bmp GROUP=Decals
#exec TEXTURE IMPORT NAME=NWBldRedDecal07 FILE=EFFECTS\BLOOD\Decals\NWBldRedDecal07.bmp GROUP=Decals


var() texture BloodTex[7];
var() float MaxDrawScale, MinDrawScale;
var() float AttachDepth;
var() float DecalWidth, DecalHeight;
var() float GrowTime;

var float endScale, growCount;
var vector constDir;


simulated function PostBeginPlay()
{
	DrawScale = FRand()*(MaxDrawScale - MinDrawScale) + MinDrawScale;
	endScale = DrawScale;
	Texture = BloodTex[Rand(ArrayCount(BloodTex))];
	Super.PostBeginPlay();
}

simulated function Init(float DScaleMult, optional vector cDir)
{
	DetachDecal();
	DrawScale *= DScaleMult;
	endScale = DrawScale;
	constDir = cDir;
	if (GrowTime > 0.0)
		DrawScale *= 0.001;
	AttachToSurface();
}

simulated function AttachToSurface()
{
	if ((VSize(constDir) > 0.0 && AttachDecal(AttachDepth, constDir) == None) || (VSize(constDir) == 0.0 && AttachDecal(AttachDepth) == None))
		Destroy();
}

simulated static function float getRealDecalHeight(float desiredWidth)
{
	return ((desiredWidth / default.DecalWidth) * default.DecalHeight);
}

simulated function InitDirectional(float desiredWidth, vector dir)
{
	DetachDecal();
	DrawScale = desiredWidth / DecalWidth;
	constDir = dir;
	AttachToSurface();
}

simulated function Tick(float Delta)
{
	if (growCount < GrowTime)
	{
		DetachDecal();
		growCount += Delta;
		if (growCount > GrowTime)
			growCount = GrowTime;
		DrawScale = FMax(endScale*0.001, growCount * endScale / GrowTime);
		AttachToSurface();
	}
	Super.Tick(Delta);
}

simulated function Timer()
{
	if (Lifespan == 0.0)
		Super.Timer();
	else
		SetTimer(0.0, False);
}


defaultproperties
{
	Texture=NWBldRedDecal01
	DrawScale=1.000000
	AttachDepth=100.000000
	
	MinDrawScale=0.1500000
	MaxDrawScale=0.7500000
	
	DecalWidth=128.000000
	DecalHeight=128.000000
	
	BloodTex(0)=NWBldRedDecal01
	BloodTex(1)=NWBldRedDecal02
	BloodTex(2)=NWBldRedDecal03
	BloodTex(3)=NWBldRedDecal04
	BloodTex(4)=NWBldRedDecal05
	BloodTex(5)=NWBldRedDecal06
	BloodTex(6)=NWBldRedDecal07
}
