// EME2c Pattern — Map Entity Placement
#pragma once
import std.string;
using SizedString = std::string::SizedString<u16>;
import je.chunk.eeov;
import je.comp.vector4;

namespace auto je::chunk {

	struct EME2 : je::comp::Chunk<"EME2"> {
		SizedString name;
		Vector4Area24 l;    // 24-byte Vector4 area
		u8 constant_1;      // always 1, per reference
		EEOV EEOV;          // embedded EEOV chunk
	};

}
