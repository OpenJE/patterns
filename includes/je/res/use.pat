// USE — Van Buren Usable Object File

#pragma once
#pragma endian little

import je.chunk.een2;
import je.chunk.gent;
import je.chunk.gobj;

namespace auto je::resource {

	struct USE {
		EEN2 een2;
		GENT gent;
		GOBJ gobj;
	};
}
