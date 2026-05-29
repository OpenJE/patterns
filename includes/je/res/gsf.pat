// gsf — Van Buren Text File (type 2000)
//
// Classification: plain UTF-8 text.
// No binary structure known; treated as raw text blob.

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine GSF Resource
#pragma endian little

namespace auto je::resource {

	struct GSF {
		char text[ std::mem::size() ];
	};

}
