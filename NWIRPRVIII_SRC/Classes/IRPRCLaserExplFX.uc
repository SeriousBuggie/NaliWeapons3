//////////////////////////////////////////////////////////////
//				Feralidragon (11-11-2013)
//
// NW3 INFRARED PRECISION RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class IRPRCLaserExplFX expands UT_FlameExplosion;

#exec OBJ LOAD FILE=Textures\LaserExplosions.utx PACKAGE=NWIRPRVIII_SRC.LaserExplosions

#exec AUDIO IMPORT NAME="LaserExplSnd01" FILE=SOUNDS\LaserExplSnd01.wav GROUP="IRPRCFX"
#exec AUDIO IMPORT NAME="LaserExplSnd02" FILE=SOUNDS\LaserExplSnd02.wav GROUP="IRPRCFX"
#exec AUDIO IMPORT NAME="LaserExplSnd03" FILE=SOUNDS\LaserExplSnd03.wav GROUP="IRPRCFX"
#exec AUDIO IMPORT NAME="LaserExplSnd04" FILE=SOUNDS\LaserExplSnd04.wav GROUP="IRPRCFX"

var() sound RndSnd[4];
var() float SndOdds;

simulated function PostBeginPlay()
{
local float f;

	if (Level.NetMode != NM_DedicatedServer)
	{
		f = FRand();
		if (f > 0.66)
			Texture = Texture'ExplB01';
		else if (f > 0.33)
			Texture = Texture'ExplE01';
			
		if (FRand() <= SndOdds)
			PlaySound(RndSnd[Rand(ArrayCount(RndSnd))],, 100,, 1024.0);
	}
		
	Super(AnimSpriteEffect).PostBeginPlay();
}

defaultproperties
{
	EffectSound1=None
	Texture=Texture'ExplF01'
	DrawScale=1.500000
	LightType=LT_None
	ScaleGlow=1.350000
	
	SndOdds=0.350000
	RndSnd(0)=LaserExplSnd01
	RndSnd(1)=LaserExplSnd02
	RndSnd(2)=LaserExplSnd03
	RndSnd(3)=LaserExplSnd04
}

