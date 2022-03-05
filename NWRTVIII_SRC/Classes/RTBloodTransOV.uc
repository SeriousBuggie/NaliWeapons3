//////////////////////////////////////////////////////////////
//				Feralidragon (08-04-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTBloodTransOV expands NaliTrail;

#exec MESH IMPORT MESH=RTBloodTransOV ANIVFILE=MODELS\RTBloodTransOV_a.3d DATAFILE=MODELS\RTBloodTransOV_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=RTBloodTransOV STRENGTH=0.25
#exec MESH ORIGIN MESH=RTBloodTransOV X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=RTBloodTransOV SEQ=All STARTFRAME=0 NUMFRAMES=35
#exec MESH SEQUENCE MESH=RTBloodTransOV SEQ=Razored STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTBloodTransOV SEQ=Normal STARTFRAME=5 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTBloodTransOV SEQ=RazorOff STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=RTBloodTransOV SEQ=RazorOn STARTFRAME=5 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=RTBloodTransOV SEQ=SpinOnce STARTFRAME=10 NUMFRAMES=25 RATE=24.0
#exec MESH SEQUENCE MESH=RTBloodTransOV SEQ=SpinLoop STARTFRAME=10 NUMFRAMES=24 RATE=23.0

#exec MESHMAP NEW MESHMAP=RTBloodTransOV MESH=RTBloodTransOV
#exec MESHMAP SCALE MESHMAP=RTBloodTransOV X=0.04 Y=0.04 Z=0.08


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=RTBloodTransOV
	Style=STY_Modulated
	ScaleGlow=1.000000
	bUnlit=False
	bAnimByOwner=True
}
