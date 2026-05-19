// grp — Van Buren Group Archive

#pragma once

import std.core;
import je.rht;
import je.EMAPc;

namespace auto je {

	namespace grp {

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
