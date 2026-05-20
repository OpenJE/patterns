// EEOV Pattern — Inventory/Overlay Strings
#pragma once
import std.string;
import je.comp.chunk;
using SizedString = std::string::SizedString<u16>;

namespace auto je::chunk {

	struct EEOV : je::comp::Chunk<"EEOV"> {
		SizedString s1;

		std::mem::Bytes<11> gap_a;  // unknown fixed gap between s1 and s2
		SizedString s2;
		SizedString s3;

		std::mem::Bytes<9> gap_b;   // unknown fixed gap between s3 and s4
		SizedString s4;

		u8 ps4;

		if (ps4 == 2) {
			std::mem::Bytes<2> optional_ps4_gap;
		}

		SizedString s5;

		s32 inv_count;
		SizedString inventory[inv_count];
	};

}
