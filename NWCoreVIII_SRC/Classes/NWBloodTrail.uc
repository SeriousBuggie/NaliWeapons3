//////////////////////////////////////////////////////////////
//				Feralidragon (30-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWBloodTrail expands NaliWEffects;

var() texture BloodRedTex[5], BloodGreenTex[5];

simulated function PostBeginPlay()
{
local byte i;

	LoopAnim('Trail');
	bRandomFrame = !Level.bDropDetail;
}


defaultproperties
{
	DrawType=DT_Mesh
	Mesh=LodMesh'Botpack.UTBloodTrl'
	Physics=PHYS_Trailer
	RemoteRole=ROLE_None
	LifeSpan=5.000000
	AnimSequence=Trail
	Texture=BloodRedParticle01
	Style=STY_Masked
	DrawScale=0.200000
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
