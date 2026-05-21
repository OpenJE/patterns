// ExTRc Pattern — Trigger Action (type-dispatched variant)
#pragma once

namespace auto je::chunk {

	// EBTR: trigger type "B" — fixed 19 bytes
	struct EBTR : je::comp::Chunk<"EBTR"> {
		char s[3];           // fixed write area at +12
		char constant_fff[3]; // "FFF" at +16
	};

	// ESTR: trigger type "S" — variable string, 18+sLen bytes
	struct ESTR : je::comp::Chunk<"ESTR"> {
		std::string::SizedString<u16> s;
		std::mem::Bytes<4> trailing_reserved;
	};

	// ETTR: trigger type "T" — variable string + constants, 16+sLen bytes
	struct ETTR : je::comp::Chunk<"ETTR"> {
		std::string::SizedString<u16> s;
		u8 constant_1a;
		u8 constant_1b;
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
	};

}
