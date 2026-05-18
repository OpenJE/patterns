// grp — Van Buren Group Archive

#pragma once

namespace auto je {

	namespace auto grp {

		struct Header {
			u32 vMajor;
			u32 vMinor;
			u32 nFiles;
		};

		struct Lump {
			u32 offset;
			u32 length;
		};

	}

	struct GRP {
		grp::Header header;
		grp::Lump   lumps[ header.nFiles ];
	};

}