// EME2c Pattern — Map Entity Placement

#pragma once
#pragma endian little

import std.string;
import std.mem;

import je.chunk.eeov;
import je.comp.vector4;

using SizedStringu16 = std::string::SizedString<u16>;
using Bytes8         = std::mem::Bytes<8>;

namespace auto je::chunk {

	struct EME2 : je::comp::Chunk<"EME2"> {
		SizedStringu16 name;
		Vector4f32     l;
		Bytes8         unknown_tail;
		u8             constant_1;
		EEOV           eeov;
	};

}
