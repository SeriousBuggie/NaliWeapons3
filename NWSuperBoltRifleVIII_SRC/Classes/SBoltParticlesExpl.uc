//////////////////////////////////////////////////////////////
//				Feralidragon (04-03-2013)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SBoltParticlesExpl expands NaliWEffects;

#exec MESH IMPORT MESH=SBoltParticlesExpl ANIVFILE=MODELS\SBoltParticlesExpl_a.3d DATAFILE=MODELS\SBoltParticlesExpl_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=SBoltParticlesExpl STRENGTH=0.5
#exec MESH ORIGIN MESH=SBoltParticlesExpl X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=SBoltParticlesExpl SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=SBoltParticlesExpl SEQ=Start STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltParticlesExpl SEQ=End STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=SBoltParticlesExpl SEQ=Expand STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=SBoltParticlesExpl SEQ=Compress STARTFRAME=1 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=SBoltParticlesExpl MESH=SBoltParticlesExpl
#exec MESHMAP SCALE MESHMAP=SBoltParticlesExpl X=0.6 Y=0.6 Z=1.2

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=SBoltParticlesExpl
	
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=2.000000
	DrawScale=0.075000
	LifeSpan=0.750000
	bParticles=True
	Texture=SBoltLight
}
