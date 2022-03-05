//////////////////////////////////////////////////////////////
//				Feralidragon (01-04-2010)
//
// NW3 MULTIMISSILE LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class MMShockOv expands NaliWEffects;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
		DrawScale = (Default.LifeSpan - LifeSpan) * 5.5 / Default.LifeSpan + 0.5;
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=ShockSphere
	bUnlit=True
	ScaleGlow=2.000000
	Style=STY_Translucent
	LifeSpan=1.000000
	bNetTemporary=True
	MultiSkins(1)=EnergyFXB
}
