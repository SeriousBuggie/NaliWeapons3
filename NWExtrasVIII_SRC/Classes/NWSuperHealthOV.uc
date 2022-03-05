//////////////////////////////////////////////////////////////
//				Feralidragon (19-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWSuperHealthOV expands NWUDamOV;

#exec MESH IMPORT MESH=NWSuperHealthOV ANIVFILE=MODELS\NWSuperHealthOV_a.3d DATAFILE=MODELS\NWSuperHealthOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWSuperHealthOV STRENGTH=0.2
#exec MESH ORIGIN MESH=NWSuperHealthOV X=0 Y=0 Z=0 YAW=64

#exec MESH SEQUENCE MESH=NWSuperHealthOV SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWSuperHealthOV SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWSuperHealthOV MESH=NWSuperHealthOV
#exec MESHMAP SCALE MESHMAP=NWSuperHealthOV X=0.1 Y=0.1 Z=0.2

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWSuperHealthOV
	ScaleGlow=2.000000
	MultiSkins(1)=Texture'Botpack.ShaneFx.top3'
}
