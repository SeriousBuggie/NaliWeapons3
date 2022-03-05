//////////////////////////////////////////////////////////////
//				Feralidragon (03-11-2013)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MultiMissileMBoxMissileSmoke expands NWBaseCloud;

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		RotationRate.Roll = Int(default.RotationRate.Roll * (FRand()*2-1));
	Super.PostBeginPlay();
}

defaultproperties
{
	Mesh=LodMesh'Botpack.Smokebm'
	DrawScale=1.250000
	MinDrawScale=0.650000
	ScaleGlow=0.400000
	LifeSpan=2.350000
	FadeInTime=0.200000
	FadeOutTime=3.000000

	Style=STY_Translucent
	Texture=NukeWSmk01
	MultiSkins(0)=NukeWSmk01
	MultiSkins(1)=NukeWSmk02
	MultiSkins(2)=NukeWSmk03
	MultiSkins(3)=NukeWSmk04
	MultiSkins(4)=NukeWSmk05
	MultiSkins(5)=NukeWSmk06
	MultiSkins(6)=NukeWSmk07
	MultiSkins(7)=NukeWSmk08
	
	bNetTemporary=True
	bAnimByOwner=False
	Physics=PHYS_Rotating
	bFixedRotationDir=True
	RotationRate=(Roll=16384)
	bWhiteSmoke=True
}
