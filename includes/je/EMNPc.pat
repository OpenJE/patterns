// EMNPc — Map Navpoint Chunks

#pragma once

import je.vector3;

namespace auto je {

	struct EMNPChunk {
		u8             a1;
		Vector3<float> l;
		u8             b1;
		u8             b2;
		u8             b3;
		u8             b4;
		u8             b5;
	};

	struct EMNPc {
		u32       count;
		EMNPChunk chunks[ count ];
	};

}
