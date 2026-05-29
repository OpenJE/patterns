// EMEFc Pattern — Map Effect

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine EMEF Chunk
#pragma endian little

import std.string;
import type.byte;

using String = std::string::SizedString<u16>;
using Byte   = type::Byte;

namespace auto je::chunk {

	struct EMEF : je::comp::Chunk<"EMEF"> {
		String     s1;
		Vector4f32 l;
		Byte       [ 8 ];
		u8         constant_1;
		String     s2;
		u8         b;
	};

}
