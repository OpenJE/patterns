// int — Van Buren GUI Screen Layout

#pragma once

import std.string;
import je.comp.vector2;

using SizedString = std::string::SizedString<u32>;

namespace auto je::resource {

	namespace int {

		struct Rect {
			Vector2<s32> p1, p2;
		};

		struct Fragment {
			s32  tileMode;
			s32  i_32;
			s32  i_36;
			s32  i_40;
			s32  i_44;
			s32  i_48;
			SizedString texture;
			u32  vtxTint;
			u32  tint;
			Rect rect;
		};

		struct LabelBlock {
			s32  stringRef;
			SizedString font;
			s32  padInt;
			s32  fontSize;
			s32  flag;
			u32  color;
			u8   byte3432;
			u8   byte3433;
			s32  justifyInt;
			s32  int3612;
			s32  int3616;
			s32  int3620;
			s32  int3624;
			s32  versionExtra;
		};

		struct StringListEntry {
			s32  slot;
			SizedString value;
		};

		struct Object {
			s32  magic;

			if (magic == 1) {
				if (revision >= '3') {
					u8  buttonPrefix[ 5 ];
					SizedString soundDown;
					SizedString soundUp;
					SizedString soundHover;
				} else {
					s32 buttonRev12Int;
				}
			}

			Rect rect1;
			SizedString name;
			u8   postName3[ 3 ];
			SizedString ini;
			u32  colorTint;
			Rect rect2;

			if (revision >= '1') {
				u8   v2Byte;
				s32  v2Int;
			}

			if (revision >= '2') {
				SizedString v3Str1;
				s32  v3Int1;
				SizedString v3Str2;
				s32  v3Int2;
				SizedString v3Str3;
			}

			Fragment fragments[ 9 ];

			// Optional string-list trailer: sentinel-loop until -1
			// ImHex cannot express sentinel loops; left as raw bytes

			s32  childCount;
			// Object children[ childCount ]; // Recursive — omitted

			if (magic == 3 || magic == 4) {
				LabelBlock labelBlock;
			}
		};

	}

	struct Int {
		char     signature[ 7 ];
		u8       revisionByte;
		s32      nameLength;
		char     name[ nameLength ];
		u8       headerPad;
		s32      numObjects;
		int::Object objects[ numObjects ];
	};

}
