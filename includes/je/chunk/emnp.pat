// EMNPc — Map Navpoint Chunks

#pragma once

import std.mem;

import je.vector3;

namespace auto je::chunk {


	struct EMNPChunk {
		u8                  enabled;
		Vector3f32          l;
		std::mem::Bytes<12> unknown_13_24;
		u8                  b1;
		u8                  b2;
		u8                  b3;
		u8                  b4;
		u8                  b5;
	};

	struct EMNP : je::comp::Chunk<"EMNP"> {
		u32       count;
		EMNPChunk chunks[ count ];
	};

}
