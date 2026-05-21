// EMAP Pattern

#pragma once
#pragma endian little

import std.string;
import std.mem;

import je.comp.argb;
import je.comp.chunk;

using SizedStringu16 = std::string::SizedString<u16>;
using Bytes4         = std::mem::Bytes<4>;
using Bytes13        = std::mem::Bytes<13>;

namespace auto je::chunk {

	struct EMAP : je::comp::Chunk<"EMAP"> {
		Bytes4          unknown_12_15;
		SizedStringu16  s1;
		SizedStringu16  s2;
		SizedStringu16  s3;
		u16             _le;
		je::comp::ARGB8 color;
		Bytes4          unknown_28_32;
		u32             constant_1;
		Bytes13         trailing_reserved;
	};

}
