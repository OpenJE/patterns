// rht — Van Buren Resource Hash Table

#pragma once

namespace je::file::rht {

	enum PackOffset : u32 {
		Invalid = 0xFFFFFFFF,
		PSF = 0,
		INT = 6,
		RLE = 16,
		ITM = 25,
		VEG = 32,
		CRT = 42,
		MAP = 50,
		WAV = 55,
		AMX = 63,
		RTD = 68,
		RLZ = 74,
		INI = 81,
		SKL = 87,
		GR2 = 92,
		SKN = 97,
		EIGHT = 102,
		DLG = 107,
		STR = 112,
		SST = 117,
		USE = 122,
		ARM = 127,
		DOR = 132,
		WEA = 137,
		PCE = 142,
	};

	enum PackIndex : u32 {
		Invalid = 0xFFFFFFFF,
		PSF = 0,
		INT = 1,
		RLE = 2,
		ITM = 3,
		VEG = 4,
		CRT = 5,
		MAP = 6,
		WAV = 7,
		AMX = 8,
		RTD = 9,
		RLZ = 10,
		INI = 11,
		SKL = 12,
		GR2 = 13,
		SKN = 14,
		EIGHT = 15,
		DLG = 16,
		STR = 17,
		SST = 18,
		USE = 19,
		ARM = 20,
		DOR = 21,
		WEA = 22,
		PCE = 23,
	};

	fn pack_offset_to_index(PackOffset offset) {
		match (offset) {
			(PackOffset::PSF):   return PackIndex::PSF;
			(PackOffset::INT):   return PackIndex::INT;
			(PackOffset::RLE):   return PackIndex::RLE;
			(PackOffset::ITM):   return PackIndex::ITM;
			(PackOffset::VEG):   return PackIndex::VEG;
			(PackOffset::CRT):   return PackIndex::CRT;
			(PackOffset::MAP):   return PackIndex::MAP;
			(PackOffset::WAV):   return PackIndex::WAV;
			(PackOffset::AMX):   return PackIndex::AMX;
			(PackOffset::RTD):   return PackIndex::RTD;
			(PackOffset::RLZ):   return PackIndex::RLZ;
			(PackOffset::INI):   return PackIndex::INI;
			(PackOffset::SKL):   return PackIndex::SKL;
			(PackOffset::GR2):   return PackIndex::GR2;
			(PackOffset::SKN):   return PackIndex::SKN;
			(PackOffset::EIGHT): return PackIndex::EIGHT;
			(PackOffset::DLG):   return PackIndex::DLG;
			(PackOffset::STR):   return PackIndex::STR;
			(PackOffset::SST):   return PackIndex::SST;
			(PackOffset::USE):   return PackIndex::USE;
			(PackOffset::ARM):   return PackIndex::ARM;
			(PackOffset::DOR):   return PackIndex::DOR;
			(PackOffset::WEA):   return PackIndex::WEA;
			(PackOffset::PCE):   return PackIndex::PCE;
			(_):                 return 0xFFFFFFFF;
		}
	};

	fn pack_index_to_offset(PackIndex index) {
		match (index) {
			(PackIndex::PSF):   return PackOffset::PSF;
			(PackIndex::INT):   return PackOffset::INT;
			(PackIndex::RLE):   return PackOffset::RLE;
			(PackIndex::ITM):   return PackOffset::ITM;
			(PackIndex::VEG):   return PackOffset::VEG;
			(PackIndex::CRT):   return PackOffset::CRT;
			(PackIndex::MAP):   return PackOffset::MAP;
			(PackIndex::WAV):   return PackOffset::WAV;
			(PackIndex::AMX):   return PackOffset::AMX;
			(PackIndex::RTD):   return PackOffset::RTD;
			(PackIndex::RLZ):   return PackOffset::RLZ;
			(PackIndex::INI):   return PackOffset::INI;
			(PackIndex::SKL):   return PackOffset::SKL;
			(PackIndex::GR2):   return PackOffset::GR2;
			(PackIndex::SKN):   return PackOffset::SKN;
			(PackIndex::EIGHT): return PackOffset::EIGHT;
			(PackIndex::DLG):   return PackOffset::DLG;
			(PackIndex::STR):   return PackOffset::STR;
			(PackIndex::SST):   return PackOffset::SST;
			(PackIndex::USE):   return PackOffset::USE;
			(PackIndex::ARM):   return PackOffset::ARM;
			(PackIndex::DOR):   return PackOffset::DOR;
			(PackIndex::WEA):   return PackOffset::WEA;
			(PackIndex::PCE):   return PackOffset::PCE;
			(_):                return 0xFFFFFFFF;
		}
	};

	enum ResourceType : u32 {
		G3D_Model       = 100,
		TGA_Image       = 200,
		SMA_Script      = 300,
		TRE_Octree      = 400,
		SKN_Skin        = 500,
		SKEL_Skeleton   = 600,
		GR2_Animation   = 700,
		INI_Config      = 800,
		RLZ             = 900,
		RTD             = 1000,
		WAV_Audio       = 1100,
		AMX             = 1200,
		MAP_Map         = 1300,
		CRT_ENT_Critter = 1400,
		VEG_Vfx         = 1500,
		INT_Interface   = 1600,
		RLE             = 1700,
		ITM             = 1800,
		PSF             = 1900,
		GSF             = 2000,
		GLS             = 2100,
		SCO             = 2200,
		PCE             = 2300,
		WEA_ENT_Weapon  = 2400,
		ARM_ENT_Armor   = 2500,
		DOR_ENT_Door    = 2600,
		USE_ENT_Use     = 2700,
		SST             = 2800,
		STR             = 2900,
		ENC             = 3000,
		WMP             = 3100,
		PRO             = 3200,
		SPL             = 3300,
		FNT             = 3400,
		AMO_ENT_Ammo    = 3500,
		CON_ENT         = 3600,
		TOK_Tokens      = 3700,
	};

	struct Header {
		u32 vMajor;
		u32 vMinor;
		u32 nEntries;
		u32 offsetPacks;
		u32 offsetResources;
	};

	struct Entry {
		u32          one;
		u32          number;
		ResourceType type;
		u32          offset;
		PackOffset   pack;
	};

}

namespace auto je::file {

	struct RHT {
		rht::Header  header;
		rht::Entry   entries[ header.nEntries ];
	};

}
