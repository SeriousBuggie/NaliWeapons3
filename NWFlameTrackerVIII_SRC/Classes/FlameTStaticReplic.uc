//////////////////////////////////////////////////////////////
//				Feralidragon (18-07-2010)
//
// NW3 FLAME TRACKER BUILD 1.00
//////////////////////////////////////////////////////////////

class FlameTStaticReplic expands NaliWEffects;

function SetOwnershipProperties( actor newOwner)
{
	if (newOwner == None)
	{
		Destroy();
		return;
	}
	
	Mesh = newOwner.Mesh;
	DrawScale = newOwner.DrawScale;
	AnimSequence = newOwner.AnimSequence;
	AnimFrame = newOwner.AnimFrame;
	PrePivot = newOwner.PrePivot;
}

defaultproperties
{
	Style=STY_Translucent
	Texture=TranslucInvis
	DrawType=DT_Mesh
	Mesh=LodMesh'UnrealShare.BarrelM'
	bMeshEnviroMap=True
	bNetTemporary=False
	Physics=PHYS_None
}
