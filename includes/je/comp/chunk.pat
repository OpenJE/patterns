// chunk — Van Buren Chunk Framing

#pragma once

import std.sys;

import je.comp.tag;

namespace auto je::comp {

	using Tag = char[ 4 ];

	struct ChunkHeader<auto Tag> {
		Tag tag;
		std::assert( header == "ECAM", "ECAM header mismatch!: ${header} != ECAM" );
		u32 version;
		u32 size;
	};

	fn chunk_payload_size(ChunkHeader &h) {
		return h.size >= 12 ? h.size - 12 : 0;
	}

}
