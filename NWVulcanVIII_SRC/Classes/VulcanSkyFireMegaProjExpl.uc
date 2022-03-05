//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFireMegaProjExpl expands VulcanBulletExpl;

#exec AUDIO IMPORT NAME="VulcanSkyFireMegaProjHit1" FILE=SOUNDS\VulcanSkyFireMegaProjHit1.wav GROUP="Vulcan"
#exec AUDIO IMPORT NAME="VulcanSkyFireMegaProjHit2" FILE=SOUNDS\VulcanSkyFireMegaProjHit2.wav GROUP="Vulcan"
#exec AUDIO IMPORT NAME="VulcanSkyFireMegaProjHit3" FILE=SOUNDS\VulcanSkyFireMegaProjHit3.wav GROUP="Vulcan"


defaultproperties
{
	EffectSound1=VulcanSkyFireMegaProjHit1
	SndVol=100.000000
	SndRadius=4500.000000
	
	ScaleGlow=2.000000
	DrawScale=45.000000
	
	RndSound(0)=VulcanSkyFireMegaProjHit1
	RndSound(1)=VulcanSkyFireMegaProjHit2
	RndSound(2)=VulcanSkyFireMegaProjHit3
}
