//////////////////////////////////////////////////////////////
//				Feralidragon (04-10-2010)
//
// NW3 FREEZER BUILD 1.00
//////////////////////////////////////////////////////////////
class IceOverlayer expands NaliTrail;

#exec TEXTURE IMPORT NAME=Ice FILE=Skins\Ice.bmp GROUP=Coronas FLAGS=2

var float SCount;

simulated function Tick(float Delta)
{
	if (Level.NetMode != NM_DedicatedServer)
	{
		if (SCount <= 1.5)
		{
			SCount += Delta;
			ScaleGlow = SCount * 0.7;
		}
		if (Owner != None)
			PrePivot = Owner.PrePivot;
	}
}

simulated function SetIceProperties(actor A)
{
	Mesh = A.Mesh;
	DrawScale = A.DrawScale;
	if (A.Fatness + 20 < 255)
		Fatness = A.Fatness + 20;
	else
		Fatness = 255;
}

defaultproperties
{
	DrawType=DT_Mesh
	Style=STY_Translucent
	Texture=Ice
	ScaleGlow=1.000000
	LifeSpan=0.000000
	bNetTemporary=False
	bMeshEnviroMap=True
	bAnimByOwner=True
}