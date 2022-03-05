//////////////////////////////////////////////////////////////
//				Feralidragon (26-10-2013)
//
// NW3 THE MINER BUILD 1.00
//////////////////////////////////////////////////////////////

class MineExplosionFProj expands MineExplosionProjC;

#exec AUDIO IMPORT NAME="FMineExplosion" FILE=SOUNDS\FMineExplosion.wav GROUP="Explosions"

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	if (Level.NetMode == NM_StandAlone)
		SpawnClientExplFX();
}

simulated function PostNetBeginPlay()
{
	SpawnClientExplFX();
}

simulated function SpawnClientExplFX()
{
	Spawn(Class'FMineWallParts');
	Spawn(class'FMineAfterEffects');
	Spawn(Class'FMineBaseCloudMaster');
	Spawn(Class'FMineCor');
	Spawn(Class'FMineLine');
}

defaultproperties
{
	EffectSound1=FMineExplosion
	SndVol=32.000000
	SndRadius=3000.000000
	LifeSpan=0.300000
	LightRadius=32
	
	RiseSpeed=1800.000000
	MaxDist=120.000000
	ExplRate=50.000000
	FXClass=Class'MineExplosionFPart'
}
