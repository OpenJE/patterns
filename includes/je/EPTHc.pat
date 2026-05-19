// EPTHc — Path

#pragma once

import je.vector4;

namespace auto je {

	struct EPTH_Point {
		Vector4<float> p;
		padding[ 8 ];
	};

	struct EPTHc {
		u8      name_length;
		u8      name_pad;
		char    name[ name_length ];
		u32     count;
		EPTH_Point points[ count ];
	};

}
