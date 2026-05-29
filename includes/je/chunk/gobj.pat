// GOBJc Pattern — Object Type

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine GOBJ Chunk
#pragma endian little

import type.byte;

using Byte = type::Byte;

namespace auto je::chunk {

	struct GOBJ : je::comp::Chunk<"GOBJ"> {
		s32   type;                        // 0=USE, 1=DOR, 2=CON
		Byte  [ 24 ];  // reserved gap at end (24 bytes)
	};

}
