//////////////////////////////////////////////////////////////
//	Nali Weapons III Fast modifier
//				Feralidragon (21-03-2010)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class Fast expands MHPickups;

#exec TEXTURE IMPORT NAME=FastGlow FILE=ModifiersFX\FastGlow.bmp GROUP=ModifFX FLAGS=2
#exec TEXTURE IMPORT NAME=FastSymbol FILE=ModifiersFX\FastSymbol.bmp GROUP=ModifFX FLAGS=2
#exec TEXTURE IMPORT NAME=FastEnvGlass FILE=Skins\FastEnvGlass.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=FastLightOv FILE=Skins\FastLightOv.bmp GROUP=Skins LODSET=2

#exec TEXTURE IMPORT NAME=FastLTrace01 FILE=Effects\FastLTrace01.bmp GROUP=Effects LODSET=2
#exec TEXTURE IMPORT NAME=FastLTrace02 FILE=Effects\FastLTrace02.bmp GROUP=Effects LODSET=2
#exec TEXTURE IMPORT NAME=FastLTrace03 FILE=Effects\FastLTrace03.bmp GROUP=Effects LODSET=2

#exec TEXTURE IMPORT NAME=FastChargLightOv FILE=Effects\FastChargLightOv.bmp GROUP=Effects LODSET=2

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
				NaliWeapons(P.Weapon).MoreDamage = 0;
				if (NaliWeapons(P.Weapon).OV != None)
				{
					NaliWeapons(P.Weapon).OV.Destroy();
					NaliWeapons(P.Weapon).OV = None;
				}
				
				//Activate new modified weapon
				M = FRand()*(NaliWeapons(P.Weapon).FireRateChangeMax - NaliWeapons(P.Weapon).FireRateChangeMin) + NaliWeapons(P.Weapon).FireRateChangeMin;
				M = Int(M*10.f)/10.f;
				N = (M - Int(M)) * 10;
				NaliWeapons(P.Weapon).Overlayer = NaliWeapons(P.Weapon).StockOverlayers[5];
				NaliWeapons(P.Weapon).FireRateChange = M;
				NaliWeapons(P.Weapon).SpecialHUD[0] = NaliWeapons(P.Weapon).ModifTexIcons[5];
				NaliWeapons(P.Weapon).SpecialInfo[0] = Int(M) $ "." $ Int(N) $ "X";
				NaliWeapons(P.Weapon).SetNormalViewWeapon();
			}
			else
			{
				For (i=0; i<3; i++)
				{
					if (NaliWeapons(P.Weapon).SpecialHUD[i] == NaliWeapons(P.Weapon).ModifTexIcons[5])
						break;
					else if (NaliWeapons(P.Weapon).SpecialHUD[i] == None || i == 2)
					{
						M = FRand()*(NaliWeapons(P.Weapon).FireRateChangeMax - NaliWeapons(P.Weapon).FireRateChangeMin) + NaliWeapons(P.Weapon).FireRateChangeMin;
						M = Int(M*10.f)/10.f;
						N = (M - Int(M)) * 10;
						NaliWeapons(P.Weapon).FireRateChange = M;
						NaliWeapons(P.Weapon).SpecialHUD[i] = NaliWeapons(P.Weapon).ModifTexIcons[5];
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
	ItemName="Fast Modifier"
	PickupMessage="You picked up a Fast Modifier."
	LightBrightness=100
	LightHue=0
	LightSaturation=0
	LightRadius=4
	LightType=LT_Steady
	Texture=FastEnvGlass
	LightsOverlayer=FastLightOv
	ModSymbolTex=FastSymbol
	SphereGlowTex=FastGlow
	
	BoltsTextures(0)=FastLTrace01
	BoltsTextures(1)=FastLTrace02
	BoltsTextures(2)=FastLTrace03
	
	ChargerOvLightTex=FastChargLightOv
}
