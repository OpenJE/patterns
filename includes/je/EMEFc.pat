// EMEFc Pattern

import je.vector4;

namespace auto je {

	struct EMEFc {
		u8      s1_length;
		char    s1[ s1_length ];
		Vector4 l;
		u8      s2_length;
		char    s2[ s2_length ];
		u8      b;
	};

}
