// AMO — Van Buren Ammo File

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine AMO Resource
#pragma endian little

import je.chunk.een2;
import je.chunk.gent;
import je.chunk.gitm;
import je.chunk.giam;

namespace auto je::resource {

	struct AMO {
		EEN2 een2;
		GENT gent;
		GITM gitm;
		GIAM giam;
	};

}
