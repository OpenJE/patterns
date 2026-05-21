// b3d — Van Buren 3D Model Format

#pragma once
#pragma endian little

import std.string;

import je.comp.vector3;
import je.comp.vector4;

using Vector3f32     = Vector3<float>;
using Vector4f32     = Vector4<float>;
using SizedStringu16 = std::string::SizedString<u16>;

namespace auto je::resource {

	namespace b3d {

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
			SizedStringu16 Mtl_ID;
			SizedStringu16 Name;
			TMater         Mater;
			SizedStringu16 BLEND_STATE;
			SizedStringu16 MATERIAL_TYPE;
			s32            Flag_1;
			s32            Flag_2;
		};

		struct TTextures {
			u8           Unknown1;
			SizedStringu16 Name;
			SizedStringu16 FileName;
			u32          Width;
			u32          Height;
		};

		struct TVertex44 {
			Vector3f32 pos;
			Vector3f32 norm;
			u8    b;
			u8    g;
			u8    r;
			u8    a;
			float u;
			float v;
			s32   unk[ 2 ];
		};

		struct TVertex64 {
			Vector3f32 pos;
			Vector3f32 norm;
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
			SizedStringu16 Name;
			u32          a1;
			SizedStringu16 Mtl_ID[ a1 ];
			u8           PostStringByte;
			u32          PreKkUint;
			u32          kk;
			struct { s32 a; s32 b; s32 c; } triangles[ kk / 3 ];
			u8           Unknown2[ kk ];
		};

		struct G3D_SurfaceMaterial44 {
			// Material data variant with fixed prefix, then variable-length search loop (1-16 s32, break on ==1)
			SizedStringu16 Name;
			SizedStringu16 Mtl_ID;
			float        allFloats17[ 17 ];
			SizedStringu16 BLEND_STATE;
			SizedStringu16 MATERIAL_TYPE; // empty in legacy-V35
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
				SizedString materialNames[ numMaterials ];
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
			SizedStringu16 Name;
			u16          Unknown1;
			u8           Flag;

			if (Flag != 0) {
				Vector3f32 Translation;
			}
			if (Flag == 3) {
				Vector4f32 Rotation;
			}
			if (Flag == 2) {
				float UnknownFloat;
			}
		};

		struct NodeTransform {
			SizedStringu16 TransformName;
			u8           Flags;

			if ((Flags & 1) != 0) {
				Vector3f32 Translation;
			}
			if ((Flags & 2) != 0) {
				Vector4f32 Rotation;
			}
			if ((Flags & 4) != 0) {
				Vector3f32 Scale;
			}
		};

		struct SceneNode {
			while (true) {
				u8 tag;

				match (tag) {
					(0x0B):        break;
					(0x0C):        SizedString NodeName;
					(0x0D):        NodeTransform Transform;
					(0x0F | 0x19): G3D_Surface Surface;
					(0x1B): {
						s32         count;
						SizedString zones[ count ];
					}
					(0x0A | 0x13): SceneNode Child;
				}
			}
		};

		struct B3d {
			char signature[ 8 ];

			while (true) {
				u8 tag;
				match (tag) {
					(0x01):        break;
					(0x03):        float GlobalScaleFactor;
					(0x04):        float CoordinateScale;
					(0x05):        SizedStringu16 CoordinateSystem;
					(0x06):        {
						s32 Token06_a;
						s32 Token06_b;
						s32 Token06_c;
					}
					(0x07):        TMaterials Materials;
					(0x08 | 0x09): TTextures Textures;
					(0x0A | 0x13): SceneNode Node;
					(0x0E | 0x18): TBone Bone;
					(0x16):        s32 Token16;
					(0x1C):        u8 VersionFlag;
					(0x35):        u8 LegacyV35;
					(0x17): {
						SizedString Unknown17_a;
						SizedString Unknown17_b;
						SizedString Unknown17_c;
						u8          Unknown17_data[ 28 ];
					}
					(0x0F | 0x10): TMaterials LegacyMaterials;
					(0x18):        TBone LegacyBone;
				}
			}
		};

	}

}
