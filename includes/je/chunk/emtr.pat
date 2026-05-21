// EMTRc Pattern — Trigger Geometry
#pragma once
import std.mem;

namespace auto je::chunk {
	struct EMTR : je::comp::Chunk<"EMTR"> {
		s32 n;
		s32 r_count;
		Vector3f32 r[r_count];
	};
}
