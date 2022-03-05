//////////////////////////////////////////////////////////////
//				Feralidragon (21-08-2011)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////

class MegatonDeployInnerOV expands NaliTrail;

#exec MESH IMPORT MESH=MegatonDeployInnerOV ANIVFILE=MODELS\MegatonDeployInnerOV_a.3d DATAFILE=MODELS\MegatonDeployInnerOV_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MegatonDeployInnerOV STRENGTH=0.0
#exec MESH ORIGIN MESH=MegatonDeployInnerOV X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MegatonDeployInnerOV SEQ=All STARTFRAME=0 NUMFRAMES=60
#exec MESH SEQUENCE MESH=MegatonDeployInnerOV SEQ=Openned STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonDeployInnerOV SEQ=Closed STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonDeployInnerOV SEQ=Openning STARTFRAME=29 NUMFRAMES=31 RATE=30.0
#exec MESH SEQUENCE MESH=MegatonDeployInnerOV SEQ=Closing STARTFRAME=0 NUMFRAMES=30 RATE=29.0

#exec MESHMAP NEW MESHMAP=MegatonDeployInnerOV MESH=MegatonDeployInnerOV
#exec MESHMAP SCALE MESHMAP=MegatonDeployInnerOV X=0.0712 Y=0.0712 Z=0.1424

#exec TEXTURE IMPORT NAME=Sk_MegatonInnerOVRed FILE=SKINS\Sk_MegatonInnerOVRed.bmp GROUP=Overlays LODSET=2 FLAGS=2
#exec TEXTURE IMPORT NAME=Sk_MegatonInnerOVBlue FILE=SKINS\Sk_MegatonInnerOVBlue.bmp GROUP=Overlays LODSET=2 FLAGS=2
#exec TEXTURE IMPORT NAME=Sk_MegatonInnerOVGreen FILE=SKINS\Sk_MegatonInnerOVGreen.bmp GROUP=Overlays LODSET=2 FLAGS=2
#exec TEXTURE IMPORT NAME=Sk_MegatonInnerOVYellow FILE=SKINS\Sk_MegatonInnerOVYellow.bmp GROUP=Overlays LODSET=2 FLAGS=2

#exec MESHMAP SETTEXTURE MESHMAP=MegatonDeployInnerOV NUM=1 TEXTURE=Sk_MegatonInnerOVRed


var() texture TeamOV[4];

function SetTeamOV(byte n)
{
	if (n >= ArrayCount(TeamOV))
		n = 0;
	
	MultiSkins[1] = TeamOV[n];
}


defaultproperties
{
    DrawType=DT_Mesh
    Mesh=MegatonDeployInnerOV
	AnimSequence=Closed
	bNetTemporary=False
	LifeSpan=0.000000
	bAnimByOwner=True
	
	ScaleGlow=2.000000
	Style=STY_Translucent
	AmbientGlow=255
	
	TeamOV(0)=Sk_MegatonInnerOVRed
	TeamOV(1)=Sk_MegatonInnerOVBlue
	TeamOV(2)=Sk_MegatonInnerOVGreen
	TeamOV(3)=Sk_MegatonInnerOVYellow
}
