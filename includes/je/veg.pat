// veg — Van Buren Visual Effects File

#pragma once

namespace auto je {

	struct VEG_Property {
		s16  nameLen;
		char name[ nameLen ];
		s16  typeLen;
		char type[ typeLen ];
		s32  marker;
		s32  payloadSize;
		u8   payload[ payloadSize ];
	};

	struct VEG_VFX {
		char      header[ 8 ];
		u8        unknown[ 8 ];
		s32       propertyCount;
		VEG_Property properties[ propertyCount ];
	};

	struct Veg {
		char      signature[ 8 ];
		s32       vfxCount;
		u8        unknown[ 12 ];
		VEG_VFX   vfxBlocks[ vfxCount ];
		s32       rootPropertyCount;
		VEG_Property rootProperties[ rootPropertyCount ];
	};

}
