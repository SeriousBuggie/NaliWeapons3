//////////////////////////////////////////////////////////////
//				Feralidragon (19-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWVialOV expands NWUDamOV;

#exec MESH IMPORT MESH=NWVialOV ANIVFILE=MODELS\NWVialOV_a.3d DATAFILE=MODELS\NWVialOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWVialOV STRENGTH=0.2
#exec MESH ORIGIN MESH=NWVialOV X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NWVialOV SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWVialOV SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWVialOV MESH=NWVialOV
#exec MESHMAP SCALE MESHMAP=NWVialOV X=0.04 Y=0.04 Z=0.08


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWVialOV
	ScaleGlow=2.000000
	MultiSkins(1)=Texture'Botpack.ShaneFx.bluestuff'
}
