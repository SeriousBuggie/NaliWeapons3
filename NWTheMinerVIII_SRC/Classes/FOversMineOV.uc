//////////////////////////////////////////////////////////////
//				Feralidragon (26-10-2013)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class FOversMineOV expands NWMineTeamOv;

#exec MESH IMPORT MESH=FOversMineOV ANIVFILE=MODELS\FOversMineOV_a.3d DATAFILE=MODELS\FOversMineOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=FOversMineOV STRENGTH=0.25
#exec MESH ORIGIN MESH=FOversMineOV X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=FOversMineOV SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=FOversMineOV SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=FOversMineOV MESH=FOversMineOV
#exec MESHMAP SCALE MESHMAP=FOversMineOV X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=Sk_FMine_OV FILE=Overlays\Sk_FMine_OV.bmp GROUP=Overlays LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=FOversMineOV NUM=1 TEXTURE=Sk_FMine_OV

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=FOversMineOV
	
	BlinkRate=10.000000
	OnRate=1.000000
	OffRate=1.000000
	OnTime=0.000000
	OffTime=1.500000
}
