// chunk — Van Buren Chunk Framing

#pragma once

namespace auto je {

	struct ChunkHeader {
		char tag[4];
		u32  version;
		u32  size;
	};

	fn chunk_payload_size(ChunkHeader &h) {
		return h.size >= 12 ? h.size - 12 : 0;
	}

	struct PString8 {
		u8   len;
		char val[len];
	};

	struct PString16 {
		u16  len;
		char val[len];
	};

	struct PString32 {
		u32  len;
		char val[len];
	};

}