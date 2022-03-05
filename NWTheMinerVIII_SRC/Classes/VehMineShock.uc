//////////////////////////////////////////////////////////////
//				Feralidragon (30-10-2010)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class VehMineShock expands NaliWEffects;

#exec MESH IMPORT MESH=VehMineShock ANIVFILE=MODELS\VehMineShock_a.3d DATAFILE=MODELS\VehMineShock_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=VehMineShock X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=VehMineShock SEQ=All STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=VehMineShock SEQ=Still STARTFRAME=0 NUMFRAMES=1

#exec MESHMAP NEW MESHMAP=VehMineShock MESH=VehMineShock
#exec MESHMAP SCALE MESHMAP=VehMineShock X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=VehMShock FILE=CORONAS\VehMShock.bmp GROUP=Coronas FLAGS=2
#exec MESHMAP SETTEXTURE MESHMAP=VehMineShock NUM=1 TEXTURE=VehMShock


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
	Mesh=VehMineShock
	Style=STY_Translucent
	ScaleGlow=1.500000
	LifeSpan=0.450000
	DrawScale=10.000000
	RemoteRole=ROLE_SimulatedProxy
	bUnlit=True
	MultiSkins(1)=VehMShock
}
