// EMAP Pattern

#pragma once

import je.comp.argb;
import je.comp.chunk;


namespace auto je::chunk {

	struct EMAP : je::comp::Chunk<"EMAP"> {
		std::mem::Bytes<4>            unknown_12_15; // 0 - 4
		std::string::SizedString<u16> s1;            // 4 - 6 + s1.length
		std::string::SizedString<u16> s2;            //
		std::string::SizedString<u16> s3;            //
		u16                           _le;           //
		je::comp::ARGB8               color;         //
		std::mem::Bytes<4>            unknown_28_32; //
		u32 constant_1;
		std::mem::Bytes<13> trailing_reserved;
	};

}
