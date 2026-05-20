// veg — Van Buren Visual Effects File

#pragma once
#pragma endian little

namespace auto je {

	namespace veg {

		struct Property {
			u16  nameLength;
			char name[ nameLength ];

			u16  typeLength;
			char type[ typeLength ];

			s32  sentinel;
			u32  payloadSize;
			u8   payload[ payloadSize ];
		};

		struct VEG_VFX {
			char     header[ 8 ];
			u8       unknown[ 8 ];
			u32      propertyCount;
			Property properties[ propertyCount ];
		};

	}

	struct Veg {
		char          signature[ 8 ];
		u32           vfxCount;
		u8            unknown[ 12 ];

		veg::VEG_VFX  vfxBlocks[ vfxCount ];

		u32           rootPropertyCount;
		veg::Property rootProperties[ rootPropertyCount ];
	};

}
