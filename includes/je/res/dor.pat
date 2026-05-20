// DOR — Van Buren Door File
#pragma once
import je.chunk.een2;
import je.chunk.gent;
import je.chunk.gobj;
import std.mem;

namespace auto je::resource {
	struct DOR {
		EEN2 een2;
		GENT gent;
		GOBJ gobj;
		std::mem::Bytes<12> gdor_payload;  // GDOR static zeros (tag+ver+size already in GOBJ)
	};
}
