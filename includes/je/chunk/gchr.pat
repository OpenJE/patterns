// GCHRc Pattern

#pragma once

namespace auto je::chunk {

	struct GCHR : je::comp::Chunk<"GCHR"> {
		u8   name_length;
		char name[ name_length ];
	};

}
