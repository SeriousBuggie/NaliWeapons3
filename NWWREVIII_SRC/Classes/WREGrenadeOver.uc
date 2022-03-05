//////////////////////////////////////////////////////////////
//				Feralidragon (12-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WREGrenadeOver expands NaliTrail;

#exec MESH IMPORT MESH=WREGrenadeOver ANIVFILE=MODELS\WREGrenadeOver_a.3d DATAFILE=MODELS\WREGrenadeOver_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WREGrenadeOver STRENGTH=0.5
#exec MESH ORIGIN MESH=WREGrenadeOver X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=WREGrenadeOver SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WREGrenadeOver SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=WREGrenadeOver MESH=WREGrenadeOver
#exec MESHMAP SCALE MESHMAP=WREGrenadeOver X=0.08 Y=0.08 Z=0.16

var() float LifeTime;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		LifeTime -= Delta;
		ScaleGlow = (Default.LifeTime - LifeTime) * Default.ScaleGlow / Default.LifeTime;
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=WREGrenadeOver
	MultiSkins(1)=IonChargeOnFX
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=2.000000
	LifeTime=2.500000
}
