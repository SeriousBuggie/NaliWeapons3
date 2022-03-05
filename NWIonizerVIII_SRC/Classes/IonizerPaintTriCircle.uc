//////////////////////////////////////////////////////////////
//				Feralidragon (14-06-2012)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonizerPaintTriCircle expands NaliWActor;

#exec MESH IMPORT MESH=IonizerPaintTriCircle ANIVFILE=MODELS\IonizerPaintTriCircle_a.3d DATAFILE=MODELS\IonizerPaintTriCircle_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonizerPaintTriCircle STRENGTH=0
#exec MESH ORIGIN MESH=IonizerPaintTriCircle X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonizerPaintTriCircle SEQ=All STARTFRAME=0 NUMFRAMES=49
#exec MESH SEQUENCE MESH=IonizerPaintTriCircle SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerPaintTriCircle SEQ=Openned STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerPaintTriCircle SEQ=Closed STARTFRAME=24 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonizerPaintTriCircle SEQ=Openning STARTFRAME=24 NUMFRAMES=25 RATE=24.0
#exec MESH SEQUENCE MESH=IonizerPaintTriCircle SEQ=Closing STARTFRAME=0 NUMFRAMES=25 RATE=24.0

#exec MESHMAP NEW MESHMAP=IonizerPaintTriCircle MESH=IonizerPaintTriCircle
#exec MESHMAP SCALE MESHMAP=IonizerPaintTriCircle X=0.1 Y=0.1 Z=0.2

simulated function SetProgress(bool isOpenning, float progress)
{
	AnimFrame = progress * 24 / 25;
	if (isOpenning)
		AnimSequence = 'Openning';
	else
		AnimSequence = 'Closing';
}

simulated function SetDisplay(texture Tex, float DScale, float Glow)
{
	MultiSkins[1] = Tex;
	DrawScale = DScale;
	ScaleGlow = Glow;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=IonizerPaintTriCircle
	RemoteRole=ROLE_None
	bHidden=True
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=1.000000
}
