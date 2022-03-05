//////////////////////////////////////////////////////////////
//				Feralidragon (13-08-2013)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaSolarSphereMT expands UltimaSolarSphere;

#exec MESH IMPORT MESH=UltimaSolarSphereMT ANIVFILE=MODELS\UltimaSolarSphereMT_a.3d DATAFILE=MODELS\UltimaSolarSphereMT_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaSolarSphereMT STRENGTH=0
#exec MESH ORIGIN MESH=UltimaSolarSphereMT X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=UltimaSolarSphereMT SEQ=All STARTFRAME=0 NUMFRAMES=20
#exec MESH SEQUENCE MESH=UltimaSolarSphereMT SEQ=Fluid STARTFRAME=0 NUMFRAMES=20 RATE=19.0

#exec MESHMAP NEW MESHMAP=UltimaSolarSphereMT MESH=UltimaSolarSphereMT
#exec MESHMAP SCALE MESHMAP=UltimaSolarSphereMT X=0.5 Y=0.5 Z=1.0


simulated function PostBeginPlay()
{
	LoopAnim('Fluid', 5.0);
	Super.PostBeginPlay();
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=UltimaSolarSphereMT
}
