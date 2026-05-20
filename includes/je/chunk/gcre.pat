// GCREc — Creature Record

#pragma once

import je.GWAMc;
import je.skill;
import je.socket;

namespace auto je::chunk {

	struct GCRE : je::comp::Chunk<"GCRE"> {
		u32    Special[ 7 ];
		u32    Age;
		u32    Skills_count;
		Skill  Skills[ Skills_count ];
		u32    Traits_count;
		u32    Traits[ Traits_count ];
		u32    TagSkills_count;
		u32    TagSkills[ TagSkills_count ];
		u16    PortStr_length;
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
		u16    Inventory_count;
	};

}
