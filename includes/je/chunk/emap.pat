// EMAP Pattern

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine EMAP Chunk
#pragma endian little

import std.string;
import type.byte;

import je.comp.argb;
import je.comp.chunk;

using String = std::string::SizedString<u16>;
using Byte   = type::Byte;

namespace auto je::chunk {

	struct EMAP : je::comp::Chunk<"EMAP"> {
		Byte            [ 4 ];
		String          s1;
		String          s2;
		String          s3;
		u16             _le;
		je::comp::ARGB8 color;
		Byte            [ 4 ];
		u32             constant_1;
		Byte            [ 13 ];
	};

}
