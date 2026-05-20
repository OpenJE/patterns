// EMEPc — Map Entry Point

#pragma once

import je.vector3;

namespace auto je::chunk {

	struct EMEP : je::comp::Chunk<"EMEP"> {
		u8             index;
		padding[ 60 ];
		Vector3<float> p;
		padding[ 20 ];
		float          r;
	};

}
