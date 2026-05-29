// psf — Van Buren Sound Configuration Text File (type 1900)
//
// Classification: plain UTF-8 text.
// No binary structure known; treated as raw text blob.

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine PSF Resource
#pragma endian little

namespace auto je::resource {

	struct PSF {
		char text[ std::mem::size() ];
	};

}
