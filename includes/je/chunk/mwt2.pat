// _2MWTc — Van Buren Water Chunk

#pragma once

import je.vector2;
import je.vector3;

namespace auto je::chunk {

	struct MWT2Chunk {
		Vector3f32                    p3;
		std::string::SizedString<u16> tex;
		Vector2f32                    texloc;
	};

	struct MWT2 : je::comp::Chunk<"2MWT"> {
		u8         mpf_length;
		char       mpf[ mpf_length ];
		u8         dark;
		u8         frozen;
		u32        count;
		_2MWTChunk chunks[ count ];
	};

}
