// DOR — Van Buren Door File

#pragma once

import je.EEN2c;
import je.GENTc;
import je.GOBJc;

namespace auto je {

	struct DOR {
		EEN2c EEN2;
		GENTc GENT;
		GOBJc GOBJ;
		char  GDOR_tag[ 4 ];
		u32   GDOR_version;
		u32   GDOR_size;
		u8    GDOR_payload[ 12 ];
	};

}