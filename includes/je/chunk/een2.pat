// EEN2 — Entity Visual/Inventory Strings

#pragma once

import je.chunk.eeov;
import std.string;

namespace auto je::chunk {

	using SizedString = std::string::SizedString<u16>;

	struct EEN2 : je::comp::Chunk<"EEN2"> {
		SizedString skl;
		SizedString invtex;
		SizedString acttex;
		u8      sel;
		u8      PostSelGap[ 3 ];
		EEOV    EEOV;
	};

}
