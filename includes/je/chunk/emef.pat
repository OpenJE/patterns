// EMEFc Pattern — Map Effect
#pragma once
import std.string;
using SizedString = std::string::SizedString<u16>;

namespace auto je::chunk {

	struct EMEF : je::comp::Chunk<"EMEF"> {
		SizedString s1;
		Vector4Area24 l;   // 24-byte Vector4 area
		u8 constant_1;     // always 1
		SizedString s2;
		u8 b;              // trailing byte
	};

}
