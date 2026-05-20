// GWAMc Pattern — Weapon Attack Mode (version-gated)

#pragma once

import std.string;
using SizedString = std::string::SizedString<u16>;

namespace auto je::chunk {

	struct GWAM : je::comp::Chunk<"GWAM"> {
		s32 anim;
		s32 dmg_type;
		s32 shots_fired;
		s32 f3;
		s32 f4;
		s32 f5;
		s32 range;
		s32 f7;
		s32 f8;
		s32 min_dmg;
		s32 max_dmg;
		u8 bool0;

		if (header.version != 0) {
			s32 f12;
			u8 bool1;
			s32 ap;
			u8 consumed;
			u8 thrown;
		}
		if (header.version >= 2) {
			s32 pose_override;
		}
		if (header.version >= 3) {
			s32 name_sr;
		}
		if (header.version >= 4) {
			SizedString veg_name;
		}
		if (header.version >= 5) {
			u8 byte31;
			u8 byte32;
		}
	};

}
