// EEN2 — Entity Visual/Inventory Strings

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine EEN2 Chunk
#pragma endian little

import std.string;
import type.byte;

import je.comp.chunk;
import je.chunk.eeov;

using String = std::string::SizedString<u16>;
using Byte   = type::Byte;

namespace auto je::chunk {

	struct EEN2 : je::comp::Chunk<"EEN2"> {
		String skl;
		String invtex;
		String acttex;
		u8     sel;
		Byte   [ 3 ];
		EEOV   eeov;
	};

}
