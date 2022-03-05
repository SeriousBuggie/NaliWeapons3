//////////////////////////////////////////////////////////////
//				Feralidragon (30-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBloodBurst expands NaliWEffects;

simulated function PostBeginPlay()
{
local byte i;

	PlayAnim('Burst', 1.0);
	bRandomFrame = !Level.bDropDetail;
}

simulated function AnimEnd()
{
    Destroy();
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=Mesh'Botpack.BloodUTm'
	RemoteRole=ROLE_None
	LifeSpan=0.000000
	AnimSequence=Burst
	Texture=BloodRedParticle01
	Style=STY_Masked
	DrawScale=0.150000
	AmbientGlow=0
	bUnlit=True
	bParticles=True
	bRandomFrame=True
	
	MultiSkins(0)=BloodRedParticle01
	MultiSkins(1)=BloodRedParticle02
	MultiSkins(2)=BloodRedParticle03
	MultiSkins(3)=BloodRedParticle04
	MultiSkins(4)=BloodRedParticle05
	MultiSkins(5)=BloodRedParticle01
	MultiSkins(6)=BloodRedParticle02
	MultiSkins(7)=BloodRedParticle03
}
