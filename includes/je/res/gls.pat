// gls — Van Buren Group List Text File (type 2100)
//
// Classification: plain UTF-8 text.
// No binary structure known; treated as raw text blob.

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine GLS Resource
#pragma endian little

namespace auto je::resource {

	struct GLS {
		char text[ std::mem::size() ];
	};

}
