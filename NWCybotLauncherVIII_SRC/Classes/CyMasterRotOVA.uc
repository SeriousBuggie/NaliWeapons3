//////////////////////////////////////////////////////////////
//				Feralidragon (07-12-2013)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CyMasterRotOVA expands NaliTrail;

#exec MESH IMPORT MESH=CyMasterRotOVA ANIVFILE=MODELS\CyMasterRotOVA_a.3d DATAFILE=MODELS\CyMasterRotOVA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CyMasterRotOVA STRENGTH=0
#exec MESH ORIGIN MESH=CyMasterRotOVA X=0 Y=0 Z=0 YAW=128

#exec MESH SEQUENCE MESH=CyMasterRotOVA SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CyMasterRotOVA SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CyMasterRotOVA MESH=CyMasterRotOVA
#exec MESHMAP SCALE MESHMAP=CyMasterRotOVA X=0.2 Y=0.2 Z=0.4

#exec TEXTURE IMPORT NAME=CyMasterRot_Sk FILE=SKINS\CyMasterRot_Sk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=CyMasterRotOVA NUM=1 TEXTURE=CyMasterRot_Sk


simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
		ScaleGlow = FRand() * default.ScaleGlow;
	Super.Tick(Delta);
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=CyMasterRotOVA
	Style=STY_Translucent
	bUnlit=True
	ScaleGlow=2.000000
}
