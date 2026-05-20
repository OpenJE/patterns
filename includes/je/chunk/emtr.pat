// EMTRc Pattern — Trigger Geometry
#pragma once
import std.mem;

namespace auto je::chunk {
	struct EMTR : je::comp::Chunk<"EMTR"> {
		s32 n;
		std::mem::Bytes<4> unknown_16_19;  // gap between n and r_count (if needed)
		s32 r_count;
		Vector3f32 r[r_count];
	};
}
