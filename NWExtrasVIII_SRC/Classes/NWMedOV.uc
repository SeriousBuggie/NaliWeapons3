//////////////////////////////////////////////////////////////
//				Feralidragon (18-08-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWMedOV expands NWUDamOV;

#exec MESH IMPORT MESH=NWMedOV ANIVFILE=MODELS\NWMedOV_a.3d DATAFILE=MODELS\NWMedOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=NWMedOV STRENGTH=0.2
#exec MESH ORIGIN MESH=NWMedOV X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=NWMedOV SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=NWMedOV SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=NWMedOV MESH=NWMedOV
#exec MESHMAP SCALE MESHMAP=NWMedOV X=0.1 Y=0.1 Z=0.2

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=NWMedOV
	ScaleGlow=2.000000
	MultiSkins(1)=Texture'WhiteN_Over'
}
