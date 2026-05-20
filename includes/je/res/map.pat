// Map — Van Buren Map File

#pragma once

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
		EMAPc   EMAP;
		EME2c   EME2[];
		EMEPc   EMEP[];
		ECAMc   ECAM;
		_2MWTc  _2MWT;
		Trigger Triggers[];
		EPTHc   EPTH[];
		EMSDc   EMSD[];
		EMNPc   EMNP;
		EMFGc   EMFG;
		EMNOc   EMNO[];
		EMEFc   EMEF[];
	};

}