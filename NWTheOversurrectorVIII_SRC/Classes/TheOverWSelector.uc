//////////////////////////////////////////////////////////////
//				Feralidragon (29-04-2013)
//
// NW3 THE OVERSURRECTOR 1.00
//////////////////////////////////////////////////////////////

class TheOverWSelector expands NaliWEffects;

var vector curOffset;

simulated function UpdateOffsetRot(float coef, int YawFrom, int YawTo, float dist)
{
local rotator R;

	R.Yaw = Int(coef*(YawTo - YawFrom) + YawFrom);
	curOffset = dist*(vect(1,0,0) >> R);
}

simulated function UpdateLoc(rotator Rot, vector Loc)
{
	SetLocation(Loc + (curOffset >> Rot));
}

simulated function UpdateRot(rotator Rot, rotator RTo)
{
	SetRotation(Class'NWUtils'.static.rTurn(Rot, RTo));
}

simulated function SetPropertiesFromActor(Actor A)
{
local byte i;

	if (A == None || A.bDeleteMe)
		return;
	
	Mesh = A.Mesh;
	Texture = A.Texture;
	for (i = 0; i < ArrayCount(MultiSkins); i++)
		MultiSkins[i] = A.MultiSkins[i];
}

defaultproperties
{
    DrawType=DT_Mesh
    Mesh=TheOversurrectorPick
	
	bHidden=True
	Style=STY_Normal
	ScaleGlow=1.000000
	bUnlit=True
	bNetTemporary=False
	DrawScale=0.150000
	LifeSpan=0.000000
	LODBias=16.000000
}
