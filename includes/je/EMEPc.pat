// EMEPc — Map Entry Point

#pragma once

import je.vector3;

namespace auto je {

	struct EMEPc {
		u8      index;
		u8      pad0[ 60 ];
		Vector3 p;
		u8      pad1[ 20 ];
		float   r;
	};

}
