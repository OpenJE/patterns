// EPTHc — Path

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine EPTH Chunk
#pragma endian little

import std.string;
import type.byte;

import je.comp.vector4;

using String = std::string::SizedString<u16>;
using Byte   = type::Byte;

namespace auto je::chunk {

	namespace epth {

		struct Point {
			Vector4f32 p;
			Byte       [ 8 ];
		};

	}

	struct EPTH : je::comp::Chunk<"EPTH"> {
		String      name;
		s32         point_count;
		epth::Point points[ point_count ];
	};

}
