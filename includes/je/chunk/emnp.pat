// EMNPc Pattern — Map Navpoint Chunks
#pragma once
import std.mem;

namespace auto je::chunk {
	struct EMNP : je::comp::Chunk<"EMNP"> {
		s32 chunk_count;
		EMNPChunk chunks[chunk_count];
	};
}
