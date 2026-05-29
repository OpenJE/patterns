// WEA — Van Buren Weapon File

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine WEA Resource
#pragma endian little

import je.chunk.een2;
import je.chunk.gent;
import je.chunk.gitm;
import je.chunk.giwp;

namespace auto je::resource {

	struct WEA {
		EEN2 een2;
		GENT gent;
		GITM gitm;
		GIWP giwp;
	};

}
