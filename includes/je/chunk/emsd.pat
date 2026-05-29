// EMSDc Pattern — Map Sound

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine EMSD Chunk
#pragma endian little

import std.string;

import je.comp.vector3;

using String = std::string::SizedString<u16>;

namespace auto je::chunk {

	struct EMSD : je::comp::Chunk<"EMSD"> {
		String     s1;
		Vector3f32 l;
		String     s2;
		u8         constant_1a;  // always 1
		u8         constant_1b;  // always 1
	};

}
