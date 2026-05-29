// Map — Van Buren Map File

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine MAP Resource
#pragma endian little

import je.chunk._2mwt;
import je.chunk.ecam;
import je.chunk.emap;
import je.chunk.eme2;
import je.chunk.emef;
import je.chunk.emep;
import je.chunk.emfg;
import je.chunk.emno;
import je.chunk.emnp;
import je.chunk.emsd;
import je.chunk.epth;
import je.comp.trigger;

namespace auto je::resource {

	struct MAP {
		MWT2  _2MWT;
		EMAP   EMAP;
		EME2   EME2[];
		EMEP   EMEP[];
		ECAM   ECAM;
		Trigger Triggers[];
		EPTH   EPTH[];
		EMSD   EMSD[];
		EMNP   EMNP;
		EMFG   EMFG;
		EMNO   EMNO[];
		EMEF   EMEF[];
	};

}
