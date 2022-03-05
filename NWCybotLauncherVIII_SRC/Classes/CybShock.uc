//////////////////////////////////////////////////////////////
//				Feralidragon (23-01-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybShock expands NaliWEffects;

#exec MESH IMPORT MESH=CybShock ANIVFILE=MODELS\CybShock_a.3d DATAFILE=MODELS\CybShock_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=CybShock X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybShock SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybShock SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=CybShock MESH=CybShock
#exec MESHMAP SCALE MESHMAP=CybShock X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=CybShock FILE=CORONAS\CybShock.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=CybShock NUM=1 TEXTURE=CybShock


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
	Mesh=CybShock
	Style=STY_Translucent
	ScaleGlow=3.500000
	LifeSpan=0.650000
	DrawScale=10.000000
	RemoteRole=ROLE_SimulatedProxy
	bUnlit=True
	MultiSkins(1)=CybShock
}
