//////////////////////////////////////////////////////////////
//				Feralidragon (27-02-2011)
//
// NW3 CYBOT LAUNCHER BUILD 1.00
//////////////////////////////////////////////////////////////

class CybVortexElectricARev expands CybVortexElectricA;

#exec MESH IMPORT MESH=CybVortexElectricARev ANIVFILE=MODELS\CybVortexElectricA_a.3d DATAFILE=MODELS\CybVortexElectricA_d.3d X=0 Y=0 Z=0
#exec MESH LODPARAMS MESH=CybVortexElectricARev STRENGTH=0.25
#exec MESH ORIGIN MESH=CybVortexElectricARev X=0 Y=0 Z=0 ROLL=128

//**************************************************************************
//--------------------------------------------------------------------------
//-------------------------- Animations ------------------------------------
#exec MESH SEQUENCE MESH=CybVortexElectricARev SEQ=All STARTFRAME=0 NUMFRAMES=42
#exec MESH SEQUENCE MESH=CybVortexElectricARev SEQ=Still STARTFRAME=0 NUMFRAMES=1


//Transform
#exec MESH SEQUENCE MESH=CybVortexElectricARev SEQ=Transform STARTFRAME=0 NUMFRAMES=11 RATE=10.0
#exec MESH SEQUENCE MESH=CybVortexElectricARev SEQ=UnTransform STARTFRAME=10 NUMFRAMES=11 RATE=10.0

//Rotating
#exec MESH SEQUENCE MESH=CybVortexElectricARev SEQ=RotateOnce STARTFRAME=21 NUMFRAMES=21 RATE=21.0
#exec MESH SEQUENCE MESH=CybVortexElectricARev SEQ=RotateLoop STARTFRAME=21 NUMFRAMES=20 RATE=21.0

//------------------------- Animations End ---------------------------------
//**************************************************************************

#exec MESHMAP NEW MESHMAP=CybVortexElectricARev MESH=CybVortexElectricARev
#exec MESHMAP SCALE MESHMAP=CybVortexElectricARev X=0.05 Y=0.05 Z=0.1


defaultproperties
{
    Mesh=CybVortexElectricARev
}
