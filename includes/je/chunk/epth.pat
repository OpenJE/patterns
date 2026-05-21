// EPTHc — Path

#pragma once

import je.comp.vector4;

using SizedString = std::string::SizedString<u16>;

namespace auto je::chunk {

	struct EPTH_Point {
		Vector4<float> p;
		padding[ 8 ];
	};

	struct EPTH : je::comp::Chunk<"EPTH"> {
		SizedString name;
		s32 point_count;
		EPTH_Point points[point_count];
	};

}
