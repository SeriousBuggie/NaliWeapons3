//////////////////////////////////////////////////////////////
//				Feralidragon (28-08-2010)
//
// NW3 GRAVITON BUILD 1.00
//////////////////////////////////////////////////////////////

class GravChargeFXParticle expands NaliWEffects;

//Particle 01 Import
#exec MESH IMPORT MESH=GravChargeParticle01 ANIVFILE=MODELS\GravChargeParticle01_a.3d DATAFILE=MODELS\GravChargeParticle01_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=GravChargeParticle01 X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=GravChargeParticle01 SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GravChargeParticle01 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeParticle01 SEQ=Collapsed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeParticle01 SEQ=CloseCharge STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GravChargeParticle01 MESH=GravChargeParticle01
#exec MESHMAP SCALE MESHMAP=GravChargeParticle01 X=0.03 Y=0.03 Z=0.06

//Particle 02 Import
#exec MESH IMPORT MESH=GravChargeParticle02 ANIVFILE=MODELS\GravChargeParticle02_a.3d DATAFILE=MODELS\GravChargeParticle02_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=GravChargeParticle02 X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=GravChargeParticle02 SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GravChargeParticle02 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeParticle02 SEQ=Collapsed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeParticle02 SEQ=CloseCharge STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GravChargeParticle02 MESH=GravChargeParticle02
#exec MESHMAP SCALE MESHMAP=GravChargeParticle02 X=0.03 Y=0.03 Z=0.06

//Particle 03 Import
#exec MESH IMPORT MESH=GravChargeParticle03 ANIVFILE=MODELS\GravChargeParticle03_a.3d DATAFILE=MODELS\GravChargeParticle03_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=GravChargeParticle03 X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=GravChargeParticle03 SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GravChargeParticle03 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeParticle03 SEQ=Collapsed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeParticle03 SEQ=CloseCharge STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GravChargeParticle03 MESH=GravChargeParticle03
#exec MESHMAP SCALE MESHMAP=GravChargeParticle03 X=0.03 Y=0.03 Z=0.06

//Particle 04 Import
#exec MESH IMPORT MESH=GravChargeParticle04 ANIVFILE=MODELS\GravChargeParticle04_a.3d DATAFILE=MODELS\GravChargeParticle04_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=GravChargeParticle04 X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=GravChargeParticle04 SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GravChargeParticle04 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeParticle04 SEQ=Collapsed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeParticle04 SEQ=CloseCharge STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GravChargeParticle04 MESH=GravChargeParticle04
#exec MESHMAP SCALE MESHMAP=GravChargeParticle04 X=0.03 Y=0.03 Z=0.06

//Particle 05 Import
#exec MESH IMPORT MESH=GravChargeParticle05 ANIVFILE=MODELS\GravChargeParticle05_a.3d DATAFILE=MODELS\GravChargeParticle05_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=GravChargeParticle05 X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=GravChargeParticle05 SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GravChargeParticle05 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeParticle05 SEQ=Collapsed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeParticle05 SEQ=CloseCharge STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GravChargeParticle05 MESH=GravChargeParticle05
#exec MESHMAP SCALE MESHMAP=GravChargeParticle05 X=0.03 Y=0.03 Z=0.06

//Particle 06 Import
#exec MESH IMPORT MESH=GravChargeParticle06 ANIVFILE=MODELS\GravChargeParticle06_a.3d DATAFILE=MODELS\GravChargeParticle06_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=GravChargeParticle06 X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=GravChargeParticle06 SEQ=All STARTFRAME=0 NUMFRAMES=2
#exec MESH SEQUENCE MESH=GravChargeParticle06 SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeParticle06 SEQ=Collapsed STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=GravChargeParticle06 SEQ=CloseCharge STARTFRAME=0 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=GravChargeParticle06 MESH=GravChargeParticle06
#exec MESHMAP SCALE MESHMAP=GravChargeParticle06 X=0.03 Y=0.03 Z=0.06



var() Mesh RandGravParticleMesh[6];
var float MaxFadeTime, FadeTimeCount;

simulated function SetAndPlay( byte MeshType, optional float PlayRate)
{
	Mesh = RandGravParticleMesh[MeshType];
	
	if (PlayRate > 0)
	{
		PlayAnim('CloseCharge', PlayRate, 0.0);
		MaxFadeTime = 1 / PlayRate;
	}
	else
	{
		PlayAnim('CloseCharge', 1.0, 0.0);
		MaxFadeTime = 1.0;
	}
	
	FadeTimeCount = MaxFadeTime;
	ScaleGlow = 0.0;
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && FadeTimeCount > 0.0)
	{
		FadeTimeCount -= Delta;
		if (FadeTimeCount < 0.0)
			FadeTimeCount = 0.0;
		
		ScaleGlow = (MaxFadeTime - FadeTimeCount) * Default.ScaleGlow / MaxFadeTime;
	}
}

simulated function AnimEnd()
{
	Destroy();
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=GravChargeTrace01
	
	bHidden=True
	Style=STY_Translucent
	ScaleGlow=1.500000
	bUnlit=True
	bNetTemporary=True
	LifeSpan=0.000000
	
	bParticles=True
	Texture=GravGlow01
	DrawScale=0.060000
	
	RandGravParticleMesh(0)=GravChargeParticle01
	RandGravParticleMesh(1)=GravChargeParticle02
	RandGravParticleMesh(2)=GravChargeParticle03
	RandGravParticleMesh(3)=GravChargeParticle04
	RandGravParticleMesh(4)=GravChargeParticle05
	RandGravParticleMesh(5)=GravChargeParticle06
	
	MaxFadeTime=1.000000
	FadeTimeCount=1.000000
}
