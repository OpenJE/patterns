// ExTRc Pattern

#pragma once

namespace auto je::chunk {

	struct ExTR : je::comp::Chunk<"ExTR"> {
		char type[ 1 ];
		u8   s_length;
		char s[ s_length ];
	};

}
