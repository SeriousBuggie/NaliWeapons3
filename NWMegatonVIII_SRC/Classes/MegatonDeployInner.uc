//////////////////////////////////////////////////////////////
//				Feralidragon (18-08-2011)
//
// NW3 MEGATON BUILD 1.00
//////////////////////////////////////////////////////////////

class MegatonDeployInner expands NaliTrail;

#exec MESH IMPORT MESH=MegatonDeployInner ANIVFILE=MODELS\MegatonDeployInner_a.3d DATAFILE=MODELS\MegatonDeployInner_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=MegatonDeployInner STRENGTH=0.0
#exec MESH ORIGIN MESH=MegatonDeployInner X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=MegatonDeployInner SEQ=All STARTFRAME=0 NUMFRAMES=60
#exec MESH SEQUENCE MESH=MegatonDeployInner SEQ=Openned STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonDeployInner SEQ=Closed STARTFRAME=29 NUMFRAMES=1
#exec MESH SEQUENCE MESH=MegatonDeployInner SEQ=Openning STARTFRAME=29 NUMFRAMES=31 RATE=30.0
#exec MESH SEQUENCE MESH=MegatonDeployInner SEQ=Closing STARTFRAME=0 NUMFRAMES=30 RATE=29.0

#exec MESHMAP NEW MESHMAP=MegatonDeployInner MESH=MegatonDeployInner
#exec MESHMAP SCALE MESHMAP=MegatonDeployInner X=0.0712 Y=0.0712 Z=0.1424

#exec TEXTURE IMPORT NAME=Sk_MegatonInner01 FILE=SKINS\Sk_MegatonInner01.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDeployInner NUM=1 TEXTURE=Sk_MegatonInner01

#exec TEXTURE IMPORT NAME=Sk_MegatonInner02 FILE=SKINS\Sk_MegatonInner02.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=MegatonDeployInner NUM=2 TEXTURE=Sk_MegatonInner02

#exec TEXTURE IMPORT NAME=MegatonOuterGlass_Red FILE=SKINS\MegatonOuterGlass_Red.bmp GROUP=Overlays LODSET=2 FLAGS=2
#exec TEXTURE IMPORT NAME=MegatonOuterGlass_Blue FILE=SKINS\MegatonOuterGlass_Blue.bmp GROUP=Overlays LODSET=2 FLAGS=2
#exec TEXTURE IMPORT NAME=MegatonOuterGlass_Green FILE=SKINS\MegatonOuterGlass_Green.bmp GROUP=Overlays LODSET=2 FLAGS=2
#exec TEXTURE IMPORT NAME=MegatonOuterGlass_Yellow FILE=SKINS\MegatonOuterGlass_Yellow.bmp GROUP=Overlays LODSET=2 FLAGS=2

#exec MESHMAP SETTEXTURE MESHMAP=MegatonDeployInner NUM=3 TEXTURE=MegatonOuterGlass_Red

#exec OBJ LOAD FILE=Textures\MegatonFX.utx PACKAGE=NWMegatonVIII_SRC.FX

#exec MESHMAP SETTEXTURE MESHMAP=MegatonDeployInner NUM=4 TEXTURE=MegatonInnerGlassFXRed

#exec TEXTURE IMPORT NAME=MegatonMetal FILE=SKINS\MegatonMetal.bmp GROUP=Skins LODSET=2

var() texture InnerGlass[4], OuterGlass[4];

function SetTeamSkin(byte n)
{
	if (n >= ArrayCount(OuterGlass))
		n = 0;
		
	MultiSkins[3] = OuterGlass[n];
	MultiSkins[4] = InnerGlass[n];
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=MegatonDeployInner
	AnimSequence=Closed
	Texture=MegatonMetal
	bNetTemporary=False
	LifeSpan=0.000000
	bAnimByOwner=True
	
	AmbientGlow=255
	
	OuterGlass(0)=MegatonOuterGlass_Red
	OuterGlass(1)=MegatonOuterGlass_Blue
	OuterGlass(2)=MegatonOuterGlass_Green
	OuterGlass(3)=MegatonOuterGlass_Yellow
	
	InnerGlass(0)=MegatonInnerGlassFXRed
	InnerGlass(1)=MegatonInnerGlassFXBlue
	InnerGlass(2)=MegatonInnerGlassFXGreen
	InnerGlass(3)=MegatonInnerGlassFXYellow
}
