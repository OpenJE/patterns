// EMEFc Pattern — Map Effect

#pragma once
#pragma endian little

import std.string;
import std.mem;

using SizedStringu16 = std::string::SizedString<u16>;
using Bytes8         = std::mem::Bytes<8>;

namespace auto je::chunk {

	struct EMEF : je::comp::Chunk<"EMEF"> {
		SizedStringu16 s1;
		Vector4f32     l;
		Bytes8         unknown_tail;
		u8             constant_1;
		SizedStringu16 s2;
		u8             b;
	};

}
