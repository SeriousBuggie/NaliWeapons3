//////////////////////////////////////////////////////////////
//	Nali Weapons III Infinity modifier
//				Feralidragon (21-03-2010)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class Infinity expands MHPickups;

#exec TEXTURE IMPORT NAME=InfGlow FILE=ModifiersFX\InfGlow.bmp GROUP=ModifFX FLAGS=2
#exec TEXTURE IMPORT NAME=InfSymbol FILE=ModifiersFX\InfSymbol.bmp GROUP=ModifFX FLAGS=2
#exec TEXTURE IMPORT NAME=InfinityEnvGlass FILE=Skins\InfinityEnvGlass.bmp GROUP=Skins LODSET=2

#exec TEXTURE IMPORT NAME=InfLTrace01 FILE=Effects\InfLTrace01.bmp GROUP=Effects LODSET=2
#exec TEXTURE IMPORT NAME=InfLTrace02 FILE=Effects\InfLTrace02.bmp GROUP=Effects LODSET=2

#exec TEXTURE IMPORT NAME=InfChargLightOv FILE=Effects\InfChargLightOv.bmp GROUP=Effects LODSET=2

auto state Pickup
{   
    function Touch( actor Other )
    {
    local Pawn P;
	local float N, M;
	local int i;
            
        if ( ValidTouch(Other) && NaliWeapons(Pawn(Other).Weapon) != None && !NaliWeapons(Pawn(Other).Weapon).bMegaWeapon && !NaliWeapons(Pawn(Other).Weapon).bLockedModifier) 
        {   
			P = Pawn(Other);
			
			if (NaliWeapons(P.Weapon).bTheOne && !Class'NaliWeapons'.default.bTheOneUnlockLast && NaliWeapons(P.Weapon).SpecialHUD[2] != None)
				return;

			if (Level.Game.LocalLog != None)
				Level.Game.LocalLog.LogPickup(Self, P);
			if (Level.Game.WorldLog != None)
				Level.Game.WorldLog.LogPickup(Self, P);

			if (!NaliWeapons(P.Weapon).bTheOne)
			{
				//Reset/cancel other properties
				NaliWeapons(P.Weapon).KickBack = 0;
				NaliWeapons(P.Weapon).Splasher = 0;
				NaliWeapons(P.Weapon).HealthGiver = False;
				NaliWeapons(P.Weapon).FireRateChange = 1;
				NaliWeapons(P.Weapon).MoreDamage = 0;
				if (NaliWeapons(P.Weapon).OV != None)
				{
					NaliWeapons(P.Weapon).OV.Destroy();
					NaliWeapons(P.Weapon).OV = None;
				}
				
				//Activate new modified weapon
				NaliWeapons(P.Weapon).Overlayer = NaliWeapons(P.Weapon).StockOverlayers[0];
				NaliWeapons(P.Weapon).bInfinity = True;
				NaliWeapons(P.Weapon).SpecialHUD[0] = NaliWeapons(P.Weapon).ModifTexIcons[0];
				NaliWeapons(P.Weapon).SpecialInfo[0] = "Infinity";
				NaliWeapons(P.Weapon).SetNormalViewWeapon();
			}
			else
			{
				For (i=0; i<3; i++)
				{
					if (NaliWeapons(P.Weapon).SpecialHUD[i] == NaliWeapons(P.Weapon).ModifTexIcons[0])
						break;
					else if (NaliWeapons(P.Weapon).SpecialHUD[i] == None || i == 2)
					{
						NaliWeapons(P.Weapon).bInfinity = True;
						NaliWeapons(P.Weapon).SpecialHUD[i] = NaliWeapons(P.Weapon).ModifTexIcons[0];
						NaliWeapons(P.Weapon).SpecialInfo[i] = "Infinity";
						break;
					}
				}
			}
			NaliWeapons(P.Weapon).bModified = True;
			NaliWeapons(P.Weapon).SetPickupOvFX();

			PlayPickupMessage(P);
			PlaySound (PickupSound,,2.5);
			Other.MakeNoise(0.2);       
			SetRespawn();
        }
    }
}

defaultproperties
{
	ItemName="Infinity Modifier"
	PickupMessage="You picked up an Infinity Modifier."
	LightBrightness=100
	LightHue=0
	LightSaturation=255
	LightRadius=4
	LightType=LT_Steady
	Texture=InfinityEnvGlass
	LightsOverlayer=ModifierLightOv
	ModSymbolTex=InfSymbol
	SphereGlowTex=InfGlow
	
	BoltsTextures(0)=InfLTrace01
	BoltsTextures(1)=InfLTrace02
	BoltsTextures(2)=ModifLTrace
	
	ChargerOvLightTex=InfChargLightOv
}
