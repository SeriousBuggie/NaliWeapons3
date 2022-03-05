//////////////////////////////////////////////////////////////
// Gore cord segments main class
//				Feralidragon (31-01-2013)
//
// NW3 CORE BUILD 1.00
//////////////////////////////////////////////////////////////

class NWCordAttachment expands NWGoreSet
abstract;

var NWCordAttachment NextAttachment;


simulated function UpdatePos(vector newLoc, rotator newRot)
{
	SetLocation(newLoc);
	SetRotation(newRot);
	if (NextAttachment != None)
		NextAttachment.UpdatePos(newLoc, newRot);
}

simulated function Destroyed()
{
	if (NextAttachment != None)
		NextAttachment.Destroy();
	NextAttachment = None;
	
	Super.Destroyed();
}

simulated function SetGoreType(class<NWGoreCBoard> newGoreBoardClass)
{
	if (newGoreBoardClass != None)
	{
		newGoreBoardClass.static.SetCordAttachGore(Self);
		if (NextAttachment != None)
			NextAttachment.SetGoreType(newGoreBoardClass);
	}
}

simulated function SetScale(float nScale)
{
	if (nScale > 0.0)
	{
		DrawScale = default.DrawScale * nScale;
		Mass = default.Mass * nScale;
	}
}


defaultproperties
{
	Mesh=LodMesh'Botpack.BioGelm'
	DrawType=DT_Mesh
	Style=STY_Normal
	ScaleGlow=1.000000
	DrawScale=1.000000
	LifeSpan=0.000000
	
	Mass=0.000000
}
