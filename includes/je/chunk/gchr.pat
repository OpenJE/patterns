// GCHRc Pattern — Character Name String
#pragma once
#pragma endian little

import std.string;
using SizedString = std::string::SizedString<u16>;

namespace auto je::chunk {

	struct GCHR : je::comp::Chunk<"GCHR"> {
		SizedString name;  // character/creature name string
	};

}
