//////////////////////////////////////////////////////////////
//				Feralidragon (24-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerRocketShell expands IonizerRocketFuelBody;

#exec MESH IMPORT MESH=IonizerRocketShell ANIVFILE=MODELS\IonizerRocketShell_a.3d DATAFILE=MODELS\IonizerRocketShell_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonizerRocketShell STRENGTH=0.0
#exec MESH ORIGIN MESH=IonizerRocketShell X=0 Y=0 Z=0 PITCH=-64

#exec MESH SEQUENCE MESH=IonizerRocketShell SEQ=All STARTFRAME=0 NUMFRAMES=19
#exec MESH SEQUENCE MESH=IonizerRocketShell SEQ=FullRot STARTFRAME=0 NUMFRAMES=19 RATE=18.0
#exec MESH SEQUENCE MESH=IonizerRocketShell SEQ=HalfRot1 STARTFRAME=0 NUMFRAMES=10 RATE=9.0
#exec MESH SEQUENCE MESH=IonizerRocketShell SEQ=HalfRot2 STARTFRAME=9 NUMFRAMES=10 RATE=9.0

#exec MESHMAP NEW MESHMAP=IonizerRocketShell MESH=IonizerRocketShell
#exec MESHMAP SCALE MESHMAP=IonizerRocketShell X=1.2 Y=1.2 Z=2.4

#exec TEXTURE IMPORT NAME=Sk_IonizerRocket FILE=SKINS\Sk_IonizerRocket.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonizerRocketShell NUM=1 TEXTURE=Sk_IonizerRocket


simulated function PostBeginPlay()
{
	PlayAnim('FullRot', 1/Default.LifeSpan, 0.0);
	Super.PostBeginPlay();
}

function BeginPlay();

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonizerRocketShell
	EffectSound1=None
	
	MaxRotRate=1024
}
