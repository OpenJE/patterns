// EMEPc Pattern — Map Entry Point
#pragma once
import std.mem;

namespace auto je::chunk {

	struct EMEP : je::comp::Chunk<"EMEP"> {
		s32 index;
		std::mem::Bytes<57> unknown_16_72;  // gap between index and p
		Vector3f32 p;                        // Vector3 position
		std::mem::Bytes<20> unknown_85_104;  // gap after p
		float r;                             // rotation
	};

}
