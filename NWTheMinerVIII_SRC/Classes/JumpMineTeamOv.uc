//////////////////////////////////////////////////////////////
//				Feralidragon (26-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class JumpMineTeamOv expands NWMineTeamOv;

#exec MESH IMPORT MESH=JumpMineTeamOv ANIVFILE=MODELS\JumpMineTeamOv_a.3d DATAFILE=MODELS\JumpMineTeamOv_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=JumpMineTeamOv STRENGTH=0.25
#exec MESH ORIGIN MESH=JumpMineTeamOv X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=JumpMineTeamOv SEQ=All STARTFRAME=0 NUMFRAMES=3
#exec MESH SEQUENCE MESH=JumpMineTeamOv SEQ=Still STARTFRAME=1 NUMFRAMES=1
#exec MESH SEQUENCE MESH=JumpMineTeamOv SEQ=Openned STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=JumpMineTeamOv SEQ=Closed STARTFRAME=2 NUMFRAMES=1
#exec MESH SEQUENCE MESH=JumpMineTeamOv SEQ=Open STARTFRAME=1 NUMFRAMES=2 RATE=2.0
#exec MESH SEQUENCE MESH=JumpMineTeamOv SEQ=Close STARTFRAME=0 NUMFRAMES=2 RATE=2.0

#exec MESHMAP NEW MESHMAP=JumpMineTeamOv MESH=JumpMineTeamOv
#exec MESHMAP SCALE MESHMAP=JumpMineTeamOv X=0.08 Y=0.08 Z=0.16

#exec TEXTURE IMPORT NAME=JumpMineOvRed FILE=Overlays\JumpMineOvRed.bmp GROUP=Overlays LODSET=2
#exec TEXTURE IMPORT NAME=JumpMineOvBlue FILE=Overlays\JumpMineOvBlue.bmp GROUP=Overlays LODSET=2
#exec TEXTURE IMPORT NAME=JumpMineOvGreen FILE=Overlays\JumpMineOvGreen.bmp GROUP=Overlays LODSET=2
#exec TEXTURE IMPORT NAME=JumpMineOvYellow FILE=Overlays\JumpMineOvYellow.bmp GROUP=Overlays LODSET=2

#exec MESHMAP SETTEXTURE MESHMAP=JumpMineTeamOv NUM=1 TEXTURE=JumpMineOvRed

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=JumpMineTeamOv
	
	TeamTex(0)=JumpMineOvRed
	TeamTex(1)=JumpMineOvBlue
	TeamTex(2)=JumpMineOvGreen
	TeamTex(3)=JumpMineOvYellow
}
