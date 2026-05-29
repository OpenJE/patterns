// GCHRc Pattern — Character Name String

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine GCHR Chunk
#pragma endian little

import std.string;

using String = std::string::SizedString<u16>;

namespace auto je::chunk {

	struct GCHR : je::comp::Chunk<"GCHR"> {
		String name;  // character/creature name string
	};

}
