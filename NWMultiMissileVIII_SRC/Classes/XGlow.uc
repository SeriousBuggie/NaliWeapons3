//////////////////////////////////////////////////////////////
//				Feralidragon (27-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class XGlow expands NaliWEffects;

#exec TEXTURE IMPORT NAME=XShockGlow FILE=CORONAS\XShockGlow.bmp GROUP=Coronas FLAGS=2

simulated function Tick( float DeltaTime)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		DrawScale = (Default.LifeSpan - LifeSpan) * 6.9146 / Default.LifeSpan + 0.62854;
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
	}
}


defaultproperties
{
	DrawType=DT_Sprite
	Texture=XShockGlow
	Style=STY_Translucent
	ScaleGlow=1.750000
	LifeSpan=1.000000
	DrawScale=1.000000
	RemoteRole=ROLE_SimulatedProxy
	bUnlit=True
	SpriteProjForward=0.000000
}
