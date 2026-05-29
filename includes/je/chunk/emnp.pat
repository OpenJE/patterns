// EMNPc Pattern — Map Navpoint Chunks

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine EMNP Chunk
#pragma endian little

namespace auto je::chunk {

	namespace enmp {

		struct Chunk {

		}

	}

	struct EMNP : je::comp::Chunk<"EMNP"> {
		s32         chunk_count;
		enmp::Chunk chunks[ chunk_count ];
	};

}
