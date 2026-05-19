// _2MWTc — Van Buren Water Chunk

#pragma once

import je.vector2;
import je.vector3;

namespace auto je {

	struct _2MWTChunk {
		Vector3<float> p3;
		u8             tex_length;
		char           tex[ tex_length ];
		Vector2<float> texloc;
	};

	struct _2MWTc {
		u8         mpf_length;
		char       mpf[ mpf_length ];
		u8         dark;
		u8         frozen;
		u32        count;
		_2MWTChunk chunks[ count ];
	};

}
