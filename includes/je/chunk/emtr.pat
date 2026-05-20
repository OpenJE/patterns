// EMTRc — Trigger Geometry

#pragma once

import je.vector3;

namespace auto je::chunk {

	struct EMTR : je::comp::Chunk<"EMTR"> {
		u32            n;
		u32            count;
		Vector3<float> r[ count ];
	};

}
