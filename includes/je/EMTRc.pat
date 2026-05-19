// EMTRc — Trigger Geometry

#pragma once

import je.vector3;

namespace auto je {

	struct EMTRc {
		u32            n;
		u32            count;
		Vector3<float> r[ count ];
	};

}
