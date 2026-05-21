// pce — Van Buren Sound Text File 2 (type 2300)
//
// Classification: plain UTF-8 text.
// No binary structure known; treated as raw text blob.

#pragma once
#pragma endian little

namespace auto je::resource {

	struct PCE {
		char text[ std::mem::size() ];
	};

}
