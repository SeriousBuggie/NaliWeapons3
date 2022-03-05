//////////////////////////////////////////////////////////////
//				Feralidragon (25-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybFFieldSphereCor expands NaliWEffects;

#exec MESH IMPORT MESH=CybFFieldSphereCor ANIVFILE=MODELS\CybFFieldSphereCor_a.3d DATAFILE=MODELS\CybFFieldSphereCor_d.3d X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=CybFFieldSphereCor X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=CybFFieldSphereCor SEQ=All STARTFRAME=0 NUMFRAMES=21
#exec MESH SEQUENCE MESH=CybFFieldSphereCor SEQ=Still STARTFRAME=0 NUMFRAMES=1
#exec MESH SEQUENCE MESH=CybFFieldSphereCor SEQ=Transform STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=CybFFieldSphereCor SEQ=UnTransform STARTFRAME=10 NUMFRAMES=11 RATE=10.0

#exec MESHMAP NEW MESHMAP=CybFFieldSphereCor MESH=CybFFieldSphereCor
#exec MESHMAP SCALE MESHMAP=CybFFieldSphereCor X=0.5 Y=0.5 Z=1.0

var() texture CorTex[4];
var actor ref;

replication
{
	reliable if (Role == ROLE_Authority)
		ref;
}

function SetTeam(byte team, optional actor extRef)
{
	if (team > 3) team = 0;
	Texture = CorTex[team];
	ref = extRef;
}

simulated function Tick(float DeltaTime)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		ScaleGlow = FRand() + 1.0;
		if (ref != None && DrawScale != ref.DrawScale)
			DrawScale = ref.DrawScale;
	}
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=CybFFieldSphereCor
	bParticles=True
	bAnimByOwner=True
	
	bUnlit=True
	Scaleglow=1.500000
	Style=STY_Translucent
	Texture=CybProjCorRed
	DrawScale=1.000000
	
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	Physics=PHYS_Trailer
	bTrailerSameRotation=True
	bTrailerPrePivot=True
	LifeSpan=0.000000
	Mass=0.000000
	
	CorTex(0)=CybProjCorRed
	CorTex(1)=CybProjCorBlue
	CorTex(2)=CybProjCorGreen
	CorTex(3)=CybProjCorYellow
}
