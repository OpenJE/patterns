// EMNPc Pattern

import je.vector3;

namespace auto je {

	struct EMNPChunk {
		u8      bool;
		Vector3 l;
		u8      b1;
		u8      b2;
		u8      b3;
		u8      b4;
		u8      b5;
	};

	struct EMNPc {
		EMNPChunk chunks[];
	};

}
