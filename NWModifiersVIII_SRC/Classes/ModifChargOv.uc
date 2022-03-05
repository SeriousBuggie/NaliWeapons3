//////////////////////////////////////////////////////////////
//				Feralidragon (21-03-2010)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class ModifChargOv expands NaliWActor;

#exec MESH IMPORT MESH=ModifChargOv ANIVFILE=MODELS\ModifChargOv_a.3d DATAFILE=MODELS\ModifChargOv_d.3d X=0 Y=0 Z=0
//#exec MESH LODPARAMS MESH=ModifChargOv STRENGTH=0
#exec MESH ORIGIN MESH=ModifChargOv X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=ModifChargOv SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifChargOv SEQ=Closed STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifChargOv SEQ=Openned STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=ModifChargOv SEQ=Closing STARTFRAME=0 NUMFRAMES=6 RATE=1.0
#exec MESH SEQUENCE MESH=ModifChargOv SEQ=Openning STARTFRAME=5 NUMFRAMES=6 RATE=1.0

#exec MESHMAP NEW MESHMAP=ModifChargOv MESH=ModifChargOv
#exec MESHMAP SCALE MESHMAP=ModifChargOv X=0.05 Y=0.05 Z=0.1

simulated function PostBeginPlay()
{
	if (Level.NetMode != NM_DedicatedServer)
		LODBias = FMax(1.0, Class'NWInfo'.default.ChargersDistDetail * Class'NWInfo'.default.MaxLODBias/255);
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=ModifChargOv
	bUnlit=True
	ScaleGlow=2.000000
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Style=STY_Translucent
	bAnimByOwner=True
}
