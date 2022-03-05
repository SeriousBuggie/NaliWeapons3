//////////////////////////////////////////////////////////////
//				Feralidragon (27-11-2011)
//
// NW3 IONIZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IonSatOvTeam expands NaliTrail;

#exec MESH IMPORT MESH=IonSatOvTeam ANIVFILE=MODELS\IonSatOvTeam_a.3d DATAFILE=MODELS\IonSatOvTeam_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=IonSatOvTeam STRENGTH=0.0
#exec MESH ORIGIN MESH=IonSatOvTeam X=0 Y=0 Z=0 PITCH=64

#exec MESH SEQUENCE MESH=IonSatOvTeam SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=IonSatOvTeam SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatOvTeam SEQ=Openning STARTFRAME=10 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=IonSatOvTeam SEQ=Closed STARTFRAME=10 NUMFRAMES=1
#exec MESH SEQUENCE MESH=IonSatOvTeam SEQ=Closing STARTFRAME=0 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=IonSatOvTeam MESH=IonSatOvTeam
#exec MESHMAP SCALE MESHMAP=IonSatOvTeam X=0.3 Y=0.3 Z=0.6

#exec TEXTURE IMPORT NAME=SatOvTeamRed FILE=SKINS\SatOvTeamRed.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=SatOvTeamBlue FILE=SKINS\SatOvTeamBlue.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=SatOvTeamGreen FILE=SKINS\SatOvTeamGreen.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=SatOvTeamYellow FILE=SKINS\SatOvTeamYellow.bmp GROUP=Skins LODSET=2
#exec MESHMAP SETTEXTURE MESHMAP=IonSatOvTeam NUM=1 TEXTURE=SatOvTeamRed


var() texture TeamTex[4];
var() float PulseFreq, MinGlow, MaxGlow;
var float timeCount, OldGlow;
var bool isAsc;

function SetTeam(byte team)
{
	if (team > 3)
		team = 0;
	MultiSkins[1] = TeamTex[team];
}

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (isAsc)
			timeCount += (Delta*8);
		else
			timeCount += Delta;
		
		OldGlow = ScaleGlow;
		ScaleGlow = (sin(PulseFreq*timeCount*PI/2)+1) * (MaxGlow-MinGlow)/2 + MinGlow;
		
		if ((ScaleGlow > OldGlow && !isAsc) || (ScaleGlow < OldGlow && isAsc))
			isAsc = !isAsc;
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=IonSatOvTeam
	bAnimByOwner=True
	
	Style=STY_Translucent
	bUnlit=True
	ScaleGlow=1.500000
	
	PulseFreq=1.750000
	MinGlow=0.000000
	MaxGlow=2.000000
	
	TeamTex(0)=SatOvTeamRed
	TeamTex(1)=SatOvTeamBlue
	TeamTex(2)=SatOvTeamGreen
	TeamTex(3)=SatOvTeamYellow
}
