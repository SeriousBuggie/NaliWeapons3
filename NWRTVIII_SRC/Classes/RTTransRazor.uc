//////////////////////////////////////////////////////////////
//				Feralidragon (25-03-2012)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTTransRazor expands RTTrans;

#exec AUDIO IMPORT NAME="RTHitRz01" FILE=SOUNDS\RTHitRz01.wav GROUP="Hits"
#exec AUDIO IMPORT NAME="RTHitRz02" FILE=SOUNDS\RTHitRz02.wav GROUP="Hits"
#exec AUDIO IMPORT NAME="RTHitRz03" FILE=SOUNDS\RTHitRz03.wav GROUP="Hits"
#exec AUDIO IMPORT NAME="RTAmbRazor" FILE=SOUNDS\RTAmbRazor.wav GROUP="Loop"


defaultproperties
{
	bRazor=True
	SpinAnim=SpinLoop
	SpinRate=3.000000
	AmbientSound=RTAmbRazor
	
	CollisionHeight=4.000000
	CollisionRadius=18.000000

	AnimSequence=Razored
	bBounce=True
	bProjTarget=True
	Physics=PHYS_Projectile
	
	bNeverHurtInstigator=False
	bNoHurtTeam=True
	CanHitInstigator=True
	HitInstigatorTimeOut=0.500000
	bDirectHit=True
	
	bWaterHitFX=True
	WaterSplashType=2
	Mass=100.000000
	
	ShadowSize=0.450000
	
	HitSounds(0)=RTHitRz01
	HitSounds(1)=RTHitRz02
	HitSounds(2)=RTHitRz03
}
