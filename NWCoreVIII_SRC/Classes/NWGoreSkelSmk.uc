//////////////////////////////////////////////////////////////
//				Feralidragon (24-02-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWGoreSkelSmk expands NaliWEffects;

#exec MESH IMPORT MESH=GoreSkelSmk ANIVFILE=MODELS\GoreSkelSmk_a.3d DATAFILE=MODELS\GoreSkelSmk_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=GoreSkelSmk STRENGTH=0.5
#exec MESH ORIGIN MESH=GoreSkelSmk X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GoreSkelSmk SEQ=All STARTFRAME=0 NUMFRAMES=26
#exec MESH SEQUENCE MESH=GoreSkelSmk SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelSmk SEQ=StillAlt STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GoreSkelSmk SEQ=Fall STARTFRAME=0 NUMFRAMES=26 RATE=25.0

#exec MESHMAP NEW MESHMAP=GoreSkelSmk MESH=GoreSkelSmk
#exec MESHMAP SCALE MESHMAP=GoreSkelSmk X=0.32 Y=0.32 Z=0.64


var() texture SmkTex[8];
var() float RiseSpeed;
var() float FadeInTime;

simulated function PostBeginPlay()
{
	Velocity = RiseSpeed * Normal(-Region.Zone.ZoneGravity);
	MultiSkins[Rand(ArrayCount(MultiSkins))] = SmkTex[Rand(ArrayCount(SmkTex))];
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if ((default.LifeSpan - LifeSpan) < FadeInTime)
			ScaleGlow = (default.LifeSpan - LifeSpan) * default.ScaleGlow / FadeInTime;
		else
			ScaleGlow = LifeSpan * default.ScaleGlow / default.LifeSpan;
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=GoreSkelSmk
	DrawScale=1.000000
	Physics=PHYS_Projectile
	bParticles=True
	bRandomFrame=True
	bAnimByOwner=True
	Style=STY_Translucent
	Texture=NukeWSmk01
	
	SmkTex(0)=NukeWSmk01
	SmkTex(1)=NukeWSmk02
	SmkTex(2)=NukeWSmk03
	SmkTex(3)=NukeWSmk04
	SmkTex(4)=NukeWSmk05
	SmkTex(5)=NukeWSmk06
	SmkTex(6)=NukeWSmk07
	SmkTex(7)=NukeWSmk08
	
	ScaleGlow=0.350000
	LifeSpan=1.500000
	FadeInTime=0.100000
	RiseSpeed=25.000000
}
