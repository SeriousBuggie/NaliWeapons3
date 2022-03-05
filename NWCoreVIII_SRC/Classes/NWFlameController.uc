//////////////////////////////////////////////////////////////
//	Nali Weapons III Flames Controller
//				Feralidragon (27-04-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWFlameController expands NaliWEffects;

#exec AUDIO IMPORT NAME="AmbFleshFlames" FILE=SOUNDS\AmbFleshFlames.wav GROUP="Loop"
#exec AUDIO IMPORT NAME="FlamesEnd" FILE=SOUNDS\FlamesEnd.wav GROUP="Misc"

var() class<NWFlame> FlameClass;

simulated function PostBeginPlay()
{
	SetTimer(0.1, False);
}

function MakeSound()
{
	PlaySound(Sound'FlamesEnd');
}

simulated function Timer()
{
local vector V;
local ZoneInfo OwnZone;

	if (Owner != None)
	{
		OwnZone = Owner.Region.Zone;
		if (OwnZone.bWaterZone && !OwnZone.IsA('LavaZone') && OwnZone.DamageType != 'Burned')
		{
			MakeSound();
			Destroy();
			return;
		}
		
		V.Z = (2*FRand() - 1) * Owner.CollisionHeight / 2;
		V.X = (2*FRand() - 1) * Owner.CollisionRadius / 2;
		V.Y = (2*FRand() - 1) * Owner.CollisionRadius / 2;
		
		Spawn(FlameClass,,, Owner.Location + V);
		
		SetTimer(0.05 + FRand()*0.1, False);
	}
	else
		SetTimer(0.1, False);
}

simulated function Tick( float Delta)
{
	if (Level.NetMode != NM_DedicatedServer && Owner != None)
	{
		if (Owner.bUnlit)
			Owner.ScaleGlow = LifeSpan * Owner.Default.ScaleGlow / Default.LifeSpan + 0.025;
		else
			Owner.ScaleGlow = LifeSpan * Owner.Default.ScaleGlow / Default.LifeSpan + 0.065;
	}
	else if ((Owner == None || Owner.bDeleteMe) && (default.LifeSpan - LifeSpan) > 0.15)
		Destroy();
}

defaultproperties
{
    bHidden=False
	LifeSpan=5.000000
	bNetTemporary=True
	Physics=PHYS_Trailer
	
	AmbientSound=AmbFleshFlames
	SoundRadius=16
	SoundVolume=32
	
	Style=STY_Translucent
	Texture=TranslucInvis
	DrawType=DT_Sprite
	DrawScale=0.100000
	
	FlameClass=Class'NWFlame'
}
