// GCHRc Pattern — Character Name String

#pragma once
#pragma endian little

import std.string;

using SizedStringu16 = std::string::SizedString<u16>;

namespace auto je::chunk {

	struct GCHR : je::comp::Chunk<"GCHR"> {
		SizedStringu16 name;  // character/creature name string
	};

}
