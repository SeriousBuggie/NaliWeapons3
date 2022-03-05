//////////////////////////////////////////////////////////////
//				Feralidragon (12-02-2014)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWGoreCarcassPH expands NaliWEffects;

var Carcass CarcRef;
var name DmgType, BldType;
var NWBloodyMess BldMut;
var int GoreID;

function initCarcassPH(NWBloodyMess bldMessMut, Carcass ref, name damageType, name bloodType, int grID, float victColR, float victColH)
{
	if (bldMessMut == None || ref == None)
	{
		Destroy();
		return;
	}
	
	BldMut = bldMessMut;
	CarcRef = ref;
	DmgType = damageType;
	BldType = bloodType;
	GoreID = grID;
	SetCollisionSize(victColR, victColH);
}

function Tick(float Delta)
{
	if (BldMut == None || CarcRef == None || BldMut.bDeleteMe || CarcRef.bDeleteMe)
	{
		BldMut = None;
		CarcRef = None;
		Destroy();
		return;
	}
	
	if (CarcRef.IsInState('Gibbing'))
	{
		SetRotation(CarcRef.Rotation);
		SetLocation(CarcRef.Location);
		BldMut.setupVictimGoreFX(Self, DmgType, BldType, GoreID, Location);
		BldMut = None;
		CarcRef = None;
		Destroy();
		return;
	}
}

defaultproperties
{
	RemoteRole=ROLE_None
	bHidden=True
	LifeSpan=0.000000
	bGameRelevant=True
}
