// EMEPc — Map Entry Point

#pragma once

import je.vector3;

namespace auto je {

	struct EMEPc {
		u8             index;
		padding[ 60 ];
		Vector3<float> p;
		padding[ 20 ];
		float          r;
	};

}
