//////////////////////////////////////////////////////////////
//				Feralidragon (20-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonRocketBaseCloudMaster expands NaliWEffects;

#exec MESH IMPORT MESH=IonRocketBaseCloudMaster ANIVFILE=MODELS\IonRocketBaseCloud_a.3d DATAFILE=MODELS\IonRocketBaseCloud_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=IonRocketBaseCloudMaster X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonRocketBaseCloudMaster SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=IonRocketBaseCloudMaster SEQ=PlayRevolve STARTFRAME=0 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=IonRocketBaseCloudMaster SEQ=LoopRevolve STARTFRAME=0 NUMFRAMES=40 RATE=39.0

#exec MESHMAP NEW MESHMAP=IonRocketBaseCloudMaster MESH=IonRocketBaseCloudMaster
#exec MESHMAP SCALE MESHMAP=IonRocketBaseCloudMaster X=0.1 Y=0.1 Z=0.2

simulated function PostBeginPlay()
{
	LoopAnim('LoopRevolve', 0.1);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=IonRocketBaseCloudMaster
	LODBias=0.500000
	Style=STY_Translucent
	bUnlit=True
	bMeshEnviroMap=True
	Texture=TranslucInvis
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	CollisionHeight=0.000000
	CollisionRadius=0.000000
	Mass=0.000000
	
	LifeSpan=30.000000
}
