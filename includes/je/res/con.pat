// CON — Van Buren Container File
#pragma once
import je.chunk.een2;
import je.chunk.gent;
import je.chunk.gobj;
import std.mem;

using Bytes15 = std::mem::Bytes<15>;

namespace auto je::resource {
	struct CON {
		EEN2 een2;
		GENT gent;
		GOBJ gobj;
		// GCON static zeros. Note: spec says size field = 26 but literal data is 27 bytes (header + 15 zero bytes). Pattern uses Bytes<15> matching actual declared type in vb-pat.md.
		Bytes15 gcon_payload;
	};
}
