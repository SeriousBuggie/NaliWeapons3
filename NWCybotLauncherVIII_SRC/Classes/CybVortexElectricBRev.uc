//////////////////////////////////////////////////////////////
//				Feralidragon (27-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVortexElectricBRev expands CybVortexElectricB;

#exec MESH IMPORT MESH=CybVortexElectricBRev ANIVFILE=MODELS\CybVortexElectricB_a.3d DATAFILE=MODELS\CybVortexElectricB_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybVortexElectricBRev STRENGTH=0.25
#exec MESH ORIGIN MESH=CybVortexElectricBRev X=0 Y=0 Z=0 ROLL=128

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybVortexElectricBRev SEQ=All STARTFRAME=0 NUMFRAMES=42
#exec MESH SEQUENCE MESH=CybVortexElectricBRev SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybVortexElectricBRev SEQ=Transform STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=CybVortexElectricBRev SEQ=UnTransform STARTFRAME=10 NUMFRAMES=11 RATE=10.0

//Rotating
#exec MESH SEQUENCE MESH=CybVortexElectricBRev SEQ=RotateOnce STARTFRAME=21 NUMFRAMES=21 RATE=21.0
#exec MESH SEQUENCE MESH=CybVortexElectricBRev SEQ=RotateLoop STARTFRAME=21 NUMFRAMES=20 RATE=21.0

//------------------------- Animations End ---------------------------------
//**************************************************************************

#exec MESHMAP NEW MESHMAP=CybVortexElectricBRev MESH=CybVortexElectricBRev
#exec MESHMAP SCALE MESHMAP=CybVortexElectricBRev X=0.05 Y=0.05 Z=0.1

defaultproperties
{
    Mesh=CybVortexElectricBRev
}
