//////////////////////////////////////////////////////////////
//				Feralidragon (19-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTHovenSmoke expands NaliWEffects;

#exec MESH IMPORT MESH=FlameTHovenSmokePick ANIVFILE=MODELS\FlameTHovenSmoke_a.3d DATAFILE=MODELS\FlameTHovenSmoke_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FlameTHovenSmokePick X=0 Y=0 Z=0 Yaw=128

#exec MESH SEQUENCE MESH=FlameTHovenSmokePick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FlameTHovenSmokePick MESH=FlameTHovenSmokePick
#exec MESHMAP SCALE MESHMAP=FlameTHovenSmokePick X=0.10625 Y=0.13500 Z=0.2125

#exec MESH IMPORT MESH=FlameTHovenSmokePickM ANIVFILE=MODELS\FlameTHovenSmokeM_a.3d DATAFILE=MODELS\FlameTHovenSmokeM_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FlameTHovenSmokePickM X=0 Y=0 Z=0 Yaw=128

#exec MESH SEQUENCE MESH=FlameTHovenSmokePickM SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FlameTHovenSmokePickM MESH=FlameTHovenSmokePickM
#exec MESHMAP SCALE MESHMAP=FlameTHovenSmokePickM X=0.10625 Y=0.13500 Z=0.2125

var() texture SmkTex[4];
var() float RisingSpeed;

simulated function PostBeginPlay()
{
local texture SelTex;
local byte SelSlot, i;

	Velocity = RisingSpeed * vect(0,0,1);
	
	SelTex = SmkTex[Rand(ArrayCount(SmkTex))];
	SelSlot = Rand(6) + 1;
	
	for (i = 0; i < 8; i++)
		MultiSkins[i] = None;
	
	MultiSkins[SelSlot] = SelTex;
	
	if (FRand() < 0.15)
		MultiSkins[Rand(6)] = SmkTex[Rand(ArrayCount(SmkTex))];
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=FlameTHovenSmokePick
	
	bParticles=True
	bRandomFrame=True
	
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=0.350000
	LifeSpan=0.750000
	ScaleGlow=1.000000
	bNetTemporary=True
	SpriteProjForward=0.000000
	Physics=PHYS_Projectile
	RisingSpeed=35.000000
	
	MultiSkins(0)=Texture'Botpack.utsmoke.us8_a00'
    MultiSkins(1)=Texture'Botpack.utsmoke.US3_A00'
    MultiSkins(2)=Texture'Botpack.utsmoke.us8_a00'
    MultiSkins(3)=Texture'Botpack.utsmoke.us2_a00'
    MultiSkins(4)=Texture'Botpack.utsmoke.us1_a00'
    MultiSkins(5)=Texture'Botpack.utsmoke.us2_a00'
    MultiSkins(6)=Texture'Botpack.utsmoke.us1_a00'
    MultiSkins(7)=Texture'Botpack.utsmoke.us8_a00'
	
	SmkTex(0)=Texture'Botpack.utsmoke.us8_a00'
	SmkTex(1)=Texture'Botpack.utsmoke.US3_A00'
	SmkTex(2)=Texture'Botpack.utsmoke.us2_a00'
	SmkTex(3)=Texture'Botpack.utsmoke.us1_a00'

}
