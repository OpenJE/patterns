// EMSDc Pattern — Map Sound

#pragma once
#pragma endian little

import std.string;

import je.comp.vector3;

using SizedStringu16 = std::string::SizedString<u16>;

namespace auto je::chunk {

	struct EMSD : je::comp::Chunk<"EMSD"> {
		SizedStringu16 s1;
		Vector3f32     l;
		SizedStringu16 s2;
		u8             constant_1a;  // always 1
		u8             constant_1b;  // always 1
	};

}
