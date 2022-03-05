//////////////////////////////////////////////////////////////
//				Feralidragon (03-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////

class IceFlameBase expands IceBase;

#exec TEXTURE IMPORT NAME=IceFlamesBaseSk FILE=Skins\IceFlamesBaseSk.bmp GROUP=Coronas FLAGS=2
#exec AUDIO IMPORT NAME="IceFlameBaseSnd" FILE=SOUNDS\IceFlameBaseSnd.wav GROUP="Freezer"
#exec AUDIO IMPORT NAME="IceFlamesMelt" FILE=SOUNDS\IceFlamesMelt.wav GROUP="Freezer"

simulated function Tick( float Delta)
{
local IceBaseMeltSmk ibms;

	if (LifeSpan <= 1 && !bEndLife)
	{
		bEndLife = True;
		PlaySound(Sound'IceFlamesMelt',, 20.0,, 1000);
		if (Level.NetMode != NM_DedicatedServer)
		{
			PlayAnim('Shrink', 0.75);
			ScaleGlow = 0.2;
		}
	}

	if (Level.NetMode != NM_DedicatedServer)
	{
		if(LifeSpan <= 1)
		{
			ScaleGlow = Default.ScaleGlow - (LifeSpan * Default.ScaleGlow) + 0.2;
			meltCount += Delta;
			if (meltCount >= 0.1)
			{
				meltCount = 0;
				ibms = Spawn(Class'IceBaseMeltSmk');
				ibms.getOwnerAnim(Self);
			}
		}
		else if ((Default.LifeSpan - LifeSpan) <= 1)
			ScaleGlow = Default.ScaleGlow - ((Default.LifeSpan - LifeSpan) * Default.ScaleGlow) + 0.2;
	}
}

defaultproperties
{
	Style=STY_Normal
	bMeshEnviroMap=False
	MultiSkins(1)=IceFlamesBaseSk
	ScaleGlow=2.000000
	bUnlit=True

	InitSound=IceFlameBaseSnd
	bDestructable=False
}
