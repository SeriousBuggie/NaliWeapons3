//////////////////////////////////////////////////////////////
//	Nali Weapons III Damage modifier
//				Feralidragon (21-03-2010)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class DamageN expands MHPickups;

#exec TEXTURE IMPORT NAME=DmgGlow FILE=ModifiersFX\DmgGlow.bmp GROUP=ModifFX FLAGS=2
#exec TEXTURE IMPORT NAME=DmgSymbol FILE=ModifiersFX\DmgSymbol.bmp GROUP=ModifFX FLAGS=2
#exec TEXTURE IMPORT NAME=DamageEnvGlass FILE=Skins\DamageEnvGlass.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=DmgLightOv FILE=Skins\DmgLightOv.bmp GROUP=Skins LODSET=2

#exec TEXTURE IMPORT NAME=DmgLTrace01 FILE=Effects\DmgLTrace01.bmp GROUP=Effects LODSET=2
#exec TEXTURE IMPORT NAME=DmgLTrace02 FILE=Effects\DmgLTrace02.bmp GROUP=Effects LODSET=2
#exec TEXTURE IMPORT NAME=DmgLTrace03 FILE=Effects\DmgLTrace03.bmp GROUP=Effects LODSET=2

#exec TEXTURE IMPORT NAME=DmgChargLightOv FILE=Effects\DmgChargLightOv.bmp GROUP=Effects LODSET=2

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
				NaliWeapons(P.Weapon).HealthGiver = False;
				NaliWeapons(P.Weapon).Splasher = 0;
				NaliWeapons(P.Weapon).FireRateChange = 1;
				if (NaliWeapons(P.Weapon).OV != None)
				{
					NaliWeapons(P.Weapon).OV.Destroy();
					NaliWeapons(P.Weapon).OV = None;
				}
				
				//Activate new modified weapon
				M = FRand()*(NaliWeapons(P.Weapon).MoreDamageMax - NaliWeapons(P.Weapon).MoreDamageMin) + NaliWeapons(P.Weapon).MoreDamageMin;
				M = Int(M*10.f)/10.f;
				N = (M - Int(M)) * 10;
				NaliWeapons(P.Weapon).Overlayer = NaliWeapons(P.Weapon).StockOverlayers[2];
				NaliWeapons(P.Weapon).MoreDamage = M;
				NaliWeapons(P.Weapon).SpecialHUD[0] = NaliWeapons(P.Weapon).ModifTexIcons[2];
				NaliWeapons(P.Weapon).SpecialInfo[0] = Int(M) $ "." $ Int(N) $ "X";
				NaliWeapons(P.Weapon).SetNormalViewWeapon();
			}
			else
			{
				For (i=0; i<3; i++)
				{
					if (NaliWeapons(P.Weapon).SpecialHUD[i] == NaliWeapons(P.Weapon).ModifTexIcons[2])
						break;
					else if (NaliWeapons(P.Weapon).SpecialHUD[i] == None || i == 2)
					{
						M = FRand()*(NaliWeapons(P.Weapon).MoreDamageMax - NaliWeapons(P.Weapon).MoreDamageMin) + NaliWeapons(P.Weapon).MoreDamageMin;
						M = Int(M*10.f)/10.f;
						N = (M - Int(M)) * 10;
						NaliWeapons(P.Weapon).MoreDamage = M;
						NaliWeapons(P.Weapon).SpecialHUD[i] = NaliWeapons(P.Weapon).ModifTexIcons[2];
						NaliWeapons(P.Weapon).SpecialInfo[i] = Int(M) $ "." $ Int(N) $ "X";
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
	ItemName="Damage Modifier"
	PickupMessage="You picked up a Damage Modifier."
	LightBrightness=100
	LightHue=191
	LightSaturation=13
	LightRadius=4
	LightType=LT_Steady
	Texture=DamageEnvGlass
	LightsOverlayer=DmgLightOv
	ModSymbolTex=DmgSymbol
	SphereGlowTex=DmgGlow
	
	BoltsTextures(0)=DmgLTrace01
	BoltsTextures(1)=DmgLTrace02
	BoltsTextures(2)=DmgLTrace03
	
	ChargerOvLightTex=DmgChargLightOv
}
