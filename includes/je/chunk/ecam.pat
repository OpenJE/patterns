// ECAM — Camera Chunk
#pragma once
import std.mem;

namespace auto je::chunk {
	struct ECAM : je::comp::Chunk<"ECAM"> {
		Vector4f32 p;  // standard 16-byte Vector4 (ECAM total=28 bytes)
	};
}
