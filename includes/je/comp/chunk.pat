// chunk — Van Buren Chunk Framing
// Reference: vb-pat.md (VBHeader), vb-table.md §9

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine Chunk
#pragma endian little

import std.sys;
import std.mem;
import type.size;
import type.magic;

namespace auto je::comp {

	namespace chunk {

		using Tag<auto Expected> =
			type::Magic<Expected> [[name( "Tag" ), fixed_size( 4 ), static]];

		struct Header<auto ExpectedTag> {
			Tag<ExpectedTag> tag;     // "EMAP", "GENT", etc.
			u32              version;
			Size32           size;    // total bytes including this 12-byte header
		} [[static]];

	}

	struct Chunk<auto Tag> {
		chunk::Header<Tag> header;
	};

	namespace chunk {

		fn payload_size( ref je::comp::Chunk chunk ) {
			Header header      = chunk.header;
			Size32 header_size = std::mem::sizeof( header );

			return header.size >= header_size ? header.size - header_size : 0;
		}

	}

}
