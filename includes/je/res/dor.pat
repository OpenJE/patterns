// DOR — Van Buren Door File
#pragma once
#pragma endian little

import je.chunk.een2;
import je.chunk.gent;
import je.chunk.gobj;
import std.mem;

using Bytes12 = std::mem::Bytes<12>;

namespace auto je::resource {
	struct DOR {
		EEN2 een2;
		GENT gent;
		GOBJ gobj;
		Bytes12 gdor_payload;  // GDOR static zeros (tag+ver+size already in GOBJ)
	};
}
