//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class TShock expands NaliWEffects;

#exec MESH IMPORT MESH=TShock ANIVFILE=MODELS\TShock_a.3d DATAFILE=MODELS\TShock_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=TShock X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=TShock SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=TShock SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=TShock MESH=TShock
#exec MESHMAP SCALE MESHMAP=TShock X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=NormalShock FILE=CORONAS\NormalShock.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=TShock NUM=1 TEXTURE=NormalShock


simulated function Tick( float DeltaTime)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * Default.DrawScale / Default.LifeSpan;
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
	}
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=TShock
	Style=STY_Translucent
	ScaleGlow=1.500000
	LifeSpan=0.500000
	DrawScale=20.000000
	RemoteRole=ROLE_SimulatedProxy
	bUnlit=True
	MultiSkins(1)=NormalShock
}
