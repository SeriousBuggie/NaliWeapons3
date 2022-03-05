//////////////////////////////////////////////////////////////
//				Feralidragon (25-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybFFieldHitFX expands NaliWEffects;

#exec AUDIO IMPORT NAME="CybFFieldHitSnd" FILE=SOUNDS\CybFFieldHitSnd.wav GROUP="Hit"

var() texture HitTex[4];
var() sound FieldHitSnd;
var float maxDrawScale;
var CybFFieldSphere cybSphere;
var vector nPrePivot;

replication
{
	reliable if (Role == ROLE_Authority)
		cybSphere, maxDrawScale, nPrePivot;
}

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();
	maxDrawScale = DrawScale;
}

function SetTeam(byte team, optional float scale, optional CybFFieldSphere sphere, optional bool bPlayHitSound, optional vector newPivot)
{
	if (team > 3) team = 0;
	Texture = HitTex[team];
	
	if (scale > 0.0)
	{
		maxDrawScale = scale;
		DrawScale = scale;
	}
	
	if (bPlayHitSound)
		PlaySound(FieldHitSnd,,10.0,,FMax(300.0, maxDrawScale*384));
	
	nPrePivot = newPivot;
	cybSphere = sphere;
}

simulated function Tick(float DeltaTime)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		ScaleGlow = LifeSpan * Default.ScaleGlow / Default.LifeSpan;
		DrawScale = LifeSpan * maxDrawScale / Default.LifeSpan;
		if (cybSphere != None)
			PrePivot = Normal(nPrePivot) * cybSphere.DrawScale * cybSphere.SphericalMeshRadius;
	}
}

defaultproperties
{
    DrawType=DT_Sprite
	bUnlit=True
	Scaleglow=2.000000
	Style=STY_Translucent
	DrawScale=1.000000
	
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=True
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	bTrailerPrePivot=True
	LifeSpan=0.500000
	Mass=0.000000
	
	Texture=CybProjCorRed
	
	FieldHitSnd=CybFFieldHitSnd
	HitTex(0)=CybProjCorRed
	HitTex(1)=CybProjCorBlue
	HitTex(2)=CybProjCorGreen
	HitTex(3)=CybProjCorYellow
}
