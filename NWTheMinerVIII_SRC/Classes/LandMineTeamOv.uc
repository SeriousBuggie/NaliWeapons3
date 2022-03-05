//////////////////////////////////////////////////////////////
//				Feralidragon (30-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class LandMineTeamOv expands NWMineTeamOv;

#exec MESH IMPORT MESH=LandMineTeamOv ANIVFILE=MODELS\LandMineTeamOv_a.3d DATAFILE=MODELS\LandMineTeamOv_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=LandMineTeamOv STRENGTH=0.25
#exec MESH ORIGIN MESH=LandMineTeamOv X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=LandMineTeamOv SEQ=All STARTFRAME=0 NUMFRAMES=40
#exec MESH SEQUENCE MESH=LandMineTeamOv SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=LandMineTeamOv SEQ=Underground STARTFRAME=39 NUMFRAMES=1
#exec MESH SEQUENCE MESH=LandMineTeamOv SEQ=Drill STARTFRAME=0 NUMFRAMES=40 RATE=40.0

#exec MESHMAP NEW MESHMAP=LandMineTeamOv MESH=LandMineTeamOv
#exec MESHMAP SCALE MESHMAP=LandMineTeamOv X=0.12 Y=0.12 Z=0.24

#exec TEXTURE IMPORT NAME=LandMineOvRed FILE=Overlays\LandMineOvRed.bmp GROUP=Overlays LODSET=2
#exec TEXTURE IMPORT NAME=LandMineOvBlue FILE=Overlays\LandMineOvBlue.bmp GROUP=Overlays LODSET=2
#exec TEXTURE IMPORT NAME=LandMineOvGreen FILE=Overlays\LandMineOvGreen.bmp GROUP=Overlays LODSET=2
#exec TEXTURE IMPORT NAME=LandMineOvYellow FILE=Overlays\LandMineOvYellow.bmp GROUP=Overlays LODSET=2

#exec MESHMAP SETTEXTURE MESHMAP=LandMineTeamOv NUM=1 TEXTURE=LandMineOvRed

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=LandMineTeamOv
	
	TeamTex(0)=LandMineOvRed
	TeamTex(1)=LandMineOvBlue
	TeamTex(2)=LandMineOvGreen
	TeamTex(3)=LandMineOvYellow
}
