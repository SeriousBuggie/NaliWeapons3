//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class BoltLightEffect expands NaliZPEffects;

#exec TEXTURE IMPORT NAME=BoltLight FILE=Coronas\BoltLight.bmp GROUP=Coronas FLAGS=2

simulated function Tick(float Delta)
{
local PlayerPawn PP;

	Super.Tick(Delta);

	if (Level.NetMode != NM_DedicatedServer)
	{
		if (LifeSpan >= (2 * Default.LifeSpan / 3))
			ScaleGlow = (Default.LifeSpan - LifeSpan) * Default.ScaleGlow / (Default.LifeSpan/3);
		else
			ScaleGlow = LifeSpan * Default.ScaleGlow / (2 * Default.LifeSpan / 3);
		
		DrawScale = LifeSpan * Default.DrawScale / Default.LifeSpan;
		SpriteProjForward = LifeSpan * Default.SpriteProjForward / Default.LifeSpan;
		
		PP = PlayerPawn(Owner);
		if (PP != None && PP.Handedness == 2 && Viewport(PP.Player) != None)
			bOwnerNoSee = (VSize(PP.Location - Location) < Class'BoltRifle'.default.MinCoronaHiddenRenderDist);
	}
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=BoltLight
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=0.500000
	LifeSpan=0.400000
	ScaleGlow=5.500000
	bNetTemporary=True
	
	SpriteProjForward=16.000000
}
