// b3d — Van Buren 3D Model Format

#pragma once

namespace auto je {
namespace auto b3d {

	struct PaddedString {
		s16  length;
		char data[ length ];
	};

	struct TColor {
		float r;
		float g;
		float b;
		float a;
	};

	struct TMater {
		TColor Ambient;
		TColor Diffuse;
		TColor Emissive;
		TColor Specular;
		float  Shininess;
		float  Alpha;
	};

	struct TMaterials {
		PaddedString Mtl_ID;
		PaddedString Name;
		TMater       Mater;
		PaddedString BLEND_STATE;
		PaddedString MATERIAL_TYPE;
		s32          Flag_1;
		s32          Flag_2;
	};

	struct TTextures {
		u8           Unknown1;
		PaddedString Name;
		PaddedString FileName;
		u32          Width;
		u32          Height;
	};

	struct TVertex44 {
		float posX;
		float posY;
		float posZ;
		float normX;
		float normY;
		float normZ;
		u8    b;
		u8    g;
		u8    r;
		u8    a;
		float u;
		float v;
		s32   unk[ 2 ];
	};

	struct TVertex64 {
		float posX;
		float posY;
		float posZ;
		float normX;
		float normY;
		float normZ;
		float colorR;
		float colorG;
		float colorB;
		float colorA;
		s32   texCount1;
		float u1;
		float v1;
		s32   texCount2;
	};

	struct TVert_Bones_Data {
		s32  Bone;
		float Weight;
	};

	struct G3D_SurfaceMaterial {
		u32          Unknown3;
		PaddedString Name;
		u32          a1;
		PaddedString Mtl_ID[ a1 ];
		u8           PostStringByte;
		u32          PreKkUint;
		u32          kk;
		struct { s32 a; s32 b; s32 c; } triangles[ kk / 3 ];
		u8           Unknown2[ kk ];
	};

	struct G3D_SurfaceMaterial44 {
		// Material data variant with fixed prefix, then variable-length search loop (1-16 s32, break on ==1)
		PaddedString Name;
		PaddedString Mtl_ID;
		float        allFloats17[ 17 ];
		PaddedString BLEND_STATE;
		PaddedString MATERIAL_TYPE; // empty in legacy-V35
		s32          postMatTypeInt;
		// Variable tail: up to 16 s32 search values, then Zone + extras on hit.
		// Full loop is not linear; inspect raw bytes after postMatTypeInt.
	};

	struct G3D_Surface {
		u8   u1;
		u8   u2;
		u8   vertexTypeFlag;
		s32  numVerts;
		s32  sizeOfVerts;

		if (vertexTypeFlag == 1) {
			TVertex44 vertices[ numVerts ];
		} else {
			TVertex64 vertices[ numVerts ];
		}

		float unknown6[ 6 ];
		u8    isBones;

		if (isBones == 1) {
			s32  bonesPerVert;
			TVert_Bones_Data boneData[ numVerts * bonesPerVert ];
		}

		s32  numMaterials;

		if (vertexTypeFlag == 1) {
			G3D_SurfaceMaterial44 materials44[ numMaterials ];
			PaddedString materialNames[ numMaterials ];
			s32 matList[ numMaterials ];
			s32 vertCounts[ numMaterials ];
			for (s32 i = 0; i < numMaterials; i++) {
				struct { u16 a; u16 b; u16 c; } triangles44[ matList[i] / 3 ];
			}
		} else {
			G3D_SurfaceMaterial materials[ numMaterials ];
		}
	};

	struct TBone {
		PaddedString Name;
		u16          Unknown1;
		u8           Flag;

		if (Flag != 0) {
			float TranslationX;
			float TranslationZ;
			float TranslationY;
		}
		if (Flag == 3) {
			float RotationX;
			float RotationZ;
			float RotationY;
			float RotationW;
		}
		if (Flag == 2) {
			float UnknownFloat;
		}
	};

	struct NodeTransform {
		PaddedString TransformName;
		u8           Flags;

		if ((Flags & 1) != 0) {
			float TranslationX;
			float TranslationY;
			float TranslationZ;
		}
		if ((Flags & 2) != 0) {
			float RotationX;
			float RotationY;
			float RotationZ;
			float RotationW;
		}
		if ((Flags & 4) != 0) {
			float ScaleX;
			float ScaleY;
			float ScaleZ;
		}
	};

	struct SceneNode {
		while (true) {
			u8 tag;

			if (tag == 0x0B) {
				break;
			}
			if (tag == 0x0C) {
				PaddedString NodeName;
			}
			if (tag == 0x0D) {
				NodeTransform Transform;
			}
			if (tag == 0x0F || tag == 0x19) {
				G3D_Surface Surface;
			}
			if (tag == 0x1B) {
				s32            count;
				PaddedString   zones[ count ];
			}
			if (tag == 0x0A || tag == 0x13) {
				SceneNode Child;
			}
		}
	};

	struct B3d {
		char signature[ 8 ];

		while (true) {
			u8 tag;

			if (tag == 0x01) {
				break;
			}
			if (tag == 0x03) {
				float GlobalScaleFactor;
			}
			if (tag == 0x04) {
				float CoordinateScale;
			}
			if (tag == 0x05) {
				PaddedString CoordinateSystem;
			}
			if (tag == 0x06) {
				s32 Token06_a;
				s32 Token06_b;
				s32 Token06_c;
			}
			if (tag == 0x07) {
				TMaterials Materials;
			}
			if (tag == 0x08 || tag == 0x09) {
				TTextures Textures;
			}
			if (tag == 0x0A || tag == 0x13) {
				SceneNode Node;
			}
			if (tag == 0x0E || tag == 0x18) {
				TBone Bone;
			}
			if (tag == 0x16) {
				s32 Token16;
			}
			if (tag == 0x1C) {
				u8 VersionFlag;
			}
			if (tag == 0x35) {
				u8 LegacyV35;
			}
			if (tag == 0x17) {
				PaddedString Unknown17_a;
				PaddedString Unknown17_b;
				PaddedString Unknown17_c;
				u8           Unknown17_data[ 28 ];
			}
			if (tag == 0x0F || tag == 0x10) {
				TMaterials LegacyMaterials;
			}
			if (tag == 0x18) {
				TBone LegacyBone;
			}
		}
	};

}
}