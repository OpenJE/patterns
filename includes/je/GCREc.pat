// GCREc Pattern

import je.GWAMc;
import je.socket;
import je.skill;

namespace auto je {

	struct GCREc {
		u8     Special[ 7 ];
		u8     Age;
		Skill  Skills[];
		u8     Traits[];
		u8     TagSkills[];
		u8     PortStr_length;
		char   PortStr[ PortStr_length ];
		Socket Hea;
		Socket Hai;
		Socket Pon;
		Socket Mus;
		Socket Bea;
		Socket Eye;
		Socket Bod;
		Socket Han;
		Socket Fee;
		Socket Bac;
		Socket Sho;
		Socket Van;
		char   Inventory[][];
		GWAMc  GWAM[];
	};

}
