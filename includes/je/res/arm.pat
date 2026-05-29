// ARM — Van Buren Armor File

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine ARM Resource
#pragma endian little

import je.chunk.een2;
import je.chunk.gent;
import je.chunk.gitm;
import je.chunk.giar;

namespace auto je::resource {

	struct ARM {
		EEN2 een2;
		GENT gent;
		GITM gitm;
		GIAR giar;
	};

}
