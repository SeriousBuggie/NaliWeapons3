//////////////////////////////////////////////////////////////
//				Feralidragon (14-10-2010)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanTracer expands MTracer;

#exec MESH IMPORT MESH=VulcanTracer ANIVFILE=MODELS\VulcanTracer_a.3d DATAFILE=MODELS\VulcanTracer_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=VulcanTracer STRENGTH=0.35
#exec MESH ORIGIN MESH=VulcanTracer X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=VulcanTracer SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanTracer SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=VulcanTracer MESH=VulcanTracer
#exec MESHMAP SCALE MESHMAP=VulcanTracer X=0.5 Y=0.075 Z=0.15

#exec TEXTURE IMPORT NAME=VulcanTracer FILE=Coronas\VulcanTracer.bmp GROUP=Skins FLAGS=2 LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=VulcanTracer NUM=1 TEXTURE=VulcanTracer

simulated function PostBeginPlay()
{
	if (Class'NaliZPEffects'.static.isStaticZPDiscarded(Owner))
		Destroy();
	else
		Super.PostBeginPlay();
}

simulated function PostNetBeginPlay()
{
	if (Class'NaliZPEffects'.static.isStaticZPDiscarded(Owner))
		Destroy();
}

simulated function ZoneChange( ZoneInfo NewZone )
{
	if (NewZone.bWaterZone && !NewZone.IsA('LavaZone') && NewZone.DamageType != 'Burned')
		Destroy();
}

defaultproperties
{
	Mesh=VulcanTracer
	DrawScale=1.000000
	LightBrightness=100
	LightHue=0
	LightSaturation=64
	bUnlit=True
	ScaleGlow=1.650000
	Style=STY_Translucent
}
