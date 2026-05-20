// GIAMc Pattern

#pragma once

namespace auto je::chunk {

	struct GIAM : je::comp::Chunk<"GIAM"> {
		u32 ammoType;
		u32 minDmg;
		u32 maxDmg;
		u32 unk1;
		u32 critChance;
		u32 engUnk1;
		u32 unk2;
		u32 unk3;
	};

}
