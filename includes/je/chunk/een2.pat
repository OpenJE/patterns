// EEN2 — Entity Visual/Inventory Strings

#pragma once
#pragma endian little

import std.string;
import std.mem;

import je.comp.chunk;
import je.chunk.eeov;

using SizedStringu16 = std::string::SizedString<u16>;
using Bytes8         = std::mem::Bytes<8>;

namespace auto je::chunk {

	struct EEN2 : je::comp::Chunk<"EEN2"> {
		SizedStringu16 skl;
		SizedStringu16 invtex;
		SizedStringu16 acttex;
		u8             sel;
		u8             post_sel_gap[ 3 ];
		EEOV           eeov;
	};

}
