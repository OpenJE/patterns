// EMSDc — Map Sound

#pragma once

import je.vector3;

namespace auto je::chunk {

	struct EMSD : je::comp::Chunk<"EMSD"> {
		u8             s1_length;
		u8             s1_pad;
		char           s1[ s1_length ];
		Vector3<float> l;
		u8             s2_length;
		u8             s2_pad;
		char           s2[ s2_length ];
		u8             trailing[ 2 ];
	};

}
