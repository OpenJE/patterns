// EME2c Pattern

import je.EEOVc;

namespace auto je {

	struct EME2c {
		u8      name_length;
		char    name[ name_length ];
		Vector4 l;
		EEOVc   EEOV;
	};

}
