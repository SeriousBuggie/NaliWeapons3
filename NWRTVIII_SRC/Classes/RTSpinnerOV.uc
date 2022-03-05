//////////////////////////////////////////////////////////////
//				Feralidragon (29-05-2013)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTSpinnerOV expands NaliTrail;

#exec MESH IMPORT MESH=RTSpinnerOV ANIVFILE=MODELS\RTSpinnerOV_a.3d DATAFILE=MODELS\RTSpinnerOV_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=RTSpinnerOV STRENGTH=0.15
#exec MESH ORIGIN MESH=RTSpinnerOV X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=RTSpinnerOV SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=RTSpinnerOV SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=RTSpinnerOV MESH=RTSpinnerOV
#exec MESHMAP SCALE MESHMAP=RTSpinnerOV X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=Sk_RTSpinnerOV FILE=Overlays\Sk_RTSpinnerOV.bmp GROUP=Overlays LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=RTSpinnerOV NUM=1 TEXTURE=Sk_RTSpinnerOV


simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = default.ScaleGlow + (FRand()*0.5 - 0.25);
	Super.Tick(Delta);
}


defaultproperties
{
    DrawType=DT_Mesh
    Mesh=RTSpinnerOV
	DrawScale=1.000000
	ScaleGlow=1.500000
	Style=STY_Translucent
	bUnlit=True
}
