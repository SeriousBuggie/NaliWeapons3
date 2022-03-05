//////////////////////////////////////////////////////////////
//				Feralidragon (10-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WREShellCase expands NWShellCase;

#exec MESH IMPORT MESH=WREShellCase ANIVFILE=MODELS\WREShellCase_a.3d DATAFILE=MODELS\WREShellCase_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=WREShellCase STRENGTH=0.5
#exec MESH ORIGIN MESH=WREShellCase X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=WREShellCase SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=WREShellCase SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=WREShellCase MESH=WREShellCase
#exec MESHMAP SCALE MESHMAP=WREShellCase X=0.078 Y=0.078 Z=0.156

#exec TEXTURE IMPORT NAME=Sk_WREBulletCase FILE=SKINS\Sk_WREBulletCase.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=WREShellCase NUM=1 TEXTURE=Sk_WREBulletCase

defaultproperties
{
    Mesh=WREShellCase
	DrawScale=1.000000
}
