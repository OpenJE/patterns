// EEOV Pattern — Inventory/Overlay Strings

#pragma once
#pragma endian little

import std.string;
import std.mem;

import je.comp.chunk;

using SizedStringu16 = std::string::SizedString<u16>;
using Bytes2         = std::mem::Bytes<2>;
using Bytes9         = std::mem::Bytes<9>;
using Bytes11        = std::mem::Bytes<11>;

namespace auto je::chunk {

	struct EEOV : je::comp::Chunk<"EEOV"> {
		SizedStringu16 s1;

		Bytes11        gap_a;
		SizedStringu16 s2;
		SizedStringu16 s3;

		Bytes9         gap_b;
		SizedStringu16 s4;

		u8             ps4;

		if ( ps4 == 2 ) {
			Bytes2     optional_ps4_gap;
		}

		SizedStringu16 s5;

		s32            inv_count;
		SizedStringu16 inventory[inv_count];
	};

}
