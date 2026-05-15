// _2MWTc Pattern

import je.vector3;
import je.vector2;

namespace auto je {

	struct _2MWTChunk {
		Vector3 p3;
		char    tex[];
		Vector2 texloc;
	};

	struct _2MWTc {
		_2MWTChunk chunks[];
		bool       dark;
		bool       frozen;
		char       mpf[];
	};

}
