// sco — Van Buren Sound Text File (type 2200)
//
// Classification: plain UTF-8 text.
// No binary structure known; treated as raw text blob.

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine SCO Resource
#pragma endian little

namespace auto je::resource {

	struct SCO {
		char text[ std::mem::size() ];
	};

}
