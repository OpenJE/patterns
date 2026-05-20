// CON — Van Buren Container File
#pragma once
import je.chunk.een2;
import je.chunk.gent;
import je.chunk.gobj;
import std.mem;

namespace auto je::resource {
	struct CON {
		EEN2 een2;
		GENT gent;
		GOBJ gobj;
		std::mem::Bytes<15> gcon_payload;  // GCON static zeros (tag+ver+size already in GOBJ)
	};
}
