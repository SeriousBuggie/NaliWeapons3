//////////////////////////////////////////////////////////////
//				Feralidragon (29-09-2011)
//
// NW3 ULTIMA PROTOS BUILD 1.00
//////////////////////////////////////////////////////////////

class UltimaProtosOVCharge expands NWOverPickupFX;

var float cCount;
var byte lPos[5];
var() texture lTex[5];

simulated function Tick(float Delta)
{
local byte i;

	Super.Tick(Delta);
	
	if (Level.NetMode != NM_DedicatedServer)
	{
		cCount += Delta;
		if (cCount >= 0.05)
		{
			cCount = 0.0;
			for (i = 0; i < 8; i++)
				MultiSkins[i] = Texture'TranslucInvis';
			
			for (i = 0; i < ArrayCount(lPos); i++)
			{
				if (lPos[i] == 0)
					lPos[i] = 7;
				else
					lPos[i]--;
				MultiSkins[lPos[i]] = lTex[i];
			}
		}
	}
}

defaultproperties
{
	lPos(0)=3
	lPos(1)=4
	lPos(2)=5
	lPos(3)=6
	lPos(4)=7
	cCount=10.000000
	
	lTex(0)=Texture'UltimaProtosOVCharge01'
	lTex(1)=Texture'UltimaProtosOVCharge02'
	lTex(2)=Texture'UltimaProtosOVCharge03'
	lTex(3)=Texture'UltimaProtosOVCharge04'
	lTex(4)=Texture'UltimaProtosOVCharge05'
}
