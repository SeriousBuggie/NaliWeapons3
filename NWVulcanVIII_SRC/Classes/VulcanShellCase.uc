//////////////////////////////////////////////////////////////
//				Feralidragon (14-10-2010)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanShellCase expands NWShellCase;

#exec MESH IMPORT MESH=VulcanShellCase ANIVFILE=MODELS\VulcanShellCase_a.3d DATAFILE=MODELS\VulcanShellCase_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=VulcanShellCase STRENGTH=0.5
#exec MESH ORIGIN MESH=VulcanShellCase X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=VulcanShellCase SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VulcanShellCase SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=VulcanShellCase MESH=VulcanShellCase
#exec MESHMAP SCALE MESHMAP=VulcanShellCase X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=VulcanBulletCaseSk FILE=SKINS\VulcanBulletCaseSk.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=VulcanShellCase NUM=1 TEXTURE=VulcanBulletCaseSk

defaultproperties
{
    Mesh=VulcanShellCase
	DrawScale=0.650000
}
