// rle — Van Buren RLE Image

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine RLE Resource
#pragma endian little

namespace auto je::resource {

	struct RLE_Run {
		s32 count;
		u8  gray;
	};

	struct RLE {
		s32       width;
		s32       height;
		RLE_Run   runs[ while( !std::mem::eof() ) ];
	};

}
