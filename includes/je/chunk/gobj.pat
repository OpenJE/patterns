// GOBJc Pattern — Object Type
#pragma once
import std.mem;

namespace auto je::chunk {

	struct GOBJ : je::comp::Chunk<"GOBJ"> {
		s32 type;                        // 0=USE, 1=DOR, 2=CON
		std::mem::Bytes<24> unknown_16_39;  // reserved gap at end (24 bytes)
	};

}
