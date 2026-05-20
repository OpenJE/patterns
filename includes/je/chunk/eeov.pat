// EEOV Pattern

#pragma once

import std.string;

using SizedString = std::string::SizedString<u16>;

namespace je::chunk::eeov {

	struct InventoryEntry {
		u8   length;
		u8   pad;
		char value[ length ];
	};

}

namespace auto je::chunk {

	struct EEOV : je::comp::Chunk<"EEOV"> {
		SizedString s1;

		padding[ 9 ];
		SizedString s2;

		SizedString s3;

		padding[ 7 ];
		SizedString s4;

		u8 ps4;

		if ( ps4 == 2 ) {
			u8 ps4_extra[ 2 ];
		}

		SizedString s5;

		u32 inv_count;
		eeov::InventoryEntry inv[ inv_count ];
	};

}
