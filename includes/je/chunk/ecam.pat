// ECAM — Camera Chunk

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine ECAM Chunk
#pragma endian little

import je.comp.chunk;
import je.comp.vector4;

namespace auto je::chunk {

	struct ECAM : je::comp::Chunk<"ECAM"> {
		Vector4f32 p;
	};

}
