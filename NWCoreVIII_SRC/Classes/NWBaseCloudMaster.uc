//////////////////////////////////////////////////////////////
//				Feralidragon (29-06-2013)
//
// NW3 CORE 1.00
//////////////////////////////////////////////////////////////

class NWBaseCloudMaster expands NaliWEffects
abstract;

#exec MESH IMPORT MESH=NWBaseCloudMaster ANIVFILE=MODELS\NWBaseCloud_a.3d DATAFILE=MODELS\NWBaseCloud_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=NWBaseCloudMaster X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NWBaseCloudMaster SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=NWBaseCloudMaster SEQ=PlayRevolve STARTFRAME=0 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=NWBaseCloudMaster SEQ=LoopRevolve STARTFRAME=0 NUMFRAMES=40 RATE=39.0

#exec MESHMAP NEW MESHMAP=NWBaseCloudMaster MESH=NWBaseCloudMaster
#exec MESHMAP SCALE MESHMAP=NWBaseCloudMaster X=0.1 Y=0.1 Z=0.2

simulated function PostBeginPlay()
{
	LoopAnim('LoopRevolve', 0.1);
}

defaultproperties
{
    DrawType=DT_Mesh
	Mesh=NWBaseCloudMaster
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
	
	LifeSpan=15.000000
}
