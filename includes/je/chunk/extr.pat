// ExTRc Pattern — Trigger Action (type-dispatched variant)

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine EBTR Chunk
#pragma endian little

import std.string;
import type.byte;

using String = std::string::SizedString<u16>;
using Byte   = type::Byte;

namespace auto je::chunk {

	// EBTR: trigger type "B" — fixed 19 bytes
	struct EBTR : je::comp::Chunk<"EBTR"> {
		char s[ 3 ];           // fixed write area at +12
		char constant_fff[ 3 ]; // "FFF" at +16
	};

	// ESTR: trigger type "S" — variable string, 18+sLen bytes
	struct ESTR : je::comp::Chunk<"ESTR"> {
		String s;
		Byte   [ 4 ];
	};

	// ETTR: trigger type "T" — variable string + constants, 16+sLen bytes
	struct ETTR : je::comp::Chunk<"ETTR"> {
		String s;
		u8     constant_1a;
		u8     constant_1b;
	};

	// ExTR: dispatcher — matches tag to dispatch to correct variant
	struct ExTR {
		u32 tag = std::mem::read_unsigned($, 4, std::mem::Endian::Little);
		match (tag) {
			("EBTR"): EBTR ebtr;
			("ESTR"): ESTR estr;
			("ETTR"): ETTR ettr;
			(_): {}
		}
	} [[inline]];

}
