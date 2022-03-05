//////////////////////////////////////////////////////////////
//	Nali Weapons III Health modifier
//				Feralidragon (21-03-2010)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class HealthN expands MHPickups;

#exec TEXTURE IMPORT NAME=HealthGlow FILE=ModifiersFX\HealthGlow.bmp GROUP=ModifFX FLAGS=2
#exec TEXTURE IMPORT NAME=HealthSymbol FILE=ModifiersFX\HealthSymbol.bmp GROUP=ModifFX FLAGS=2
#exec TEXTURE IMPORT NAME=HealthEnvGlass FILE=Skins\HealthEnvGlass.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=HealthLightOv FILE=Skins\HealthLightOv.bmp GROUP=Skins LODSET=2

#exec TEXTURE IMPORT NAME=HealthLTrace01 FILE=Effects\HealthLTrace01.bmp GROUP=Effects LODSET=2
#exec TEXTURE IMPORT NAME=HealthLTrace02 FILE=Effects\HealthLTrace02.bmp GROUP=Effects LODSET=2
#exec TEXTURE IMPORT NAME=HealthLTrace03 FILE=Effects\HealthLTrace03.bmp GROUP=Effects LODSET=2

#exec TEXTURE IMPORT NAME=HealthChargLightOv FILE=Effects\HealthChargLightOv.bmp GROUP=Effects LODSET=2

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
				NaliWeapons(P.Weapon).bInfinity = False;
				NaliWeapons(P.Weapon).KickBack = 0;
				NaliWeapons(P.Weapon).Splasher = 0;
				NaliWeapons(P.Weapon).FireRateChange = 1;
				NaliWeapons(P.Weapon).MoreDamage = 0;
				if (NaliWeapons(P.Weapon).OV != None)
				{
					NaliWeapons(P.Weapon).OV.Destroy();
					NaliWeapons(P.Weapon).OV = None;
				}
				
				//Activate new modified weapon
				NaliWeapons(P.Weapon).Overlayer = NaliWeapons(P.Weapon).StockOverlayers[3];
				NaliWeapons(P.Weapon).HealthGiver = True;
				NaliWeapons(P.Weapon).SpecialHUD[0] = NaliWeapons(P.Weapon).ModifTexIcons[3];
				NaliWeapons(P.Weapon).SpecialInfo[0] = "Health";
				NaliWeapons(P.Weapon).SetNormalViewWeapon();
			}
			else
			{
				For (i=0; i<3; i++)
				{
					if (NaliWeapons(P.Weapon).SpecialHUD[i] == NaliWeapons(P.Weapon).ModifTexIcons[3])
						break;
					else if (NaliWeapons(P.Weapon).SpecialHUD[i] == None || i == 2)
					{
						NaliWeapons(P.Weapon).HealthGiver = True;
						NaliWeapons(P.Weapon).SpecialHUD[i] = NaliWeapons(P.Weapon).ModifTexIcons[3];
						NaliWeapons(P.Weapon).SpecialInfo[i] = "Health";
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
	ItemName="Health Modifier"
	PickupMessage="You picked up a Health Modifier"
	LightBrightness=100
	LightHue=148
	LightSaturation=128
	LightRadius=4
	LightType=LT_Steady
	Texture=HealthEnvGlass
	LightsOverlayer=HealthLightOv
	ModSymbolTex=HealthSymbol
	SphereGlowTex=HealthGlow
	
	BoltsTextures(0)=HealthLTrace01
	BoltsTextures(1)=HealthLTrace02
	BoltsTextures(2)=HealthLTrace03
	
	ChargerOvLightTex=HealthChargLightOv
}
