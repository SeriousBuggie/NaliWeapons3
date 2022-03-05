//////////////////////////////////////////////////////////////
//	Nali Weapons III 1st and pickup weapon overlayer (vertex or mesh)
//				Feralidragon (21-03-2010)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWeaponOverFX expands NaliWEffects;

#exec TEXTURE IMPORT NAME=TranslucInvis FILE=SKINS\TranslucInvis.bmp GROUP=Skins LODSET=2
#exec TEXTURE IMPORT NAME=ModulInvis FILE=SKINS\ModulInvis.bmp GROUP=Skins LODSET=2

var bool bOldHidden, bServerUpdt;
var texture MaskInv, TransInv, ModInv;

simulated function SetLODBias(optional byte LODType)
{
	if (LODType == 0 && Level.NetMode != NM_DedicatedServer)
		LODBias = FMax(1.0,Class'NWInfo'.default.WeaponDistDetail * Class'NWInfo'.default.MaxLODBias/255);
}

simulated function SetHiddenessUpdating()
{
	bServerUpdt = Level.NetMode != NM_StandAlone;
}

simulated function HideOv(){	bHidden = True;}
simulated function UnHideOv(){	bHidden = False;}

simulated function Tick(float Delta)
{
	if (bServerUpdt)
	{
		if (Owner != None && bOldHidden != Owner.bHidden)
		{
			bHidden = Owner.bHidden;
			bOldHidden = bHidden;
		}
		else if (Owner == None)
			Destroy();
	}
}

simulated function ChangeTex(byte TexIndex, optional texture NewTex)
{
	if (TexIndex > 8)
	{
		log("WARNING: Attempted to access texture index "$TexIndex$"!");
		return;
	}
	
	if (NewTex != None)
	{
		if (TexIndex == 0)
			Texture = NewTex;
		else
			MultiSkins[TexIndex-1] = NewTex;
	}
	else if (Style == STY_Masked)
	{
		if (TexIndex == 0)
			Texture = MaskInv;
		else
			MultiSkins[TexIndex-1] = MaskInv;
	}
	else if (Style == STY_Translucent)
	{
		if (TexIndex == 0)
			Texture = TransInv;
		else
			MultiSkins[TexIndex-1] = TransInv;
	}
	else if (Style == STY_Modulated)
	{
		if (TexIndex == 0)
			Texture = ModInv;
		else
			MultiSkins[TexIndex-1] = ModInv;
	}
	else if (Style == STY_Normal)
	{
		if (TexIndex == 0 && !bParticles)
			Texture = None;
		else if (TexIndex > 0)
			MultiSkins[TexIndex-1] = None;
	}
}

defaultproperties
{
	DrawType=DT_Mesh
	Mesh=LodMesh'UnrealShare.WoodenBoxM'
	bAnimByOwner=True
	bHidden=True
	bNetTemporary=False
	Mass=0.000000
	CollisionHeight=0.000000
	CollisionRadius=0.000000
	Skin=None
	Style=STY_Normal
	MaskInv=MaskInvis
	TransInv=TranslucInvis
	ModInv=ModulInvis
}
