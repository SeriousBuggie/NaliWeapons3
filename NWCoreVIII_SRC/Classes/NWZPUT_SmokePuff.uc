//////////////////////////////////////////////////////////////
//				Feralidragon (07-10-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWZPUT_SmokePuff expands UT_SpriteSmokePuff;

simulated function BeginPlay()
{
	SetTimer(0.1, False);
}

simulated function Timer()
{
	if (Class'NaliZPEffects'.static.isStaticZPDiscarded(Owner))
	{
		bHidden = True;
		return;
	}
	
	Velocity = Vect(0,0,1)*RisingRate;
    if (!Level.bDropDetail)
        Texture = SSPrites[Rand(NumSets)];
}


defaultproperties
{
}