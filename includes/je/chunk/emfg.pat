// EMFGc Pattern — Fog Volume

#pragma once
#pragma endian little

import std.mem;

using Bytes24 = std::mem::Bytes<24>;

namespace auto je::chunk {

	struct EMFG : je::comp::Chunk<"EMFG"> {
		u8         enabled;
		type::RGB8 colour;
		float      base_height;
		float      anim1Speed;
		float      anim1Height;
		float      total_height;
		float      anim2Speed;
		float      anim2Height;
		float      verticalOffset;
		float      max_fog_density;
		Bytes24    unknown_48_71;  // reserved gap at end
	};

}
