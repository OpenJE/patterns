// GIAMc Pattern — Ammo Stats (version-gated)

#pragma once
#pragma endian little

namespace auto je::chunk {

	struct GIAM : je::comp::Chunk<"GIAM"> {
		s32 caliber;
		s32 ammo_extra_238;
		s32 damage_bonus;
		s32 dr_penalty;
		s32 skill_bonus;

		if (header.version >= 1) {
			s32 damage_type;
			s32 ammo_category;
		}
		if (header.version >= 2) {
			s32 ammo_modifier;
			s32 range_bonus;
		}
	};

}
