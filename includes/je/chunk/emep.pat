// EMEPc Pattern — Map Entry Point

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine EMEP Chunk
#pragma endian little

import type.byte;

import je.comp.vector3;

using Byte = type::Byte;

namespace auto je::chunk {

	struct EMEP : je::comp::Chunk<"EMEP"> {
		s32        index;
		Bytes      [ 57 ];  // gap between index and p
		Vector3f32 p;                        // Vector3 position
		Bytes      [ 20 ];  // gap after p
		float      r;                             // rotation
	};

}
