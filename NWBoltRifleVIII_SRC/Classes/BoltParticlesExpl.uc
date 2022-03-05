//////////////////////////////////////////////////////////////
//				Feralidragon (26-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltParticlesExpl expands NaliWEffects;

#exec MESH IMPORT MESH=BoltParticlesExpl ANIVFILE=MODELS\BoltParticlesExpl_a.3d DATAFILE=MODELS\BoltParticlesExpl_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=BoltParticlesExpl STRENGTH=0.5
#exec MESH ORIGIN MESH=BoltParticlesExpl X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=BoltParticlesExpl SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=BoltParticlesExpl SEQ=Start STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltParticlesExpl SEQ=End STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=BoltParticlesExpl SEQ=Expand STARTFRAME=0 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=BoltParticlesExpl SEQ=Compress STARTFRAME=1 NUMFRAMES=2 RATE=1.0

#exec MESHMAP NEW MESHMAP=BoltParticlesExpl MESH=BoltParticlesExpl
#exec MESHMAP SCALE MESHMAP=BoltParticlesExpl X=0.6 Y=0.6 Z=1.2

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=BoltParticlesExpl
	
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=2.000000
	DrawScale=0.075000
	LifeSpan=0.750000
	bParticles=True
	Texture=BoltLight
}
