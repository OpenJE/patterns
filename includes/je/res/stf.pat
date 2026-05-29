// stf — Van Buren String Table

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine STF Resource
#pragma endian little

namespace auto je::resource {

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

	struct STF {
		stf::Header header;
		stf::Entry  entries[ header.count ];
	};

}
