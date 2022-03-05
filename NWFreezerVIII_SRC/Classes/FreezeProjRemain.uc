//////////////////////////////////////////////////////////////
//				Feralidragon (05-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class FreezeProjRemain expands NaliWEffects;

#exec AUDIO IMPORT NAME="FreezeRemainHit" FILE=SOUNDS\FreezeRemainHit.wav GROUP="Freezer"

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && LifeSpan <= 1.0)
		ScaleGlow = LifeSpan * Default.ScaleGlow;
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=FreezerProjAlt
	bUnlit=True
	Style=STY_Translucent
	ScaleGlow=2.500000
	bMeshEnviroMap=True
	Texture=Ice
	
	DrawScale=1.000000
	LifeSpan=10.000000
	Physics=PHYS_None
	
	EffectSound1=FreezeRemainHit
}
