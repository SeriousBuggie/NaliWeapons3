//////////////////////////////////////////////////////////////
//				Feralidragon (30-09-2012)
//
// NW3 EXTRAS BUILD 1.00
//////////////////////////////////////////////////////////////

class NWExtrasArmor expands NaliPickups config(NWExtrasCfg);

var(ServerConfig) config int ArmorPoints;
var(ServerConfig) config int AbsorptionPercentage;

function PreBeginPlay()
{
	Charge = default.ArmorPoints;
	default.Charge = Charge;
	Class.default.Charge = Charge;
	
	MaxCharge = Charge;
	default.MaxCharge = Charge;
	Class.default.MaxCharge = Charge;
	
	ArmorAbsorption = default.AbsorptionPercentage;
	default.ArmorAbsorption = ArmorAbsorption;
	Class.default.ArmorAbsorption = ArmorAbsorption;
	
	Super.PreBeginPlay();
}

defaultproperties
{
}
