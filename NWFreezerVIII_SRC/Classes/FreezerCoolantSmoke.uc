//////////////////////////////////////////////////////////////
//				Feralidragon (03-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezerCoolantSmoke expands NaliWEffects;

#exec MESH IMPORT MESH=FreezerCoolSmkPick ANIVFILE=MODELS\FreezerCoolSmk_a.3d DATAFILE=MODELS\FreezerCoolSmk_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FreezerCoolSmkPick X=0 Y=0 Z=0 Yaw=128

#exec MESH SEQUENCE MESH=FreezerCoolSmkPick SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FreezerCoolSmkPick MESH=FreezerCoolSmkPick
#exec MESHMAP SCALE MESHMAP=FreezerCoolSmkPick X=0.10625 Y=0.13500 Z=0.2125

#exec MESH IMPORT MESH=FreezerCoolSmkPickM ANIVFILE=MODELS\FreezerCoolSmkM_a.3d DATAFILE=MODELS\FreezerCoolSmkM_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=FreezerCoolSmkPickM X=0 Y=0 Z=0 Yaw=128

#exec MESH SEQUENCE MESH=FreezerCoolSmkPickM SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FreezerCoolSmkPickM MESH=FreezerCoolSmkPickM
#exec MESHMAP SCALE MESHMAP=FreezerCoolSmkPickM X=0.10625 Y=0.13500 Z=0.2125

var() texture SmkTex[4];
var() float RisingSpeed;
var() Mesh RightMesh, LeftMesh;

simulated function PostBeginPlay()
{
local texture SelTex;
local byte SelSlot, i;
	
	SelTex = SmkTex[Rand(ArrayCount(SmkTex))];
	SelSlot = Rand(6) + 1;
	
	for (i = 0; i < 8; i++)
		MultiSkins[i] = None;
	
	MultiSkins[SelSlot] = SelTex;
	if (FRand() < 0.15)
		MultiSkins[Rand(6)] = SmkTex[Rand(ArrayCount(SmkTex))];
}

simulated function SetDirection( bool bRight)
{
	Velocity = RisingSpeed * vect(0,0,1);
	
	if (bRight)
	{
		Mesh = RightMesh;
		Velocity += RisingSpeed * (vect(0,-1,0) >> Rotation);
	}
	else
	{
		Mesh = LeftMesh;
		Velocity += RisingSpeed * (vect(0,1,0) >> Rotation);
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=FreezerCoolSmkPick
	RightMesh=FreezerCoolSmkPick
	LeftMesh=FreezerCoolSmkPickM
	
	bParticles=True
	bRandomFrame=True
	
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=1.000000
	LifeSpan=0.650000
	ScaleGlow=1.000000
	bNetTemporary=True
	SpriteProjForward=0.000000
	Physics=PHYS_Projectile
	RisingSpeed=-20.000000
	
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
