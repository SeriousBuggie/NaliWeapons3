//////////////////////////////////////////////////////////////
//	Nali Weapons III Effects base class
//				Feralidragon (21-03-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NaliWEffects expands Effects 
abstract;

var() float SndVol, SndRadius;

simulated function PreBeginPlay()
{
	if (!Class'NWInfo'.default.bEffectsDynLight)
		LightType = LT_None;
}

simulated function PostBeginPlay()
{
	MakeSound();
}

function MakeSound()
{
	if (EffectSound1 != None)
		PlaySound(EffectSound1,,SndVol,,SndRadius);
}

defaultproperties
{
	LifeSpan=0.000000
	bNetTemporary=True
	RemoteRole=ROLE_SimulatedProxy
	SndVol=12.000000
	SndRadius=2200.000000
}