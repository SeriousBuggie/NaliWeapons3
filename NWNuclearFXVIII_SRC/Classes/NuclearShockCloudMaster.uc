//////////////////////////////////////////////////////////////
//				Feralidragon (25-04-2011)
//
// NW3 NUCLEAR FX BUILD 1.00
//////////////////////////////////////////////////////////////

class NuclearShockCloudMaster expands NaliWEffects;

#exec MESH IMPORT MESH=NuclearShockCloudMaster ANIVFILE=MODELS\NuclearShockCloud_a.3d DATAFILE=MODELS\NuclearShockCloud_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=NuclearShockCloudMaster X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NuclearShockCloudMaster SEQ=All STARTFRAME=0 NUMFRAMES=41
#exec MESH SEQUENCE MESH=NuclearShockCloudMaster SEQ=PlayRevolve STARTFRAME=0 NUMFRAMES=41 RATE=40.0
#exec MESH SEQUENCE MESH=NuclearShockCloudMaster SEQ=LoopRevolve STARTFRAME=0 NUMFRAMES=40 RATE=39.0

#exec MESHMAP NEW MESHMAP=NuclearShockCloudMaster MESH=NuclearShockCloudMaster
#exec MESHMAP SCALE MESHMAP=NuclearShockCloudMaster X=0.1 Y=0.1 Z=0.2

var() float RevolveRate;

simulated function PostBeginPlay()
{
	LoopAnim('LoopRevolve', RevolveRate);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=NuclearShockCloudMaster
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
	bAlwaysRelevant=True
	
	LifeSpan=30.000000
	
	RevolveRate=0.100000
}
