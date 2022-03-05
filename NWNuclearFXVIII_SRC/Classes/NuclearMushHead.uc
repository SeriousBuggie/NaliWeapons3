//////////////////////////////////////////////////////////////
//				Feralidragon (24-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearMushHead expands NuclearMushFX;

#exec MESH IMPORT MESH=NuclearMushHead ANIVFILE=MODELS\NuclearMushHead_a.3d DATAFILE=MODELS\NuclearMushHead_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NuclearMushHead STRENGTH=0.1
#exec MESH ORIGIN MESH=NuclearMushHead X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NuclearMushHead SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=NuclearMushHead SEQ=PlayRevolve STARTFRAME=0 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=NuclearMushHead SEQ=LoopRevolve STARTFRAME=0 NUMFRAMES=40 RATE=39.0

#exec MESHMAP NEW MESHMAP=NuclearMushHead MESH=NuclearMushHead
#exec MESHMAP SCALE MESHMAP=NuclearMushHead X=4.125 Y=4.125 Z=5.25

var() float RisingSpeed, RevolveRate;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	LoopAnim('LoopRevolve', RevolveRate);
	Velocity.Z = RisingSpeed;
}

simulated function HitWall( vector HitNormal, actor Wall)
{
	Velocity *= 0;
	SetPhysics(PHYS_None);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=NuclearMushHead
	Physics=PHYS_Projectile
	bCollideWorld=True
	DrawScale=15.000000
	
	ScaleGlow=8.000000
	MinLifeSpan=6.000000
	MaxLifeSpan=8.000000
	FXMode=0
	FadeInTime=0.500000
	FadeOutTime=3.000000
	bSpawnNext=True
	
	ClassMode1=Class'NuclearMushHeadMa'
	ClassMode2=Class'NuclearMushHeadMb'
	ClassMode3=Class'NuclearMushHeadMc'
	
	RevolveRate=0.150000
	RisingSpeed=375.000000
}
