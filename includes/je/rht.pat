// rht — Van Buren Resource Hash Table

#pragma once

namespace auto je {

	namespace auto rht {

		enum LumpType : u32 {
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
			u32      one;
			u32      number;
			LumpType type;
			u32      offset;
			u32      pack;
		};

		fn pack_offset_to_index(u32 pack) {
			match (pack) {
				(0):   return 0;
				(6):   return 1;
				(16):  return 2;
				(25):  return 3;
				(32):  return 4;
				(42):  return 5;
				(50):  return 6;
				(55):  return 7;
				(63):  return 8;
				(68):  return 9;
				(74):  return 10;
				(81):  return 11;
				(87):  return 12;
				(92):  return 13;
				(97):  return 14;
				(102): return 15;
				(107): return 16;
				(112): return 17;
				(117): return 18;
				(122): return 19;
				(127): return 20;
				(132): return 21;
				(137): return 22;
				(142): return 23;
				(_):   return 0xFFFFFFFF;
		    }
		};

	}

	struct Rht {
		rht::Header  header;
		rht::Entry   entries[ header.nEntries ];
	};

}
