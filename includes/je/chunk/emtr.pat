// EMTRc Pattern — Trigger Geometry

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine EMTR Chunk
#pragma endian little

import je.comp.vector3;

namespace auto je::chunk {

	struct EMTR : je::comp::Chunk<"EMTR"> {
		s32        n;
		s32        r_count;
		Vector3f32 r[ r_count ];
	};

}
