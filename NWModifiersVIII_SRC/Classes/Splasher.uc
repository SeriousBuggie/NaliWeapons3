//////////////////////////////////////////////////////////////
//	Nali Weapons III Splasher modifier
//				Feralidragon (21-03-2010)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class Splasher expands MHPickups;

#exec TEXTURE IMPORT NAME=SplashGlow FILE=ModifiersFX\SplashGlow.bmp GROUP=ModifFX FLAGS=2
#exec TEXTURE IMPORT NAME=SplashSymbol FILE=ModifiersFX\SplashSymbol.bmp GROUP=ModifFX FLAGS=2
#exec TEXTURE IMPORT NAME=SplasherEnvGlass FILE=Skins\SplasherEnvGlass.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=SplashLightOv FILE=Skins\SplashLightOv.bmp GROUP=Skins LODSET=2

#exec TEXTURE IMPORT NAME=SplashLTrace01 FILE=Effects\SplashLTrace01.bmp GROUP=Effects LODSET=2
#exec TEXTURE IMPORT NAME=SplashLTrace02 FILE=Effects\SplashLTrace02.bmp GROUP=Effects LODSET=2
#exec TEXTURE IMPORT NAME=SplashLTrace03 FILE=Effects\SplashLTrace03.bmp GROUP=Effects LODSET=2

#exec TEXTURE IMPORT NAME=SplashChargLightOv FILE=Effects\SplashChargLightOv.bmp GROUP=Effects LODSET=2

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
				NaliWeapons(P.Weapon).FireRateChange = 1;
				NaliWeapons(P.Weapon).MoreDamage = 0;
				if (NaliWeapons(P.Weapon).OV != None)
				{
					NaliWeapons(P.Weapon).OV.Destroy();
					NaliWeapons(P.Weapon).OV = None;
				}
				
				//Activate new modified weapon
				M = FRand()*(NaliWeapons(P.Weapon).SplasherMax - NaliWeapons(P.Weapon).SplasherMin) + NaliWeapons(P.Weapon).SplasherMin;
				M = Int(M*10.f)/10.f;
				N = (M - Int(M)) * 10;
				NaliWeapons(P.Weapon).Splasher = M;
				NaliWeapons(P.Weapon).Overlayer = NaliWeapons(P.Weapon).StockOverlayers[4];
				NaliWeapons(P.Weapon).SpecialHUD[0] = NaliWeapons(P.Weapon).ModifTexIcons[4];
				NaliWeapons(P.Weapon).SpecialInfo[0] = Int(M) $ "." $ Int(N) $ "X";
				NaliWeapons(P.Weapon).SetNormalViewWeapon();
			}
			else
			{
				For (i=0; i<3; i++)
				{
					if (NaliWeapons(P.Weapon).SpecialHUD[i] == NaliWeapons(P.Weapon).ModifTexIcons[4])
						break;
					else if (NaliWeapons(P.Weapon).SpecialHUD[i] == None || i == 2)
					{
						M = FRand()*(NaliWeapons(P.Weapon).SplasherMax - NaliWeapons(P.Weapon).SplasherMin) + NaliWeapons(P.Weapon).SplasherMin;
						M = Int(M*10.f)/10.f;
						N = (M - Int(M)) * 10;
						NaliWeapons(P.Weapon).Splasher = M;
						NaliWeapons(P.Weapon).SpecialHUD[i] = NaliWeapons(P.Weapon).ModifTexIcons[4];
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
	ItemName="Splasher Modifier"
	PickupMessage="You picked up a Splasher Modifier."
	LightBrightness=100
	LightHue=42
	LightSaturation=128
	LightRadius=4
	LightType=LT_Steady
	Texture=SplasherEnvGlass
	LightsOverlayer=SplashLightOv
	ModSymbolTex=SplashSymbol
	SphereGlowTex=SplashGlow
	
	BoltsTextures(0)=SplashLTrace01
	BoltsTextures(1)=SplashLTrace02
	BoltsTextures(2)=SplashLTrace03
	
	ChargerOvLightTex=SplashChargLightOv
}
