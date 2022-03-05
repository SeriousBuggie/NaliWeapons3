//////////////////////////////////////////////////////////////
//				Feralidragon (20-10-2013)
//
// NW3 VULCAN 1.00
//////////////////////////////////////////////////////////////

class VulcanSkyFireBulletExpl expands VulcanBulletExpl;

#exec AUDIO IMPORT NAME="VulcanSkyFireProjHit1" FILE=SOUNDS\VulcanSkyFireProjHit1.wav GROUP="Vulcan"
#exec AUDIO IMPORT NAME="VulcanSkyFireProjHit2" FILE=SOUNDS\VulcanSkyFireProjHit2.wav GROUP="Vulcan"
#exec AUDIO IMPORT NAME="VulcanSkyFireProjHit3" FILE=SOUNDS\VulcanSkyFireProjHit3.wav GROUP="Vulcan"


defaultproperties
{
	EffectSound1=VulcanSkyFireProjHit1
	SndVol=30.000000
	SndRadius=1200.000000
	
	ScaleGlow=2.000000
	DrawScale=16.000000
	LightType=LT_None
	
	RndSound(0)=VulcanSkyFireProjHit1
	RndSound(1)=VulcanSkyFireProjHit2
	RndSound(2)=VulcanSkyFireProjHit3
}
