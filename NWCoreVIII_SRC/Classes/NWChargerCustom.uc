//////////////////////////////////////////////////////////////
//	Nali Weapons III Inventory Custom Charger
//				Feralidragon (04-08-2012)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWChargerCustom expands NWCharger
abstract;

//Custom Charger 01
#exec TEXTURE IMPORT NAME=CC01_R FILE=CCHARGERS\CC01_R.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC01_G FILE=CCHARGERS\CC01_G.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC01_B FILE=CCHARGERS\CC01_B.bmp GROUP=CChargers LODSET=2

//Custom Charger 02
#exec TEXTURE IMPORT NAME=CC02_R FILE=CCHARGERS\CC02_R.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC02_G FILE=CCHARGERS\CC02_G.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC02_B FILE=CCHARGERS\CC02_B.bmp GROUP=CChargers LODSET=2

//Custom Charger 03
#exec TEXTURE IMPORT NAME=CC03_R FILE=CCHARGERS\CC03_R.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC03_G FILE=CCHARGERS\CC03_G.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC03_B FILE=CCHARGERS\CC03_B.bmp GROUP=CChargers LODSET=2

//Custom Charger 04
#exec TEXTURE IMPORT NAME=CC04_R FILE=CCHARGERS\CC04_R.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC04_G FILE=CCHARGERS\CC04_G.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC04_B FILE=CCHARGERS\CC04_B.bmp GROUP=CChargers LODSET=2

//Custom Charger 05
#exec TEXTURE IMPORT NAME=CC05_R FILE=CCHARGERS\CC05_R.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC05_G FILE=CCHARGERS\CC05_G.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC05_B FILE=CCHARGERS\CC05_B.bmp GROUP=CChargers LODSET=2

//Custom Charger 06
#exec TEXTURE IMPORT NAME=CC06_R FILE=CCHARGERS\CC06_R.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC06_G FILE=CCHARGERS\CC06_G.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC06_B FILE=CCHARGERS\CC06_B.bmp GROUP=CChargers LODSET=2

//Custom Charger 07
#exec TEXTURE IMPORT NAME=CC07_R FILE=CCHARGERS\CC07_R.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC07_G FILE=CCHARGERS\CC07_G.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC07_B FILE=CCHARGERS\CC07_B.bmp GROUP=CChargers LODSET=2

//Custom Charger 08
#exec TEXTURE IMPORT NAME=CC08_R FILE=CCHARGERS\CC08_R.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC08_G FILE=CCHARGERS\CC08_G.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC08_B FILE=CCHARGERS\CC08_B.bmp GROUP=CChargers LODSET=2

//Custom Charger 09
#exec TEXTURE IMPORT NAME=CC09_R FILE=CCHARGERS\CC09_R.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC09_G FILE=CCHARGERS\CC09_G.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC09_B FILE=CCHARGERS\CC09_B.bmp GROUP=CChargers LODSET=2

//Custom Charger 10
#exec TEXTURE IMPORT NAME=CC10_R FILE=CCHARGERS\CC10_R.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC10_G FILE=CCHARGERS\CC10_G.bmp GROUP=CChargers LODSET=2
#exec TEXTURE IMPORT NAME=CC10_B FILE=CCHARGERS\CC10_B.bmp GROUP=CChargers LODSET=2


var texture TexRGB[3];
var int RotRate;

replication
{
	reliable if (Role == ROLE_Authority)
		TexRGB, RotRate;
}

function InitCustomization(texture TexR, texture TexG, texture TexB, optional int rRate)
{
	TexRGB[0] = TexR;
	TexRGB[1] = TexG;
	TexRGB[2] = TexB;
	RotRate = rRate;
}

simulated function Tick(float Delta)
{
local byte i;
local rotator R;

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (OV == None && OVClass != None && ovFX > 0)
		{
			OV = Spawn(OVClass);
			for (i = 0; i < ArrayCount(TexRGB); i++)
				OV.RGB[i] = TexRGB[i];
			OV.Mesh = Mesh;
			OV.Init(Self, CurColor);
		}
		
		if (RotRate != 0)
		{
			R = Rotation;
			R.Roll += Int(RotRate * Delta);
			SetRotation(R);
			if (OV != None)
				OV.UpdateRotation(Self);
		}
	}
	Super.Tick(Delta);
}

defaultproperties
{
	OVClass=Class'NWColoredOV'
	InvSpawnHeight=0.000000
	Style=STY_Translucent
	bUnlit=True
	MultiSkins(1)=TranslucInvis
	Texture=TranslucInvis
}