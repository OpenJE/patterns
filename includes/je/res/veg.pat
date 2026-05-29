// veg — Van Buren Visual Effects File

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine VEG Resource
#pragma endian little

namespace auto je::resource {

	namespace veg {

		struct Property {
			s16  nameLength;
			char name[ nameLength ];

			s16  typeLength;
			char type[ typeLength ];

			u32  sentinel;
			s32  payloadSize;
			u8   payload[ payloadSize ];
		};

		struct VEG_VFX {
			char     header[ 8 ];
			u8       unknown[ 8 ];
			s32      propertyCount;
			Property properties[ propertyCount ];
		};

	}

	struct VEG {
		char          signature[ 8 ];
		s32           vfxCount;
		u8            unknown[ 12 ];

		veg::VEG_VFX  vfxBlocks[ vfxCount ];

		s32           rootPropertyCount;
		veg::Property rootProperties[ rootPropertyCount ];
	};

}
