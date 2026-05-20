// EMNOc Pattern

#pragma once

import je.vector2;

namespace auto je::chunk {

	struct EMNO : je::comp::Chunk<"EMNO"> {
		Vector2<float> l;
		u8             tex_length;
		char           tex[ tex_length ];
		u32            sr;
	};

}
