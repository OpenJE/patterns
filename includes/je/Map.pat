// Map Pattern

import je._2MWTc;
import je.ECAMc;
import je.EMAPc;
import je.EME2c;
import je.EMEFc;
import je.EMEPc;
import je.EMFGc;
import je.EMNOc;
import je.EMNPc;
import je.EMSDc;
import je.EPTHc;
import je.trigger;

namespace auto je {

	struct Map {
		_2MWTc  _2MWT = null;
		ECAMc   ECAM = null;
		EMAPc   EMAP = new();
		EME2c   EME2[];
		EMEFc   EMEF[];
		EMEPc   EMEP[];
		EMFGc   EMFG = null;
		EMNOc   EMNO[];
		EMNPc   EMNP = null;
		EMSDc   EMSD[];
		EPTHc   EPTH[];
		Trigger Triggers[];
	};

}
