// GWAMc Pattern

#pragma once

namespace auto je::chunk {

	struct GWAM : je::comp::Chunk<"GWAM"> {
		u32  Anim;
		u32  DmgType;
		u32  ShotsFired;
		u32  Range;
		u32  MinDmg;
		u32  MaxDmg;
		u32  AP;
		u32  NameSR;
		u8   VegName_length;
		char VegName[ VegName_length ];
	};

}
