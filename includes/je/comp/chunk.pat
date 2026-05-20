// chunk — Van Buren Chunk Framing
// Reference: vb-pat.md (VBHeader), vb-table.md §9

#pragma once

import std.sys;
import std.mem;

namespace auto je::comp {

	// Standard 4-byte tag type matching Van Buren binary format
	using Tag = char[4];

	// VBHeader — chunk header: tag[4] + version[4] + size[4]
	struct ChunkHeader {
		char tag[4];   // "EMAP", "GENT", etc.
		u32 version;
		u32 size;      // total bytes including this 12-byte header
	};

	// VBHeaderSignedVersion — same as above but with signed s32 version
	// Reference: vb-pat.md line 29-33 (used by GWAM, GIAM, GIWP)
	struct ChunkHeaderSigned {
		char tag[4];
		s32 version;
		u32 size;
	};

	fn chunk_payload_size(ChunkHeader &h) {
		return h.size >= 12 ? h.size - 12 : 0;
	}

}
