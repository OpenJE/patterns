// rht — Van Buren Resource Hash Table

#pragma once

namespace auto je {

	namespace auto rht {

		enum LumpType : u32 {
			Lump_Model    = 100,
			Lump_Image    = 200,
			Lump_DLG      = 300,
			Lump_8        = 400,
			Lump_SKN      = 500,
			Lump_SKL      = 600,
			Lump_GR2      = 700,
			Lump_INI      = 800,
			Lump_RLZ      = 900,
			Lump_RTD      = 1000,
			Lump_WAV      = 1100,
			Lump_AMX      = 1200,
			Lump_MAP      = 1300,
			Lump_CRT      = 1400,
			Lump_VEG      = 1500,
			Lump_INT      = 1600,
			Lump_RLE      = 1700,
			Lump_ITM      = 1800,
			Lump_PSF      = 1900,
			Lump_GSF      = 2000,
			Lump_GLS      = 2100,
			Lump_SCO      = 2200,
			Lump_PCE      = 2300,
			Lump_WEA      = 2400,
			Lump_ARM      = 2500,
			Lump_DOR      = 2600,
			Lump_USE      = 2700,
			Lump_SST      = 2800,
			Lump_STR      = 2900,
			Lump_ENC      = 3000,
			Lump_WMP      = 3100,
			Lump_PRO      = 3200,
			Lump_SPL      = 3300,
			Lump_FNT      = 3400,
			Lump_AMO      = 3500,
			Lump_CON      = 3600,
			Lump_TOK      = 3700,
		};

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
			u32 nameOffset;
			u32 packOffset;
		};

	}

	struct Rht {
		rht::Header  header;
		rht::Entry   entries[ header.nEntries ];
	};

}