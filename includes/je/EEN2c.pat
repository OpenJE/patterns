// EEN2c — Entity Visual/Inventory Strings

#pragma once

import je.EEOVc;

namespace auto je {

	struct EEN2c {
		u8      skl_length;
		u8      skl_pad;
		char    skl[ skl_length ];
		u8      invtex_length;
		u8      invtex_pad;
		char    invtex[ invtex_length ];
		u8      acttex_length;
		u8      acttex_pad;
		char    acttex[ acttex_length ];
		u8      sel;
		u8      PostSelGap[ 3 ];
		EEOVc   EEOV;
	};

}