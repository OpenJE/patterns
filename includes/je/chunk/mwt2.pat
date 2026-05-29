// 2MWT Pattern — Van Buren Water Chunk

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine MWT2 Chunk
#pragma endian little

import std.string;
import type.byte;

import je.comp.vector2;
import je.comp.vector3;

using String = std::string::SizedString<u16>;
using Byte   = type::Byte;


namespace auto je::chunk {

	struct MWT2Chunk {
		Vector3f32     loc;                          // Vector3 position (12 bytes)
		SizedStringu16 tex;                         // texture name
		Vector2f32     texloc;                       // UV coordinates (8 bytes)
	};

	struct MWT2 : je::comp::Chunk<"2MWT"> {
		String         mpf;                          // map file reference
		Byte           [ 13 ];        // gap after mpf string
		u8             not_dark;                              // inverse dark flag (bool)
		u8             unknown_28;                            // unknown byte
		u8             not_frozen;                            // inverse frozen flag (bool)
		Byte           [ 124 ];      // large gap before count
		s32            chunk_count;                          // number of water chunks
		MWT2Chunk      chunks[ chunk_count ];            // repeated MWT2Chunk records
	} [[name( "2MWT" )]];

}
