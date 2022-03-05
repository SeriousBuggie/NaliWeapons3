//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProtosOVIncandes expands NaliWEffects;

//1st person
#exec MESH IMPORT MESH=UltimaProtosOVIncandes ANIVFILE=MODELS\UltimaProtosOVIncandes_a.3d DATAFILE=MODELS\UltimaProtosOVIncandes_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=UltimaProtosOVIncandes STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProtosOVIncandes X=0 Y=0 Z=0 Yaw=128

//1st person right handed
#exec MESH IMPORT MESH=UltimaProtosOVIncandesR ANIVFILE=MODELS\UltimaProtosOVIncandes_a.3d DATAFILE=MODELS\UltimaProtosOVIncandes_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=UltimaProtosOVIncandesR STRENGTH=0
#exec MESH ORIGIN MESH=UltimaProtosOVIncandesR X=0 Y=0 Z=0

//Animations
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandes SEQ=All STARTFRAME=0 NUMFRAMES=132
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandes SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandes SEQ=FireOpen STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandes SEQ=FireStartSeq STARTFRAME=5 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandes SEQ=Openned STARTFRAME=46 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandes SEQ=FireSeq1 STARTFRAME=47 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandes SEQ=FireSeq2 STARTFRAME=57 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandes SEQ=FireSeq3 STARTFRAME=67 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandes SEQ=FiringSeq STARTFRAME=47 NUMFRAMES=31 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandes SEQ=FiringSeqLoop STARTFRAME=47 NUMFRAMES=30 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandes SEQ=Fire STARTFRAME=77 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandes SEQ=Paused STARTFRAME=118 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandes SEQ=Select STARTFRAME=125 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandes SEQ=Down STARTFRAME=119 NUMFRAMES=7 RATE=30.0

#exec MESH SEQUENCE MESH=UltimaProtosOVIncandesR SEQ=All STARTFRAME=0 NUMFRAMES=132
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandesR SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandesR SEQ=FireOpen STARTFRAME=0 NUMFRAMES=6 RATE=5.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandesR SEQ=FireStartSeq STARTFRAME=5 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandesR SEQ=Openned STARTFRAME=46 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandesR SEQ=FireSeq1 STARTFRAME=47 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandesR SEQ=FireSeq2 STARTFRAME=57 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandesR SEQ=FireSeq3 STARTFRAME=67 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandesR SEQ=FiringSeq STARTFRAME=47 NUMFRAMES=31 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandesR SEQ=FiringSeqLoop STARTFRAME=47 NUMFRAMES=30 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandesR SEQ=Fire STARTFRAME=77 NUMFRAMES=41 RATE=10.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandesR SEQ=Paused STARTFRAME=118 NUMFRAMES=2 RATE=1.0
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandesR SEQ=Select STARTFRAME=125 NUMFRAMES=7 RATE=15.0 GROUP=Select
#exec MESH SEQUENCE MESH=UltimaProtosOVIncandesR SEQ=Down STARTFRAME=119 NUMFRAMES=7 RATE=30.0

//Scale
#exec MESHMAP NEW MESHMAP=UltimaProtosOVIncandes MESH=UltimaProtosOVIncandes
#exec MESHMAP SCALE MESHMAP=UltimaProtosOVIncandes X=0.045 Y=0.045 Z=0.09

#exec MESHMAP NEW MESHMAP=UltimaProtosOVIncandesR MESH=UltimaProtosOVIncandesR
#exec MESHMAP SCALE MESHMAP=UltimaProtosOVIncandesR X=0.045 Y=0.045 Z=0.09

//FX Skins
#exec TEXTURE IMPORT NAME=ExhIncandes FILE=SKINS\ExhIncandes.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVIncandes NUM=1 TEXTURE=ExhIncandes
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVIncandesR NUM=1 TEXTURE=ExhIncandes

#exec TEXTURE IMPORT NAME=RotorIncandes FILE=SKINS\RotorIncandes.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVIncandes NUM=2 TEXTURE=RotorIncandes
#exec MESHMAP SETTEXTURE MESHMAP=UltimaProtosOVIncandesR NUM=2 TEXTURE=RotorIncandes
//===========================================================================

var() Mesh MeshL, MeshR;
var float DesiredGlow;

simulated function HandleMesh( bool bRightHand)
{
	if (bRightHand)
		Mesh = MeshR;
	else
		Mesh = MeshL;
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (DesiredGlow > ScaleGlow)
		{
			ScaleGlow += (Delta/2);
			if (ScaleGlow > DesiredGlow)
				ScaleGlow = DesiredGlow;
		}
		else if (DesiredGlow < ScaleGlow)
		{
			ScaleGlow -= (Delta*1.5);
			if (ScaleGlow < DesiredGlow)
				ScaleGlow = DesiredGlow;
		}
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=UltimaProtosOVIncandes
	
	bHidden=True
	Style=STY_Translucent
	ScaleGlow=0.000000
	bUnlit=True
	bNetTemporary=False
	
	MeshL=UltimaProtosOVIncandes
	MeshR=UltimaProtosOVIncandesR
}
