//////////////////////////////////////////////////////////////
//				Feralidragon (03-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IceBaseMeltSmk expands NaliWEffects;

#exec MESH IMPORT MESH=IceBaseMeltSmk ANIVFILE=MODELS\IceBaseMeltSmk_a.3d DATAFILE=MODELS\IceBaseMeltSmk_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IceBaseMeltSmk STRENGTH=0.5
#exec MESH ORIGIN MESH=IceBaseMeltSmk X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IceBaseMeltSmk SEQ=All STARTFRAME=0 NUMFRAMES=7
#exec MESH SEQUENCE MESH=IceBaseMeltSmk SEQ=Shrink STARTFRAME=0 NUMFRAMES=4 RATE=4.0
#exec MESH SEQUENCE MESH=IceBaseMeltSmk SEQ=Grow STARTFRAME=3 NUMFRAMES=4 RATE=4.0

#exec MESHMAP NEW MESHMAP=IceBaseMeltSmk MESH=IceBaseMeltSmk
#exec MESHMAP SCALE MESHMAP=IceBaseMeltSmk X=0.6 Y=0.6 Z=1.2

var() texture SmkTex[4];
var() float RisingSpeed;
var float AFrame;

replication
{
	unreliable if (Role == ROLE_Authority)
		AFrame;
}

simulated function PostBeginPlay()
{
local texture SelTex;
local byte SelSlot, i;
	
	SelTex = SmkTex[Rand(ArrayCount(SmkTex))];
	
	for (i = 0; i < 8; i++)
		MultiSkins[i] = None;
	
	for (i = 0; i < 4; i++)
	{
		SelSlot = Rand(8);
		MultiSkins[SelSlot] = SelTex;
	}
	
	Velocity = RisingSpeed * vect(0,0,1);
}

function getOwnerAnim( actor A)
{
	AnimFrame = A.AnimFrame;
	AFrame = AnimFrame;
}

simulated function Tick(float Delta)
{
	if (AnimFrame == 0 && Role < ROLE_Authority && AFrame != 0)
		AnimFrame = AFrame; 
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=IceBaseMeltSmk
	
	bParticles=True
	bRandomFrame=True
	
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=3.000000
	LifeSpan=0.750000
	ScaleGlow=1.000000
	bNetTemporary=True
	SpriteProjForward=0.000000
	Physics=PHYS_Projectile
	RisingSpeed=100.000000
	
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
	
	AnimSequence=Shrink

}
