// *.stf File Format

namespace auto je {

	namespace auto stf {

		struct Header {
			char signature[ 8 ];
			u32  num_entries;
		};

		struct Entry {
			char* offset: u32;
			u32   length;
			u8    reserved[ 8 ];
		};

	}

	struct Stf {
		stf::Header header;
		stf::Entry  entries[ header.num_entries ];
	};

}
