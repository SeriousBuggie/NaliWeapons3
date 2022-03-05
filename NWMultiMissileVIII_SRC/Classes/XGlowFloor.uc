//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class XGlowFloor expands NaliWEffects;

#exec TEXTURE IMPORT NAME=XShockwave FILE=CORONAS\XShockwave.bmp GROUP=Coronas FLAGS=2

simulated function Tick( float DeltaTime)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * 45.0 / Default.LifeSpan + 4.0;
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
	}
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=TShock
	Style=STY_Translucent
	ScaleGlow=2.000000
	LifeSpan=1.000000
	DrawScale=1.000000
	RemoteRole=ROLE_SimulatedProxy
	bUnlit=True
	MultiSkins(1)=XShockwave
}
