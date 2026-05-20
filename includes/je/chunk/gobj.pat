// GOBJc Pattern

#pragma once

namespace auto je::chunk {

	struct GOBJ : je::comp::Chunk<"GOBJ"> {
		u8 Type;
	};

}
