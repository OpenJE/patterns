// EMNOc Pattern — Map Note/Node
#pragma once
#pragma endian little

import std.mem;
import std.string;
using SizedString = std::string::SizedString<u16>;
using Bytes4      = std::mem::Bytes<4>;

namespace auto je::chunk {

	struct EMNO : je::comp::Chunk<"EMNO"> {
		float l_x;
		Bytes4 unknown_16_19;  // gap between l.x and l.y
		float l_y;
		SizedString tex;
		s32 sr;
	};

}
