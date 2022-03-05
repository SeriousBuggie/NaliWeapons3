//////////////////////////////////////////////////////////////
//	Nali Weapons III War Ready Enforcer (W.R.E.) Grenade
//				Feralidragon (12-07-2010)
//
// NW3 WAR READY ENFORCER 1.00
//////////////////////////////////////////////////////////////

class WREGrenadeExplosion expands UT_FlameExplosion;

#exec AUDIO IMPORT NAME="WREGrenade_Explosion" FILE=SOUNDS\WREGrenade_Explosion.wav GROUP="WRE"

#exec TEXTURE IMPORT NAME=PurplePallete FILE=PALLETES\PurplePallete.bmp GROUP=Palletes

#exec OBJ LOAD FILE=Textures\WREIonExplosionFX.utx PACKAGE=NWWREVIII_SRC.Expl

function MakeSound()
{
	PlaySound(EffectSound1,,12.0,,2200);
}

simulated function PostBeginPlay()
{
local Actor A;
local vector HitLoc, HitNorm;
	
	A = Trace( HitLoc, HitNorm, Location + vect(0,0,-128), Location, False);
	if (A == Level && Level.NetMode != NM_DedicatedServer)
		Spawn(class'WRESmokeGen',,, HitLoc + HitNorm);
		
	MakeSound();
}

defaultproperties
{
	EffectSound1=WREGrenade_Explosion
	Skin=PurplePallete
	LightRadius=14
	Texture=WREIonExpl01
	LightBrightness=100
	DrawScale=3.750000
	ScaleGlow=1.650000
	SpriteProjForward=48.000000
}