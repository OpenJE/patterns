// EME2c Pattern — Map Entity Placement

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine EME2 Chunk
#pragma endian little

import std.string;
import type.byte;

import je.chunk.eeov;
import je.comp.vector4;

using String = std::string::SizedString<u16>;
using Byte   = type::Byte;

namespace auto je::chunk {

	struct EME2 : je::comp::Chunk<"EME2"> {
		String     name;
		Vector4f32 l;
		Bytes      [ 8 ];
		u8         constant_1;
		EEOV       eeov;
	};

}
