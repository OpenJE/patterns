// EPTHc — Path

#pragma once

import je.vector4;

namespace auto je::chunk {

	struct EPTH_Point {
		Vector4<float> p;
		padding[ 8 ];
	};

	struct EPTH : je::comp::Chunk<"EPTH"> {
		u8      name_length;
		u8      name_pad;
		char    name[ name_length ];
		u32     count;
		EPTH_Point points[ count ];
	};

}
