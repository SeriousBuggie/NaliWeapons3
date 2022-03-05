//////////////////////////////////////////////////////////////
//				Feralidragon (21-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonRocketSmkTrail expands IonRocketBaseCloud;

#exec MESH IMPORT MESH=IonRocketSmkTrail ANIVFILE=MODELS\IonRocketSmkTrail_a.3d DATAFILE=MODELS\IonRocketSmkTrail_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=IonRocketSmkTrail STRENGTH=0.1
#exec MESH ORIGIN MESH=IonRocketSmkTrail X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonRocketSmkTrail SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonRocketSmkTrail SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonRocketSmkTrail MESH=IonRocketSmkTrail
#exec MESHMAP SCALE MESHMAP=IonRocketSmkTrail X=1.2 Y=1.2 Z=0.4

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	
	if (Level.NetMode != NM_DedicatedServer)
		RotationRate.Roll = (Rand(16384)-8192);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonRocketSmkTrail
	bFixedRotationDir=True
	Physics=PHYS_Rotating
	
	DrawScale=8.000000
	MinDrawScale=4.000000
	bWhiteSmoke=True
	FadeInTime=0.000000
	FadeOutTime=5.000000
	ScaleGlow=0.550000
	
	bAnimByOwner=True
	LifeSpan=8.000000
	
	CloudDetail=1
}
