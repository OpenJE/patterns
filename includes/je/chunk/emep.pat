// EMEPc Pattern — Map Entry Point

#pragma once
#pragma endian little

import je.comp.vector3;
import std.mem;

using Bytes57 = std::mem::Bytes<57>;
using Bytes20 = std::mem::Bytes<20>;

namespace auto je::chunk {

	struct EMEP : je::comp::Chunk<"EMEP"> {
		s32        index;
		Bytes57    unknown_16_72;  // gap between index and p
		Vector3f32 p;                        // Vector3 position
		Bytes20    unknown_85_104;  // gap after p
		float      r;                             // rotation
	};

}
