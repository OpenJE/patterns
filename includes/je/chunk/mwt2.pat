// _2MWTc Pattern — Van Buren Water Chunk
#pragma once
import je.comp.vector2;
import je.comp.vector3;
import std.string;
import std.mem;

using SizedString = std::string::SizedString<u16>;
using Bytes13     = std::mem::Bytes<13>;
using Bytes124    = std::mem::Bytes<124>;

namespace auto je::chunk {

	struct MWT2Chunk {
		Vector3f32 loc;                          // Vector3 position (12 bytes)
		SizedString tex;                         // texture name
		Vector2f32 texloc;                       // UV coordinates (8 bytes)
	};

	struct MWT2 : je::comp::Chunk<"2MWT"> {
		SizedString mpf;                          // map file reference
		Bytes13 unknown_14_26;        // gap after mpf string
		u8 not_dark;                              // inverse dark flag (bool)
		u8 unknown_28;                            // unknown byte
		u8 not_frozen;                            // inverse frozen flag (bool)
		Bytes124 unknown_30_153;      // large gap before count
		s32 chunk_count;                          // number of water chunks
		MWT2Chunk chunks[chunk_count];            // repeated MWT2Chunk records
	};

}
