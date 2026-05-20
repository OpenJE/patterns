// gr2 — Granny 3D Model Format
//
// Header-only pattern. Full GR2 parsing requires the Granny runtime.

#pragma once

namespace auto je {

	namespace auto gr2 {

		struct MagicValue {
			u32  value[ 4 ];
			u32  headerSize;
			u32  headerFormat;
			u32  reserved[ 2 ];
		};

		struct Reference {
			u32  sectionIndex;
			u32  offset;
		};

		struct FileHeader {
			u32  version;
			u32  totalSize;
			u32  crc;
			u32  sectionArrayOffset;
			u32  sectionArrayCount;
			Reference rootObjectType;
			Reference rootObject;
			u32  typeTag;
			u32  extraTags[ 4 ];
			u32  stringDatabaseCRC;
			u32  reservedUnused[ 3 ];
		};

	}

	struct GR2 {
		gr2::MagicValue  magic;
		gr2::FileHeader  header;
	};

}
