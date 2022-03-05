//////////////////////////////////////////////////////////////
//				Feralidragon (23-06-2010)
//
// NW3 SUPER BOLT RIFLE BUILD 1.00
//////////////////////////////////////////////////////////////

class SBoltLightEffect expands NaliZPEffects;

#exec TEXTURE IMPORT NAME=SBoltLight FILE=Coronas\SBoltLight.bmp GROUP=Coronas FLAGS=2

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
		
		if (Owner != None)
		{
			PP = PlayerPawn(Owner.Owner);
			if (PP != None && PP.Handedness == 2 && Viewport(PP.Player) != None)
				bOwnerNoSee = (VSize(PP.Location - Location) < Class'SuperBoltRifle'.default.MinCoronaHiddenRenderDist);
		}
	}
}

defaultproperties
{
    DrawType=DT_Sprite
    Texture=SBoltLight
	Style=STY_Translucent
	bUnlit=True
	
	DrawScale=0.500000
	LifeSpan=0.400000
	ScaleGlow=5.500000
	bNetTemporary=True
	
	SpriteProjForward=16.000000
}
