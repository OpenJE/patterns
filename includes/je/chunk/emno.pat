// EMNOc Pattern — Map Note/Node

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine EMNO Chunk
#pragma endian little

import std.string;
import type.byte;

using String = std::string::SizedString<u16>;
using Bytes  = type::Byte;

namespace auto je::chunk {

	struct EMNO : je::comp::Chunk<"EMNO"> {
		float  l_x;
		Byte   [ 4 ];  // gap between l.x and l.y
		float  l_y;
		String tex;
		s32    sr;
	};

}
