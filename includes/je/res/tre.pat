// tre — Van Buren Octree Map Geometry

#pragma once

namespace auto je {

	struct TRE_ChunkHeader {
		char tag[ 4 ];
		s32  size;
	};

	struct TRE_HEAD {
		s32 version;
		s32 flags;
		s32 field2;
		s32 field3;
	};

	struct TRE_LGTR {
		s32   flags;
		s32   type;
		float colorR;
		float colorG;
		float colorB;
		float posX;
		float posY;
		float posZ;
		float dirX;
		float dirY;
		float dirZ;
		float falloff;
		float radius;
		float intensity;
		float coneInner;
		float coneOuter;
	};

	struct TRE_LGTD {
		s32      count;
		TRE_LGTR lights[ count ];
	};

	struct TRE_LVLD {
		s32   width;
		s32   height;
		float unknownF0;
		float unknownF1;
	};

	struct TRE_MATR {
		u8    raw[ 196 ];
	};

	struct TRE_MATD {
		s32      count;
		TRE_MATR materials[ count ];
	};

	struct TRE_TXTD {
		s32  lightmapStart;
		s32  count2;
	};

	struct TRE_VTXB {
		s32  vertexCount;
	};

	struct TRE_VTXD {
		s32      nodeCount;
		TRE_VTXB nodes[ nodeCount ];
	};

	struct TRE_INFO {
		u8    data[ 64 ];
	};

	struct TRE_IDXS {
		u16   groupData[ 5 ];
		u16   count;
		u16   indices[ count ];
	};

	struct TRE_NODE {
		TRE_INFO info;
	};

	struct TRE_LEAF {
		TRE_INFO info;
	};

    struct TreChunk {
        TRE_ChunkHeader header;

        if (header.tag == "HEAD") {
            TRE_HEAD payload;
        } else if (header.tag == "LGTD") {
            TRE_LGTD payload;
        } else if (header.tag == "LVLD") {
            TRE_LVLD payload;
        } else if (header.tag == "MATD") {
            TRE_MATD payload;
        } else if (header.tag == "TXTD") {
            TRE_TXTD payload;
        } else if (header.tag == "VTXD") {
            TRE_VTXD payload;
        } else if (header.tag == "IDXS") {
            TRE_IDXS payload;
        } else if (header.tag == "NODE") {
            TRE_NODE payload;
        } else if (header.tag == "LEAF") {
            TRE_LEAF payload;
        } else if (header.tag == "INFO") {
            TRE_INFO payload;
        } else if (header.tag == "TREE") {
            u32 treeEnd = $ + header.size;
            while ($ < treeEnd) {
                TreChunk child;
            }
        } else {
            u8 raw[ header.size ];
        }
    };

    struct Tre {
        char signature[ 4 ];
        s32  outerSize;

        while (!std::mem::eof()) {
            TreChunk chunk;
        }
    };

}
