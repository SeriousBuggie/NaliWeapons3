//////////////////////////////////////////////////////////////
//				Feralidragon (26-05-2013)
//
// NW3 RAZORED TRANSLOCATOR BUILD 1.00
//////////////////////////////////////////////////////////////

class RTOversurSpinnerCor expands NWCoronaFX;

#exec AUDIO IMPORT NAME="RTSpinnerTeleport" FILE=SOUNDS\RTSpinnerTeleport.wav GROUP="Surrection"

var() sound CorSound;
var() float SndVol, SndRadius;
var Actor OMaster;

replication
{
	reliable if (Role == ROLE_Authority)
		OMaster;
}

function MakeSound(optional float sndDumping)
{
	if (CorSound != None)
		PlaySound(CorSound,,(1.0-sndDumping)*SndVol,,(1.0-sndDumping)*SndRadius);
}

function SetMaster(Actor A)
{
	OMaster = A;
}

simulated function Tick(float DeltaTime)
{
	if (Level.NetMode != NM_DedicatedServer && OMaster != None && !OMaster.bDeleteMe)
		SetLocation(OMaster.Location);
	Super.Tick(DeltaTime);
}

defaultproperties
{
	MaxDistance=50000.000000
	FadeInTime=0.000000
	FadeOutTime=1.000000
	StartScaleTime=0.000000
	EndScaleTime=0.700000
	
	CoronaSprite=RTOversurCor
	CGlowMax=2.000000
	CGlowMin=1.500000
	MaxCoronaSize=4.000000
	MinCoronaSize=2.500000
	CGlow=1.500000
	LifeSpan=0.750000
	
	bForceColDetail=True
	
	CorSound=RTSpinnerTeleport
	SndVol=10.000000
	SndRadius=2200.000000
}
