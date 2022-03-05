//////////////////////////////////////////////////////////////
//	Nali Weapons III Kicker modifier
//				Feralidragon (21-03-2010)
//
// NW3 MODIFIERS BUILD 1.00
//////////////////////////////////////////////////////////////

class Kick expands MHPickups;

#exec TEXTURE IMPORT NAME=KickGlow FILE=ModifiersFX\KickGlow.bmp GROUP=ModifFX FLAGS=2
#exec TEXTURE IMPORT NAME=KickSymbol FILE=ModifiersFX\KickSymbol.bmp GROUP=ModifFX FLAGS=2
#exec TEXTURE IMPORT NAME=KickerEnvGlass FILE=Skins\KickerEnvGlass.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=KickLightOv FILE=Skins\KickLightOv.bmp GROUP=Skins LODSET=2

#exec TEXTURE IMPORT NAME=KickLTrace01 FILE=Effects\KickLTrace01.bmp GROUP=Effects LODSET=2
#exec TEXTURE IMPORT NAME=KickLTrace02 FILE=Effects\KickLTrace02.bmp GROUP=Effects LODSET=2
#exec TEXTURE IMPORT NAME=KickLTrace03 FILE=Effects\KickLTrace03.bmp GROUP=Effects LODSET=2

#exec TEXTURE IMPORT NAME=KickChargLightOv FILE=Effects\KickChargLightOv.bmp GROUP=Effects LODSET=2

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
				NaliWeapons(P.Weapon).HealthGiver = False;
				NaliWeapons(P.Weapon).Splasher = 0;
				NaliWeapons(P.Weapon).FireRateChange = 1;
				NaliWeapons(P.Weapon).MoreDamage = 0;
				if (NaliWeapons(P.Weapon).OV != None)
				{
					NaliWeapons(P.Weapon).OV.Destroy();
					NaliWeapons(P.Weapon).OV = None;
				}
				
				//Activate new modified weapon
				N = FRand()*(NaliWeapons(P.Weapon).KickBackMax - NaliWeapons(P.Weapon).KickBackMin) + NaliWeapons(P.Weapon).KickBackMin;		
				NaliWeapons(P.Weapon).Overlayer = NaliWeapons(P.Weapon).StockOverlayers[1];
				NaliWeapons(P.Weapon).KickBack = Int(N);
				NaliWeapons(P.Weapon).SpecialHUD[0] = NaliWeapons(P.Weapon).ModifTexIcons[1];
				NaliWeapons(P.Weapon).SpecialInfo[0] = Int(N) $ " K";
				NaliWeapons(P.Weapon).SetNormalViewWeapon();
			}
			else
			{
				For (i=0; i<3; i++)
				{
					if (NaliWeapons(P.Weapon).SpecialHUD[i] == NaliWeapons(P.Weapon).ModifTexIcons[1])
						break;
					else if (NaliWeapons(P.Weapon).SpecialHUD[i] == None || i == 2)
					{
						N = FRand()*(NaliWeapons(P.Weapon).KickBackMax - NaliWeapons(P.Weapon).KickBackMin) + NaliWeapons(P.Weapon).KickBackMin;	
						NaliWeapons(P.Weapon).KickBack = Int(N);
						NaliWeapons(P.Weapon).SpecialHUD[i] = NaliWeapons(P.Weapon).ModifTexIcons[1];
						NaliWeapons(P.Weapon).SpecialInfo[i] = Int(N) $ " K";
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
	ItemName="Kickback Modifier"
	PickupMessage="You picked up a Kickback Modifier."
	LightBrightness=100
	LightHue=85
	LightSaturation=64
	LightRadius=4
	LightType=LT_Steady
	Texture=KickerEnvGlass
	LightsOverlayer=KickLightOv
	ModSymbolTex=KickSymbol
	SphereGlowTex=KickGlow
	
	BoltsTextures(0)=KickLTrace01
	BoltsTextures(1)=KickLTrace02
	BoltsTextures(2)=KickLTrace03
	
	ChargerOvLightTex=KickChargLightOv
}
