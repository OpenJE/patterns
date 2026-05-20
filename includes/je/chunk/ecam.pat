// ECAM — Camera Chunk

#pragma once
#pragma endian little

import std.sys;

import je.vector4;

namespace auto je::chunk {

	struct ECAM : je::comp::Chunk<"ECAM"> {
		je::Vector4f32 vector4;
	};

}
