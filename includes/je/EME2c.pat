// EME2c — Map Entity Placement

#pragma once

import je.EEOVc;
import je.vector4;

namespace auto je {

	struct EME2c {
		u8             name_length;
		u8             name_pad;
		char           name[ name_length ];
		Vector4<float> l;
		u8             PostLGap[];
		EEOVc          EEOV;
	};

}
