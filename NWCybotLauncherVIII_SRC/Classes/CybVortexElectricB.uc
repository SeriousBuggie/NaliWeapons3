//////////////////////////////////////////////////////////////
//				Feralidragon (27-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVortexElectricB expands CybVortexElectricA;

#exec MESH IMPORT MESH=CybVortexElectricB ANIVFILE=MODELS\CybVortexElectricB_a.3d DATAFILE=MODELS\CybVortexElectricB_d.3d X=0 Y=0 Z=0 UNMIRROR=1
#exec MESH LODPARAMS MESH=CybVortexElectricB STRENGTH=0.25
#exec MESH ORIGIN MESH=CybVortexElectricB X=0 Y=0 Z=0

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybVortexElectricB SEQ=All STARTFRAME=0 NUMFRAMES=42
#exec MESH SEQUENCE MESH=CybVortexElectricB SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybVortexElectricB SEQ=Transform STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=CybVortexElectricB SEQ=UnTransform STARTFRAME=10 NUMFRAMES=11 RATE=10.0

//Rotating
#exec MESH SEQUENCE MESH=CybVortexElectricB SEQ=RotateOnce STARTFRAME=21 NUMFRAMES=21 RATE=21.0
#exec MESH SEQUENCE MESH=CybVortexElectricB SEQ=RotateLoop STARTFRAME=21 NUMFRAMES=20 RATE=21.0

//------------------------- Animations End ---------------------------------
//**************************************************************************

#exec MESHMAP NEW MESHMAP=CybVortexElectricB MESH=CybVortexElectricB
#exec MESHMAP SCALE MESHMAP=CybVortexElectricB X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    Mesh=CybVortexElectricB
}
