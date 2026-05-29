// ARGB

#pragma once
#pragma endian little

namespace auto je::comp {

	struct ARGB {
		u8 a [[color("070707")]];
		u8 r [[color("FF0000")]];
		u8 g [[color("00FF00")]];
		u8 b [[color("0000FF")]];
	} [[static, color( std::format( "{:02X}{:02X}{:02X}{:02X}", a, r, g, b ) )]];

	using ARGB8 = ARGB;

}
