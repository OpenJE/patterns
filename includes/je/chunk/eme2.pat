// EME2 — Map Entity Placement

#pragma once

import je.EEOV;
import je.vector4;

namespace auto je::chunk {

	struct EME2 : je::comp::Chunk<"EME2"> {
		u8             name_length;
		u8             name_pad;
		char           name[ name_length ];
		Vector4<float> l;
		u8             PostLGap[];
		EEOV           EEOV;
	};

}
