// *.rht File Format

namespace auto je {

	namespace auto rht {

		struct Header {
			u32 vMajor;
			u32 vMinor;
			u32 nEntries;
			u32 offsetPacks;
			u32 offsetResources;
		};

		struct Entry {
			u32 one;
			u32 number;
			u32 type;
			u32 offset;
			u32 pack;
		};
	}

	struct Rht {
		rht::Header header;
		rht::Entry  entries[ header.nEntries ];
	};

}
