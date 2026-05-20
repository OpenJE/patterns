// grp — Van Buren Group Archive

#pragma once

import std.core;
import je.file.rht;

namespace auto je::file::grp {

	struct Header {
		u32 vMajor;
		u32 vMinor;
		u32 nFiles;
	};

	struct Lump {
		u32 offset;
		u32 length;
		u8  data[ length ] @ offset;
	};

}

namespace auto je::file {

	struct GRP {
		grp::Header header;
		grp::Lump   lumps[ header.nFiles ];
	};

}
