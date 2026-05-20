// CON — Van Buren Container File

#pragma once

import je.EEN2c;
import je.GENTc;
import je.GOBJc;

namespace auto je {

	struct CON {
		EEN2c EEN2;
		GENTc GENT;
		GOBJc GOBJ;
		char  GCON_tag[ 4 ];
		u32   GCON_version;
		u32   GCON_size;
		u8    GCON_payload[ 15 ];
	};

}