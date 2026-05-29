// EEOV Pattern — Inventory/Overlay Strings

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine EEOV Chunk
#pragma endian little

import std.string;
import type.byte;

import je.comp.chunk;

using String = std::string::SizedString<u16>;
using Byte   = type::Byte;

namespace auto je::chunk {

	struct EEOV : je::comp::Chunk<"EEOV"> {
		String s1;

		Byte   [ 11 ];
		String s2;
		String s3;

		Byte   [ 9 ];
		String s4;

		u8     ps4;

		if ( ps4 == 2 ) {
			Byte [ 2 ];
		}

		String s5;

		s32    inv_count;
		String inventory[ inv_count ];
	};

}
