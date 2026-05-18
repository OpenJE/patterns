// stf — Van Buren String Table

#pragma once

namespace auto je {

	namespace auto stf {

		struct Header {
			u8  magic[ 8 ];
			u32 count;
		};

		struct Entry {
			u32 stringOffset;
			u32 stringLength;
			u8  constant[ 8 ];
		};

	}

	struct Stf {
		stf::Header header;
		stf::Entry  entries[ header.count ];
	};

}