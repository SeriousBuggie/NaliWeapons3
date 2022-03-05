//////////////////////////////////////////////////////////////
// Gore cord segments main class
//				Feralidragon (31-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWCordSegm expands NWGoreSet
abstract;


var() byte SegmFrames;
var() float MaxLength; //Max length when DrawScale=1.000000


simulated function UpdateSeg(vector nodeLoc1, vector nodeLoc2)
{
local rotator R;

	SetLocation(nodeLoc1);
	SetRotation(rotator(nodeLoc2 - nodeLoc1));
	if (DrawScale > 0.0 && MaxLength > 0.0)
		AdjustLength(VSize(nodeLoc1 - nodeLoc2) / (MaxLength * DrawScale));
}

simulated function AdjustLength(float coef)
{
	coef = FClamp(coef, 0.0, 1.0);
	AnimFrame = coef * (1.f - 1.f/SegmFrames);
}

simulated function SetGoreType(class<NWGoreCBoard> newGoreBoardClass)
{
	if (newGoreBoardClass != None)
		newGoreBoardClass.static.SetCordSegmGore(Self);
}

simulated function SetScale(float nScale)
{
	if (nScale > 0.0)
		DrawScale = default.DrawScale * nScale;
}


defaultproperties
{
	Mesh=LodMesh'Botpack.BioGelm'
	DrawType=DT_Mesh
	Style=STY_Normal
	ScaleGlow=1.000000
	DrawScale=1.000000
	LifeSpan=0.000000
	
	AnimSequence=Segm
	SegmFrames=2
}
