// EMSDc Pattern — Map Sound
#pragma once
import je.comp.vector3;
import std.string;
using SizedString = std::string::SizedString<u16>;

namespace auto je::chunk {

	struct EMSD : je::comp::Chunk<"EMSD"> {
		SizedString s1;
		Vector3f32 l;
		SizedString s2;
		u8 constant_1a;  // always 1
		u8 constant_1b;  // always 1
	};

}
