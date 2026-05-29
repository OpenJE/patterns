// GIWPc Pattern — Weapon Data (version-gated)

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine GIWP Chunk
#pragma endian little

import std.string;

import je.chunk.gwam;

using String = std::string::SizedString<u16>;

namespace auto je::chunk {

	struct GIWP : je::comp::Chunk<"GIWP"> {
		s32    weapon_class;
		s32    primary_caliber;
		s32    primary_reload_duration;
		s32    secondary_caliber;
		s32    secondary_reload_duration;
		String resource_name;
		s32    unknown_250;
		s32    primary_ammo_loaded;
		s32    primary_ammo_capacity;
		s32    secondary_ammo_loaded;
		s32    secondary_ammo_capacity;
		s32    unknown_255;
		s32    unknown_256;
		s32    attack_modes_count;

		if (header.version != 0) {
			s32 primary_modifier;
			s32 secondary_modifier;
		}

		GWAM   attack_modes[ attack_modes_count ];
	};

}
