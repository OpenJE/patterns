// chunk — Van Buren Chunk Framing
// Reference: vb-pat.md (VBHeader), vb-table.md §9

#pragma once
#pragma endian little

import std.sys;
import std.mem;

namespace auto je::comp {

	// Standard 4-byte tag type matching Van Buren binary format
	using Tag = char[4];

	// VBHeader — chunk header: tag[4] + version[4] + size[4]
	struct ChunkHeader {
		Tag tag;   // "EMAP", "GENT", etc.
		u32 version;
		u32 size;      // total bytes including this 12-byte header
	};

	fn chunk_payload_size(ChunkHeader &h) {
		return h.size >= 12 ? h.size - 12 : 0;
	}

}
