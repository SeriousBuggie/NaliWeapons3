//////////////////////////////////////////////////////////////
//				Feralidragon (26-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class AttachMineTeamOv expands NWMineTeamOv;

#exec MESH IMPORT MESH=AttachMineTeamOv ANIVFILE=MODELS\AttachMineTeamOv_a.3d DATAFILE=MODELS\AttachMineTeamOv_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=AttachMineTeamOv STRENGTH=0.25
#exec MESH ORIGIN MESH=AttachMineTeamOv X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=AttachMineTeamOv SEQ=All STARTFRAME=0 NUMFRAMES=10
#exec MESH SEQUENCE MESH=AttachMineTeamOv SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=AttachMineTeamOv SEQ=Openned STARTFRAME=9 NUMFRAMES=1
#exec MESH SEQUENCE MESH=AttachMineTeamOv SEQ=Open STARTFRAME=0 NUMFRAMES=10 RATE=10.0

#exec MESHMAP NEW MESHMAP=AttachMineTeamOv MESH=AttachMineTeamOv
#exec MESHMAP SCALE MESHMAP=AttachMineTeamOv X=0.04 Y=0.04 Z=0.08

#exec TEXTURE IMPORT NAME=AttachMineOvRed FILE=Overlays\AttachMineOvRed.bmp GROUP=Overlays LODSET=2
#exec TEXTURE IMPORT NAME=AttachMineOvBlue FILE=Overlays\AttachMineOvBlue.bmp GROUP=Overlays LODSET=2
#exec TEXTURE IMPORT NAME=AttachMineOvGreen FILE=Overlays\AttachMineOvGreen.bmp GROUP=Overlays LODSET=2
#exec TEXTURE IMPORT NAME=AttachMineOvYellow FILE=Overlays\AttachMineOvYellow.bmp GROUP=Overlays LODSET=2

#exec MESHMAP SETTEXTURE MESHMAP=AttachMineTeamOv NUM=1 TEXTURE=AttachMineOvRed

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=AttachMineTeamOv
	
	TeamTex(0)=AttachMineOvRed
	TeamTex(1)=AttachMineOvBlue
	TeamTex(2)=AttachMineOvGreen
	TeamTex(3)=AttachMineOvYellow
}
