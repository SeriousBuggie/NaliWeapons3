//////////////////////////////////////////////////////////////
//				Feralidragon (21-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonRocketSmkTrailMaster expands NaliWEffects;

#exec MESH IMPORT MESH=IonRocketSmkTrailMaster ANIVFILE=MODELS\IonRocketSmkTrail_a.3d DATAFILE=MODELS\IonRocketSmkTrail_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=IonRocketSmkTrailMaster X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=IonRocketSmkTrailMaster SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonRocketSmkTrailMaster SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=IonRocketSmkTrailMaster MESH=IonRocketSmkTrailMaster
#exec MESHMAP SCALE MESHMAP=IonRocketSmkTrailMaster X=1.2 Y=1.2 Z=0.4

simulated function PostBeginPlay()
{
	SpawnSmk();
}

function SpawnSmk()
{
local rotator R;

	R = Rotation;
	R.Roll = Rand(16384)*4;
	Spawn(Class'IonRocketSmkTrail', Self,, Location, R);
	R.Roll = Rand(16384)*4;
	Spawn(Class'IonRocketSmkTrailB', Self,,, R);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=IonRocketSmkTrailMaster
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
	
	LifeSpan=12.000000
}
