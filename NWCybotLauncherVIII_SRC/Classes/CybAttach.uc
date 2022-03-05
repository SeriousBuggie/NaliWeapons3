//////////////////////////////////////////////////////////////
//				Feralidragon (07-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybAttach expands NaliWEffects
abstract;

var() name AnimCache[8];
var() sound AmbSound;

simulated function PlayAnimation(byte n, float rate, optional bool bLoop)
{
	if (n > ArrayCount(AnimCache))
		n = 0;
	
	if (AnimCache[n] != '' && rate > 0)
	{
		if (bLoop)
			LoopAnim(AnimCache[n], rate);
		else
			PlayAnim(AnimCache[n], rate);
	}
}

simulated function SetAmbSound()
{
	AmbientSound = AmbSound;
}

simulated function RemoveAmbSound()
{
	AmbientSound = None;
}

defaultproperties
{
    DrawType=DT_Mesh
	DrawScale=1.000000
	
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	bTrailerPrePivot=True
	LifeSpan=0.000000
	Mass=0.000000
	
	Texture=CybotMetal
}
